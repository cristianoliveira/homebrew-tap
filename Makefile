.PHONY: help
help: ## Lists the available commands. Add a comment with '##' to describe a command.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST)\
		| sort\
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: ergo
ergo: ## Generate ergo latest release version
	sh ./generate-ergo-version.sh

.PHONY: funzzy
funzzy: ## Generate funzzy latest release version
	sh ./generate-funzzy-version.sh
