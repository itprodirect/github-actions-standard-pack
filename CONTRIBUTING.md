# Contributing

## Contribution standard

This repo should stay boring, explicit, and reusable. Contributions should improve consistency across consumers, not add knobs for every edge case.

## Before opening a change

- make sure the change belongs in a shared workflow repo
- keep inputs narrowly scoped
- review permissions for least privilege
- pin any new external action by full commit SHA
- update examples and docs if the workflow contract changes

## Pull request expectations

- explain the consumer impact
- describe any permissions or auth changes
- note whether the change is backward compatible
- update or add an ADR if the repo boundary or security stance changes
- expect review requests to follow `.github/CODEOWNERS`
