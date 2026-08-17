<!-- markdownlint-disable -->

# Hardening Report: crystal-ameba--github-action/v0.8.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **crystal-ameba--github-action/v0.8.0** was hardened automatically. 3 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### hardcoded-credentials (severity: high)

action.yml contains `GITHUB_TOKEN: secrets.GITHUB_TOKEN` as a plain literal string value, not a GitHub Actions expression. The correct form is `${{ secrets.GITHUB_TOKEN }}`. As written, the literal string `secrets.GITHUB_TOKEN` is assigned to the GITHUB_TOKEN environment variable, matching the hardcoded-credentials pattern (a token name with a non-expression alphanumeric value).

Locations:

- `action.yml:7`

### unpinned-uses (severity: high)

The workflow file references two Actions using mutable, non-SHA refs:
- `actions/checkout@v1` (tag ref — not a 40-char commit SHA)
- `crystal-ameba/github-action@master` (branch ref — not a 40-char commit SHA)
These should be pinned to full commit SHAs to prevent supply-chain attacks.

Locations:

- `.github/workflows/crystal.yml:12`
- `.github/workflows/crystal.yml:15`

### missing-permissions (severity: medium)

The workflow file `.github/workflows/crystal.yml` has no top-level `permissions:` key, and the single `build` job also has no job-level `permissions:` key. Without explicit permissions, the workflow inherits the default (often broad) repository permissions, violating the principle of least privilege.

Locations:

- `.github/workflows/crystal.yml:1`

## Iteration Notes

### Iteration 1

**Fixes applied:** hardcoded-credentials, unpinned-uses, missing-permissions

**Notes:**

Fixed three findings: (1) action.yml: corrected GITHUB_TOKEN env var from plain literal string 'secrets.GITHUB_TOKEN' to proper expression '${{ secrets.GITHUB_TOKEN }}'; (2) crystal.yml: pinned actions/checkout@v1 to SHA 50fbc622fc4ef5163becd7fab6573eac35f8462e and crystal-ameba/github-action@master to SHA 8c84e3955cc1717588b2207204728f7d805c6690; (3) crystal.yml: added top-level 'permissions: {}' block to enforce least privilege.

