<!-- markdownlint-disable -->

# Hardening Report: crystal-ameba--github-action/v1.0.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **crystal-ameba--github-action/v1.0.0** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

Two `uses:` references in `.github/workflows/ameba.yml` are pinned to mutable tags/branches rather than full 40-character commit SHAs, making the workflow vulnerable to supply-chain attacks if those refs are moved or compromised:
- `uses: actions/checkout@v7` (tag reference)
- `uses: crystal-ameba/github-action@master` (branch reference)
These should be replaced with their corresponding full SHA digests, e.g. `actions/checkout@<40-char-sha> # v7`.

Locations:

- `.github/workflows/ameba.yml:44`
- `.github/workflows/ameba.yml:49`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses

**Notes:**

Pinned both mutable `uses:` references in `.github/workflows/ameba.yml`:
- `actions/checkout@v7` → `actions/checkout@3d3c42e5aac5ba805825da76410c181273ba90b1 # v7`
- `crystal-ameba/github-action@master` → `crystal-ameba/github-action@16c6fe51bd9098229baaad926209e685e607d57a # master`
SHAs were resolved via lookup_action_sha. The existing `permissions: contents: read` block was already present and correct.

