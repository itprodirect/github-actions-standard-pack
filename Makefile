.PHONY: setup lint test build dev

setup:
	@echo "Review README.md, docs/, and scripts/validate-repo.ps1 before publishing this repo."

lint:
	@powershell -NoProfile -ExecutionPolicy Bypass -File scripts/validate-repo.ps1 -PolicyOnly

test:
	@powershell -NoProfile -ExecutionPolicy Bypass -File scripts/validate-repo.ps1

build:
	@echo "This repository ships reusable workflows and docs; there is no compiled artifact."

dev:
	@echo "Edit reusable workflows under .github/workflows, run local validation, and keep docs/examples aligned."
