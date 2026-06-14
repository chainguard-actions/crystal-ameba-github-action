<!-- markdownlint-disable -->

# Hardening Report: crystal-ameba--github-action/v0.11.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `1`

Action **crystal-ameba--github-action/v0.11.0** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### hardcoded-credentials (severity: high)

In action.yml, the env block sets `GITHUB_TOKEN: secrets.GITHUB_TOKEN`. The value `secrets.GITHUB_TOKEN` is a plain literal string, not a GitHub Actions expression (which would be written as `${{ secrets.GITHUB_TOKEN }}`). This means the environment variable GITHUB_TOKEN is set to the literal text "secrets.GITHUB_TOKEN" rather than the actual secret value — and it constitutes a hardcoded credential assignment matching the pattern `token: <alphanumeric-value>`.

Locations:

- `action.yml:8`

## Iteration Notes

### Iteration 1

**Fixes applied:** hardcoded-credentials

**Notes:**

Fixed action.yml line 8: changed `GITHUB_TOKEN: secrets.GITHUB_TOKEN` (a plain literal string) to `GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}` (a proper GitHub Actions expression). This ensures the actual secret value is passed to the Docker container at runtime rather than the literal text "secrets.GITHUB_TOKEN".

