#!make
include .env

default: help

.PHONY: help
help: ## Show list of commands
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[0;33m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
	@echo ""

.PHONY: backup
backup: ## Create backup
	@.platform/backup

.PHONY: restore
restore: ## Create backup
	@.platform/restore
