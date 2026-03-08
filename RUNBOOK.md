# Runbook

## Routine maintenance

### Validate locally before a PR

1. Run `powershell -NoProfile -ExecutionPolicy Bypass -File scripts/validate-repo.ps1`.
2. The script validates policy plus the Node, Python, and Go example consumers.
3. Validation temp output should stay in ignored locations and be removed on success.
4. If branch protection is updated, use the exact check names GitHub reports rather than the caller job ids for reusable-workflow jobs.

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
2. Check whether `.github/workflows/repo-ci.yaml` failed on the Node, Python, or Go example jobs or the policy checks.
3. For Docker, Terraform, or Playwright, treat the consumer docs as the current v0 contract and reproduce with a minimal repo-specific caller.
4. Check whether the issue is a contract bug, doc gap, or unsupported edge case.
5. Fix the workflow and its docs together.
6. Note any breaking behavior in `CHANGELOG.md`.
