#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
tmp_dir="$(mktemp -d)"
trap 'rm -rf "$tmp_dir"' EXIT

fixture="$tmp_dir/repo"
mkdir -p "$fixture/scripts" "$tmp_dir/bin"
cp "$REPO_ROOT/scripts/bump-formula.sh" "$REPO_ROOT/scripts/common.sh" "$fixture/scripts/"

cat > "$fixture/formulae.json" <<'JSON'
{
  "sample": {
    "ruby_class": "Sample",
    "formula_file": "sample.rb",
    "repo": "example/sample",
    "tag_prefix": "v",
    "macos_minimum": "ventura",
    "desc": "Sample formula",
    "homepage": "https://example.com/sample",
    "assets": { "amd64": "sample-{{VERSION}}.tar.gz" },
    "binaries": ["sample"]
  }
}
JSON

cat > "$fixture/sample.rb" <<'RUBY'
class Sample < Formula
  desc "Sample formula"
  homepage "https://example.com/sample"
  version 'v0.1.0'
end
RUBY

cat > "$tmp_dir/bin/curl" <<'CURL'
#!/usr/bin/env bash
set -euo pipefail
url="${!#}"

if [[ "$url" == https://api.github.com/* ]]; then
  printf '{"tag_name":"v0.1.1"}\n200'
  exit 0
fi

output=""
while [[ $# -gt 0 ]]; do
  if [[ "$1" == "-o" ]]; then
    output="$2"
    shift 2
  else
    shift
  fi
done

[[ -n "$output" ]] || { printf 'curl fixture expected -o for %s\n' "$url" >&2; exit 1; }
printf 'fixture archive\n' > "$output"
CURL
chmod +x "$tmp_dir/bin/curl"
export PATH="$tmp_dir/bin:$PATH"

run_bump() {
  "$fixture/scripts/bump-formula.sh" --formula sample --version "$1"
}

run_bump v0.1.1 >/dev/null
grep -Fq '  depends_on macos: :ventura' "$fixture/sample.rb"

jq 'del(.sample.macos_minimum)' "$fixture/formulae.json" > "$tmp_dir/formulae.json"
mv "$tmp_dir/formulae.json" "$fixture/formulae.json"
run_bump v0.1.2 >/dev/null
if grep -Fq 'depends_on macos:' "$fixture/sample.rb"; then
  printf 'Unexpected macOS dependency for a formula without macos_minimum\n' >&2
  exit 1
fi

jq --arg minimum 'ventura; puts("unsafe")' '.sample.macos_minimum = $minimum' \
  "$fixture/formulae.json" > "$tmp_dir/formulae.json"
mv "$tmp_dir/formulae.json" "$fixture/formulae.json"
before="$(shasum -a 256 "$fixture/sample.rb" | awk '{print $1}')"
if run_bump v0.1.3 >"$tmp_dir/invalid-minimum.log" 2>&1; then
  printf 'Expected unsupported macOS minimum to fail\n' >&2
  exit 1
fi
grep -Fq 'Unsupported macOS minimum' "$tmp_dir/invalid-minimum.log"
after="$(shasum -a 256 "$fixture/sample.rb" | awk '{print $1}')"
[[ "$before" == "$after" ]] || { printf 'Invalid minimum modified the formula\n' >&2; exit 1; }

printf 'macos_minimum generator regression checks passed (no brew install or live download)\n'
