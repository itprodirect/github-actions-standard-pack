.PHONY: setup lint test build dev

setup:
	@echo "Review README.md and docs/ before publishing this repo."

lint:
	@echo "Validate YAML, Markdown, and workflow pin updates in pull requests."

test:
	@echo "Use the example consumers to verify workflow_call usage in GitHub Actions."

build:
	@echo "This repository ships reusable workflows and docs; there is no compiled artifact."

dev:
	@echo "Edit reusable workflows under .github/workflows and keep docs/examples aligned."
