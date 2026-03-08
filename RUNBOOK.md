# Runbook

## Routine maintenance

### Validate locally before a PR

1. Run `powershell -NoProfile -ExecutionPolicy Bypass -File scripts/validate-repo.ps1`.
2. Review any generated artifacts or cache directories before committing.
3. If branch protection is updated, use the exact check names GitHub reports rather than the caller job ids for reusable-workflow jobs.

### Refresh action pins

1. Review Dependabot pull requests for GitHub Actions updates.
2. Confirm the upstream commit SHA and release notes.
3. Validate that permissions and inputs still match repo policy.
4. Update docs if consumer behavior changes.

### Cut a release

1. Confirm examples still reflect the published workflow contracts.
2. Update `CHANGELOG.md`.
3. Create and push a version tag using the rules in `docs/versioning.md`.
4. Let `.github/workflows/release.yaml` publish the GitHub release for that tag.
5. Announce the new immutable ref for downstream consumers.

### Triage a workflow issue

1. Reproduce with the smallest example consumer possible.
2. Check whether `.github/workflows/repo-ci.yaml` failed on the local example jobs or policy checks.
3. Check whether the issue is a contract bug, doc gap, or unsupported edge case.
4. Fix the workflow and its docs together.
5. Note any breaking behavior in `CHANGELOG.md`.

