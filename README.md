# homebrew-tap
Homebrew tap to distribute my apps.

## Cafuné

`cafune.rb` builds Cafuné from a checksum-verified source archive pinned to commit
`45762fa1e10f99dcdc71b07f2637dba813742b6d`. It requires macOS 13+ and Xcode 16.4+
for the build. The Swift dependencies use the committed resolution file.

After this tap update is published, install with `brew install cristianoliveira/tap/cafune`.
No service is started by the formula.

Cafuné is intentionally excluded from `formulae.json` release-bump automation until
its first renamed binary release is published. For now, update the source commit,
version, and verified SHA-256 together. Later, add a `cafune` manifest entry with
`cafune-{{VERSION}}-darwin-arm64.tar.gz` and `cafune-{{VERSION}}-darwin-amd64.tar.gz`
assets containing the `cafune` executable.

## Bump Automation

Formula metadata now lives in `formulae.json` and the update workflow is
automated via bash scripts under `scripts/`:

- `scripts/bump-formula.sh --formula <name>` downloads the latest release,
  recalculates SHA256 sums, keeps the previous minor version as an `@` tap, and
  rewrites the primary formula.
- `scripts/bump-all.sh` loops over every entry in the manifest and runs the
  single-formula workflow (pass `--` followed by any extra `bump-formula.sh`
  flags).
- The `Bump Formula` GitHub Action (Actions tab) wraps the same scripts,
  pushes a branch, and opens a pull request automatically when new releases are
  detected.

See `docs/bump-procedure.md` for detailed instructions, prerequisites, and
troubleshooting notes.
