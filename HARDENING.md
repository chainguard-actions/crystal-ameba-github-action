<!-- markdownlint-disable -->

# Hardening Report: crystal-ameba--github-action/v0.10.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `1`

Action **crystal-ameba--github-action/v0.10.0** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### hardcoded-credentials (severity: high)

In action.yml, the env block sets `GITHUB_TOKEN: secrets.GITHUB_TOKEN` — the value `secrets.GITHUB_TOKEN` is a plain literal string, not a GitHub Actions expression. The correct form requires the expression syntax: `GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}`. As written, the environment variable is set to the literal text "secrets.GITHUB_TOKEN" rather than the actual secret value. While this means the real token is not exposed, it is a misconfiguration that matches the hardcoded-credentials pattern (a literal value assigned to a key containing "token").

The README correctly documents the proper usage:
```yaml
env:
  GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
but action.yml itself is missing the `${{ }}` expression wrapper.

Locations:

- `action.yml:8`

## Iteration Notes

### Iteration 1

**Fixes applied:** hardcoded-credentials

**Notes:**

Fixed action.yml line 8: changed `GITHUB_TOKEN: secrets.GITHUB_TOKEN` to `GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}`. The value was a plain literal string instead of a GitHub Actions expression, meaning the environment variable was being set to the text "secrets.GITHUB_TOKEN" rather than the actual secret token value.

