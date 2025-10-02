#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/common.sh"

FORMULA=""
REQUESTED_VERSION=""
DRY_RUN=0
RUN_TESTS=0
KEEP_ARTIFACTS=0

usage() {
  cat <<USAGE
Usage: $(basename "$0") --formula <name> [options]

Options:
  --formula <name>       Formula key defined in formulae.json (required)
  --version <value>      Target release tag or version (defaults to latest)
  --dry-run              Show planned actions without writing files
  --run-tests            Run brew audit/test after updating (requires Homebrew)
  --keep-artifacts       Keep downloaded release archives instead of deleting
  -h, --help             Show this help message
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --formula)
      FORMULA="$2"
      shift 2
      ;;
    --version)
      REQUESTED_VERSION="$2"
      shift 2
      ;;
    --dry-run)
      DRY_RUN=1
      shift
      ;;
    --run-tests)
      RUN_TESTS=1
      shift
      ;;
    --keep-artifacts)
      KEEP_ARTIFACTS=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      die "Unknown argument: $1"
      ;;
  esac
done

if [[ -z "$FORMULA" ]]; then
  usage
  die "--formula is required"
fi

load_formula_config "$FORMULA"

repo="$(config_get_string '.repo')"
tag_prefix="$(config_get_string '.tag_prefix // ""')"
ruby_class="$(config_get_string '.ruby_class')"
desc="$(config_get_string '.desc')"
homepage="$(config_get_string '.homepage')"
formula_file="$(config_get_string '.formula_file // ""')"

if [[ -z "$formula_file" ]]; then
  formula_file="${FORMULA}.rb"
fi

formula_path="${REPO_ROOT}/${formula_file}"
if [[ ! -f "$formula_path" ]]; then
  die "Formula file not found: $formula_file"
fi

current_class="$(grep -E '^class ' "$formula_path" | head -n1 | awk '{print $2}')"
if [[ -z "$current_class" ]]; then
  die "Unable to determine current class name for ${FORMULA}"
fi

current_version_line="$(grep -E "^[[:space:]]*version '" "$formula_path" | head -n1 || true)"
if [[ -z "$current_version_line" ]]; then
  die "Unable to determine current version for ${FORMULA}"
fi

