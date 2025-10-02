#!/usr/bin/env bash

# Common helpers shared by bump scripts. All scripts source this file.

set -o errexit
set -o pipefail
set -o nounset

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
FORMULAE_MANIFEST="${REPO_ROOT}/formulae.json"

log_info() {
  printf '==> %s\n' "$*"
}

log_warn() {
  printf ':: %s\n' "$*"
}

log_error() {
  printf '!! %s\n' "$*" >&2
}

die() {
  log_error "$*"
  exit 1
}

require_tool() {
  local tool="$1"
  if ! command -v "$tool" >/dev/null 2>&1; then
    die "Required tool '$tool' not found on PATH"
  fi
}

ensure_manifest() {
  if [[ ! -f "$FORMULAE_MANIFEST" ]]; then
    die "Manifest not found at $FORMULAE_MANIFEST"
  fi
}

load_formula_config() {
  ensure_manifest
  require_tool jq

  local formula="$1"
  FORMULA_CONFIG_JSON="$(jq -c --arg formula "$formula" '.[ $formula ]' "$FORMULAE_MANIFEST")"
  if [[ -z "$FORMULA_CONFIG_JSON" || "$FORMULA_CONFIG_JSON" == "null" ]]; then
    die "Formula '$formula' not found in manifest"
  fi
}

config_get_string() {
  local filter="$1"
  local value
  value="$(printf '%s' "$FORMULA_CONFIG_JSON" | jq -r "$filter")"
  if [[ "$value" == "null" ]]; then
    value=""
  fi
  printf '%s' "$value"
}

config_get_list() {
  local filter="$1"
  printf '%s' "$FORMULA_CONFIG_JSON" | jq -r "$filter"
}

config_has_key() {
  local filter="$1"
  local value
  value="$(printf '%s' "$FORMULA_CONFIG_JSON" | jq "$filter")"
  [[ "$value" != "null" ]]
}

# Formats a class suffix (e.g. 0.1.4 -> 014) for @ version formulae.
class_suffix_from_version() {
  local version_core="$1"
  printf '%s' "${version_core//./}"
}

strip_prefix() {
  local value="$1"
  local prefix="$2"
  if [[ -n "$prefix" && "$value" == "$prefix"* ]]; then
    printf '%s' "${value#${prefix}}"
  else
    printf '%s' "$value"
  fi
}
