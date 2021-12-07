TOP_DIR=.
README=$(TOP_DIR)/README.md

VERSION=$(strip $(shell cat version))

build:
	@echo "Building the software..."

init: install dep
	@echo "Initializing the repo..."

github-init:
	@echo "Initializing the repo..."
	@sudo yarn global add @abtnode/cli

install:
	@echo "Install software required for this repo..."
	@yarn global add @abtnode/cli

dep:
	@echo "Install dependencies required for this repo..."

test:
	@echo "Running test suites..."

lint:
	@echo "Linting the software..."

doc:
	@echo "Building the documenation..."

clean:
	@echo "Cleaning the build..."
	@rm -rf .blocklet

run:
	@echo "Running the software..."

include .makefiles/*.mk

.PHONY: build init install dep pre-build post-build all test doc precommit github-action-test clean watch run bump-version create-pr
