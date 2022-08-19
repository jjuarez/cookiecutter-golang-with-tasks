#!/usr/bin/env make

.DEFAULT_GOAL  := help
.DEFAULT_SHELL := /bin/bash

VENV     ?= .venv
PIP      := $(VENV)/bin/pip
PIP_OPTS ?= --require-virtualenv --disable-pip-version-check

COOKIECUTTER_CONFIG ?= cookiecutter.json
OUTPUT_DIRECTORY    := ./dist
COOKIECUTTER_OPTS   := --verbose --no-input --skip-if-file-exists


define assert-file
	@$(if $(wildcard $(1) 2>/dev/null),,$(error $(1) does not exist))
endef

.PHONY: help
help: ## Shows this pretty help screen
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make <target>\n\nTargets:\n"} /^[a-zA-Z//_-]+:.*?##/ { printf " %-20s %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

$(VENV):
	@python -m venv $(VENV)
	@. $(VENV)/bin/activate
	@$(PIP) install $(PIP_OPTS) --requirement requirements-dev.txt

.PHONY: setup
setup: $(VENV)

.PHONY: teardown
teardown:
	@rm -fr $(VENV)

.PHONY: activate
activate: setup
	@. $(VENV)/bin/activate

.PHONY: generate
generate: activate ## Generate the project from the template
	$(call assert-file,$(COOKIECUTTER_CONFIG))
	@$(VENV)/bin/cookiecutter $(COOKIECUTTER_OPTS) --config-file $(COOKIECUTTER_CONFIG) --output-dir $(OUTPUT_DIRECTORY) .

.PHONY: test
test: activate ## Unit test
	@$(VENV)/bin/pytest --verbose ./tests/test_*.py

.PHONY: clean
clean: ## Clean the template results
	@rm -fr $(OUTPUT_DIRECTORY)/* ./tests/__pycache__ .pytest_cache
	@find . -type f -iname *.py[co] -delete
