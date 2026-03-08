# Runbook

## Routine maintenance

### Refresh action pins

1. Review Dependabot pull requests for GitHub Actions updates.
2. Confirm the upstream commit SHA and release notes.
3. Validate that permissions and inputs still match repo policy.
4. Update docs if consumer behavior changes.

### Cut a release

1. Confirm examples still reflect the published workflow contracts.
2. Update `CHANGELOG.md`.
3. Tag the repository using the versioning rules in `docs/versioning.md`.
4. Announce the new immutable ref for downstream consumers.

### Triage a workflow issue

1. Reproduce with the smallest example consumer possible.
2. Check whether `.github/workflows/repo-ci.yaml` failed on the local example jobs or policy checks.
2. Check whether the issue is a contract bug, doc gap, or unsupported edge case.
3. Fix the workflow and its docs together.
4. Note any breaking behavior in `CHANGELOG.md`.
