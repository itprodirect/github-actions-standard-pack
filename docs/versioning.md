# Versioning

## Policy

This repository should use semantic versioning for published workflow contracts.

- patch: doc fixes, internal cleanup, non-breaking pin refreshes
- minor: new backwards-compatible inputs or workflow additions
- major: breaking input changes, behavior changes, permission changes, or removals

## Consumer guidance

- prefer immutable refs in downstream repos
- use release tags for normal adoption
- use a full commit SHA for strict change control

## Breaking change rule

If a downstream repo would need to edit its workflow call or operational expectations after an update, treat the change as breaking and cut a major version.
