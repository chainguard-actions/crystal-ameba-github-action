<!-- markdownlint-disable -->

# Hardening Report: crystal-ameba--github-action/v0.12.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **crystal-ameba--github-action/v0.12.0** was hardened automatically. 3 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### hardcoded-credentials (severity: high)

In action.yml, the env block sets `GITHUB_TOKEN: secrets.GITHUB_TOKEN` as a plain literal string value rather than a GitHub Actions expression (`${{ secrets.GITHUB_TOKEN }}`). This means the literal text "secrets.GITHUB_TOKEN" is assigned to the GITHUB_TOKEN environment variable instead of the actual secret value. While this is likely a misconfiguration rather than a real credential leak, it matches the hardcoded-credentials pattern (a `token` key with an alphanumeric literal value).

Locations:

- `action.yml:8`

### unpinned-uses (severity: high)

The workflow file references two actions using mutable tag/branch refs instead of immutable 40-character commit SHAs, making the workflow vulnerable to supply-chain attacks if those refs are moved:
- `uses: actions/checkout@v4` (tag ref `v4`)
- `uses: crystal-ameba/github-action@master` (branch ref `master`)

Locations:

- `.github/workflows/crystal.yml:13`
- `.github/workflows/crystal.yml:16`

### missing-permissions (severity: medium)

The workflow file has no top-level `permissions:` key and the single job `build` also has no `permissions:` key. Without explicit permissions, the workflow inherits the default repository permissions (which may include write access to contents, packages, etc.), violating the principle of least privilege.

Locations:

- `.github/workflows/crystal.yml:1`

## Iteration Notes

### Iteration 1

**Fixes applied:** hardcoded-credentials, unpinned-uses, missing-permissions

**Notes:**

1. action.yml: Fixed GITHUB_TOKEN env var from plain string literal 'secrets.GITHUB_TOKEN' to proper expression '${{ secrets.GITHUB_TOKEN }}'. 2. .github/workflows/crystal.yml: Pinned actions/checkout@v4 to SHA 11d5960a326750d5838078e36cf38b85af677262 and crystal-ameba/github-action@master to SHA 8c84e3955cc1717588b2207204728f7d805c6690. 3. .github/workflows/crystal.yml: Added top-level 'permissions: contents: read' block to enforce least-privilege access.