current_version="$(printf '%s' "$current_version_line" | sed -E "s/^[^']*'([^']+)'.*/\1/")"
current_version_core="$(strip_prefix "$current_version" "$tag_prefix")"

ruby_quote() {
  local value="$1"
  value="${value//\\/\\\\}"
  value="${value//"/\\"}"
  printf '%s' "$value"
}

asset_arches=()
while IFS= read -r arch; do
  [[ -z "$arch" ]] && continue
  asset_arches+=("$arch")
done < <(config_get_list '.assets | keys[]')
if [[ ${#asset_arches[@]} -eq 0 ]]; then
  die "No assets configured for ${FORMULA}"
fi

binaries=()
while IFS= read -r bin; do
  [[ -z "$bin" ]] && continue
  binaries+=("$bin")
done < <(config_get_list '.binaries[]')
if [[ ${#binaries[@]} -eq 0 ]]; then
  die "No binaries configured for ${FORMULA}"
fi

test_binary="$(config_get_string '.test.binary // ""')"
test_args=()
while IFS= read -r arg; do
  [[ -z "$arg" ]] && continue
  test_args+=("$arg")
done < <(config_get_list '.test.args[]?')

if [[ -z "$test_binary" && ${#test_args[@]} -gt 0 ]]; then
  test_binary="${binaries[0]}"
fi

if [[ -z "$test_binary" ]]; then
  test_args=()
fi

require_tool curl
require_tool shasum
require_tool jq
require_tool perl

github_api_request() {
  local url="$1"
  local curl_args=("-sS" "-w" "\n%{http_code}" "-H" "Accept: application/vnd.github+json")
  if [[ -n "${GITHUB_TOKEN:-}" ]]; then
    curl_args+=("-H" "Authorization: Bearer ${GITHUB_TOKEN}")
  fi
  curl_args+=("$url")
  local response
  response="$(curl "${curl_args[@]}")"
  local code="${response##*$'\n'}"
  local body="${response%$'\n'${code}}"
  if [[ "$code" -ge 400 ]]; then
    die "GitHub API request failed ($code) for $url"
  fi
  printf '%s' "$body"
}

release_json=""
release_tag=""

if [[ -z "$REQUESTED_VERSION" ]]; then
  log_info "Fetching latest release for ${repo}"
  release_json="$(github_api_request "https://api.github.com/repos/${repo}/releases/latest")"
  release_tag="$(printf '%s' "$release_json" | jq -r '.tag_name')"
  if [[ -z "$release_tag" || "$release_tag" == "null" ]]; then
    die "Unable to determine latest release tag for ${repo}"
  fi
else
  release_tag="$REQUESTED_VERSION"
  if [[ -n "$tag_prefix" && "$release_tag" != "$tag_prefix"* ]]; then
    release_tag="${tag_prefix}${release_tag}"
  fi
  log_info "Validating release ${release_tag} for ${repo}"
  release_json="$(github_api_request "https://api.github.com/repos/${repo}/releases/tags/${release_tag}")"
fi

version_core="$(strip_prefix "$release_tag" "$tag_prefix")"
if [[ -z "$version_core" ]]; then
  die "Resolved version string is empty"
fi

if [[ "$release_tag" == "$current_version" ]]; then
  log_warn "Formula already at ${release_tag}; nothing to do"
  exit 0
fi

log_info "Preparing bump ${current_version} -> ${release_tag}"

tmp_dir="$(mktemp -d)"
cleanup() {
  if [[ $KEEP_ARTIFACTS -eq 0 ]]; then
    rm -rf "$tmp_dir"
  else
    log_info "Keeping downloaded artifacts under $tmp_dir"
  fi
}
trap cleanup EXIT

artifact_basename_from_template() {
  local template="$1"
  local substituted
  substituted="${template//\{\{VERSION\}\}/$release_tag}"
  substituted="${substituted//\{\{VERSION_NO_PREFIX\}\}/$version_core}"
  printf '%s' "$substituted"
}

asset_names=()
asset_urls=()
asset_shas=()

for arch in "${asset_arches[@]}"; do
  template="$(printf '%s' "$FORMULA_CONFIG_JSON" | jq -r --arg arch "$arch" '.assets[$arch]')"
  if [[ -z "$template" || "$template" == "null" ]]; then
    die "Missing asset template for arch '$arch'"
  fi

  asset_file="$(artifact_basename_from_template "$template")"
  download_url="https://github.com/${repo}/releases/download/${release_tag}/${asset_file}"
  asset_path="${tmp_dir}/${asset_file}"

  log_info "Downloading ${download_url}"
  if [[ -n "${GITHUB_TOKEN:-}" ]]; then
    curl -H "Authorization: Bearer ${GITHUB_TOKEN}" -L -f -sS -o "$asset_path" "$download_url"
  else
    curl -L -f -sS -o "$asset_path" "$download_url"
  fi

  sha="$(shasum -a 256 "$asset_path" | awk '{print $1}')"

  asset_names+=("$arch")
  asset_urls+=("$download_url")
  asset_shas+=("$sha")

done

versioned_formula_path=""
if [[ -n "$current_version_core" ]]; then
  IFS='.' read -r current_major current_minor _ <<< "$current_version_core"
  IFS='.' read -r new_major new_minor _ <<< "$version_core"
  current_minor_id="${current_major}.${current_minor:-0}"
  new_minor_id="${new_major}.${new_minor:-0}"

  if [[ "$current_minor_id" != "$new_minor_id" ]]; then
    versioned_formula_file="${formula_file%.rb}@${current_version_core}.rb"
    versioned_formula_path="${REPO_ROOT}/${versioned_formula_file}"
    if [[ -e "$versioned_formula_path" ]]; then
      log_warn "Archive formula ${versioned_formula_file} already exists; skipping copy"
    else
      new_class_suffix="$(class_suffix_from_version "$current_version_core")"
      new_class_name="${ruby_class}AT${new_class_suffix}"
      if [[ $DRY_RUN -eq 1 ]]; then
        log_info "Dry-run: would preserve previous minor as ${versioned_formula_file}"
      else
        log_info "Preserving previous minor as ${versioned_formula_file}"
        cp "$formula_path" "$versioned_formula_path"
        perl -0pi -e "s/^class ${current_class} < Formula$/class ${new_class_name} < Formula/m" "$versioned_formula_path"
      fi
    fi
  fi
fi

ruby_desc="$(ruby_quote "$desc")"
ruby_homepage="$(ruby_quote "$homepage")"

generate_formula() {
  local target_path="$1"
  {
    printf "class %s < Formula\n\n" "$ruby_class"
    printf "  desc \"%s\"\n" "$ruby_desc"
    printf "  homepage \"%s\"\n" "$ruby_homepage"
    printf "  version '%s'\n\n" "$release_tag"

    if [[ ${#asset_names[@]} -eq 2 && " ${asset_names[*]} " == *" arm64 "* && " ${asset_names[*]} " == *" amd64 "* ]]; then
      local arm_index=-1
      local amd_index=-1
      for i in "${!asset_names[@]}"; do
        if [[ "${asset_names[$i]}" == "arm64" ]]; then
          arm_index="$i"
        elif [[ "${asset_names[$i]}" == "amd64" ]]; then
          amd_index="$i"
        fi
      done
      if [[ $arm_index -ge 0 && $amd_index -ge 0 ]]; then
        printf "  if Hardware::CPU.arm?\n"
        printf "    url '%s'\n" "${asset_urls[$arm_index]}"
        printf "    sha256 '%s'\n" "${asset_shas[$arm_index]}"
        printf "  else\n"
        printf "    url '%s'\n" "${asset_urls[$amd_index]}"
        printf "    sha256 '%s'\n" "${asset_shas[$amd_index]}"
        printf "  end\n\n"
      else
        printf "  url '%s'\n" "${asset_urls[0]}"
        printf "  sha256 '%s'\n\n" "${asset_shas[0]}"
      fi
    else
      printf "  url '%s'\n" "${asset_urls[0]}"
      printf "  sha256 '%s'\n\n" "${asset_shas[0]}"
    fi

    printf "  def install\n"
    for bin in "${binaries[@]}"; do
      printf "    bin.install '%s'\n" "$bin"
    done
    printf "  end\n"

    if [[ ${#test_args[@]} -gt 0 ]]; then
      printf "\n  test do\n"
      printf "    system \"#\{bin\}/%s\"" "$test_binary"
      for arg in "${test_args[@]}"; do
        printf ", \"%s\"" "$arg"
      done
      printf "\n  end\n"
    fi

    printf "\nend\n"
  } > "${target_path}.tmp"
  if [[ $DRY_RUN -eq 1 ]]; then
    log_info "Dry-run: formula content generated for ${FORMULA} (no files written)"
    rm -f "${target_path}.tmp"
  else
    mv "${target_path}.tmp" "$target_path"
  fi
}

generate_formula "$formula_path"

if [[ $DRY_RUN -eq 1 ]]; then
  log_info "Dry-run complete; no files updated"
  exit 0
fi

if [[ -n "$versioned_formula_path" && -f "$versioned_formula_path" ]]; then
  log_info "Wrote ${versioned_formula_path}"
fi
log_info "Updated ${formula_path}"

if [[ $RUN_TESTS -eq 1 ]]; then
  if command -v brew >/dev/null 2>&1; then
    log_info "Running brew audit --strict --online ${FORMULA}"
    brew audit --strict --online "${FORMULA}"
    if [[ ${#test_args[@]} -gt 0 ]]; then
      log_info "Running brew test ${FORMULA}"
      brew test "${FORMULA}"
    fi
  else
    log_warn "Homebrew not found; skipping audit/test"
  fi
fi

log_info "Next steps: review git diff and commit changes manually"
