#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/common.sh"

CONTINUE_ON_ERROR=0
FORWARD_ARGS=()

usage() {
  cat <<USAGE
Usage: $(basename "$0") [options] [-- <extra bump-formula args>]

Options:
  --continue-on-error    Attempt all entries even if one bump fails
  -h, --help             Show this help message

Examples:
  $(basename "$0") -- --dry-run
  $(basename "$0") --continue-on-error -- --run-tests
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --continue-on-error)
      CONTINUE_ON_ERROR=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    --)
      shift
      while [[ $# -gt 0 ]]; do
        FORWARD_ARGS+=("$1")
        shift
      done
      break
      ;;
    *)
      FORWARD_ARGS+=("$1")
      shift
      ;;
  esac
done

ensure_manifest
require_tool jq

formulas=()
while IFS= read -r name; do
  [[ -z "$name" ]] && continue
  formulas+=("$name")
done < <(jq -r 'keys[]' "$FORMULAE_MANIFEST")

if [[ ${#formulas[@]} -eq 0 ]]; then
  die "No formula entries defined in manifest"
fi

failures=()

for formula in "${formulas[@]}"; do
  log_info "Processing ${formula}"
  if "${SCRIPT_DIR}/bump-formula.sh" --formula "$formula" "${FORWARD_ARGS[@]}"; then
    log_info "Finished ${formula}"
  else
    status=$?
    log_error "Formula ${formula} failed (exit ${status})"
    failures+=("${formula}")
    if [[ $CONTINUE_ON_ERROR -eq 0 ]]; then
      exit "$status"
    fi
  fi
  log_info "---"
  echo
done

if [[ ${#failures[@]} -gt 0 ]]; then
  log_warn "Completed with failures: ${failures[*]}"
  exit 1
fi

log_info "All formula bumps completed successfully"
