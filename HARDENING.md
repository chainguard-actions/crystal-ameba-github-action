<!-- markdownlint-disable -->

# Hardening Report: crystal-ameba--github-action/v0.12.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `1`

Action **crystal-ameba--github-action/v0.12.0** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### hardcoded-credentials (severity: high)

In action.yml, the env block sets `GITHUB_TOKEN: secrets.GITHUB_TOKEN` as a literal string value instead of the proper GitHub Actions expression `${{ secrets.GITHUB_TOKEN }}`. This means the GITHUB_TOKEN environment variable is set to the literal text "secrets.GITHUB_TOKEN" rather than the actual secret value. This matches the hardcoded-credentials pattern: a key containing "token" is assigned a non-expression literal value starting with an alphanumeric character.

Locations:

- `action.yml:8`

## Iteration Notes

### Iteration 1

**Fixes applied:** hardcoded-credentials

**Notes:**

Fixed action.yml line 8: replaced the literal string `secrets.GITHUB_TOKEN` with the proper GitHub Actions expression `${{ secrets.GITHUB_TOKEN }}` for the GITHUB_TOKEN environment variable. The previous value was being passed as a literal text string rather than resolving to the actual secret value.

