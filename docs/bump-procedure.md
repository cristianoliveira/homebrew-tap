# Bump Procedure

This document explains how to bump Homebrew formulae using the automated bash
tooling bundled with this repository.

## Prerequisites

- macOS or Linux environment with `bash`, `curl`, `jq`, `perl`, and `shasum`
  available. (`jq` is already required by older scripts in this tap.)
- Optional but recommended: `brew` (Homebrew) for running `brew audit`/`brew test`.
- Optional: `GITHUB_TOKEN` environment variable to increase GitHub API rate
  limits and to authenticate downloads for private releases.

## Manifest (`formulae.json`)

All formula metadata lives in a single JSON file. Each key maps to one formula
and describes how to generate its Ruby definition:

```json
{
  "aerospace-scratchpad": {
    "ruby_class": "AerospaceScratchpad",
    "formula_file": "aerospace-scratchpad.rb",
    "repo": "cristianoliveira/aerospace-scratchpad",
    "tag_prefix": "v",
    "desc": "AeroSpace scratchpad - Scratchpad for AeroSpace WM",
    "homepage": "https://github.com/cristianoliveira/aerospace-scratchpad",
    "assets": {
      "arm64": "aerospace-scratchpad-{{VERSION}}-darwin-arm64.tar.gz",
      "amd64": "aerospace-scratchpad-{{VERSION}}-darwin-amd64.tar.gz"
    },
    "binaries": ["aerospace-scratchpad"],
    "test": {
      "binary": "aerospace-scratchpad",
      "args": ["--version"]
    }
  }
}
```

Placeholders supported in asset templates:

- `{{VERSION}}` – the release tag as published (e.g. `v0.2.0`).
- `{{VERSION_NO_PREFIX}}` – the tag without the configured `tag_prefix`
  (e.g. `0.2.0`).

Add new formulae by extending this file and committing the change.

## Single Formula Bump

```
./scripts/bump-formula.sh --formula aerospace-scratchpad
```

What happens:

1. Fetch the latest GitHub release (or a specific `--version <tag>`).
2. Download the declared assets, compute SHA256 sums, and update URLs.
3. Copy the previous formula into `formula@<previous-version>.rb` when the
   minor number changes and rename the class accordingly (e.g.
   `AerospaceScratchpadAT014`).
4. Regenerate the main formula file with fresh metadata and install/test blocks.
5. Remove downloaded archives unless `--keep-artifacts` is provided.

Flags:

- `--dry-run` – perform all API calls and checks but skip writing files.
- `--run-tests` – run `brew audit --strict --online` and `brew test` (when the
  manifest provides a test command) after regenerating the formula.
- `--version <tag>` – pin to a specific release. The `tag_prefix` is added
  automatically when missing.
- `--keep-artifacts` – leave downloaded archives in the temporary directory for
  inspection.

## Bulk Bumps

```
./scripts/bump-all.sh -- --run-tests
```

This helper iterates over every manifest entry and delegates to
`bump-formula.sh`. Pass `--continue-on-error` to attempt all formulae even if one
fails. Arguments after `--` are forwarded to each invocation.

## GitHub Actions

- Trigger `Bump Formula` via the Actions tab.
- Choose a specific manifest key or `all` to run every entry.
- The workflow runs the same bump scripts, pushes a branch, and opens a PR automatically.
- When no releases changed, the run exits without opening a PR.

## After Running the Script

- Review the changes: `git status` and `git diff`.
- A commit `chore(<formula>): bump to <tag>` is created automatically when the git index is clean; inspect it with `git show`.
- If the script skipped the commit (e.g. existing staged changes), commit manually.
- Push and open a pull request as usual.

## Troubleshooting

- **GitHub API rate limits** – export `GITHUB_TOKEN=<token>` before running to
  raise the hourly quota.
- **Missing assets** – verify the asset naming on the GitHub release matches the
  manifest template. Update `formulae.json` if the release pipeline changed.
- **Binary name inside the archive changed** – adjust the `binaries` list so the
  generated `bin.install` lines match the new paths.
- **Existing `@` formula already present** – the script logs a warning and keeps
  the existing file. Remove it manually if you need to regenerate.
- **`jq`/`perl` not found** – install the missing tool or adjust your `PATH`
  before rerunning.

For further adjustments or one-off releases, run the script with `--dry-run` to
preview changes without touching the repository.
