# Security Model

## Shared workflow trust boundary

Consumers hand execution control to this repository when they call a reusable workflow. That means this repo must stay more conservative than a normal application repository.

## Security defaults

- least-privilege permissions first
- no secrets required for basic CI
- no OIDC by default
- pinned action SHAs
- clear, small workflow interfaces

## CodeQL-ready pattern

This repository does not ship a shared CodeQL workflow in v0. Instead, it stays compatible with a simple downstream pattern:

- keep CodeQL in the consuming repository
- run it alongside the reusable CI workflow, not inside it
- avoid coupling language build conventions and security scanning into one shared workflow contract

## What this repo will not do in v0

- manage cloud authentication
- publish to a provider-specific registry by default
- assume custom runners or privileged environments
- hide deployment logic inside generic CI workflows

## Consumer responsibility

Downstream repositories still own:

- their dependency and test commands
- their secret inventory
- any deployment or publish authentication steps
- pinning the reusable workflow reference they consume
