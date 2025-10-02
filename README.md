# homebrew-tap
Homebrew tap to distribute my apps.

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
