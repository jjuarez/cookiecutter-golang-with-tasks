#!/usr/bin/env make

.DEFAULT_GOAL    := help
.DEFAULT_SHELL   := /bin/sh

OUTPUT_DIRECTORY := ./dist
BINARY           := $(OUTPUT_DIRECTORY)/{{cookiecutter.project.github.repository}}

.PHONY: help
help:
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make <target>\n\nTargets:\n"} /^[a-z0-9//_-]+:.*?##/ { printf " %-15s %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

$(BINARY):
	@go build -v -o $(OUTPUT_DIRECTORY) ./...

.PHONY: build
build: $(BINARY) ## Builds the binary

.PHONY: run
run: build ## Runs the latest binary
	@$(BINARY)

.PHONY: test
test: ## Testing all the things
	@go test -v ./...

.PHONY: clean
clean: ## Clean the generated products
	@go clean
	@rm -fr $(BINARY) $(OUTPUT_DIRECTORY)/*

.PHONY: all
all: clean build test run
