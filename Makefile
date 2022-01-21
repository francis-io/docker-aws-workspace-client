ifneq (,)
.error This Makefile requires GNU Make.
endif

# Supress printing of the make command
.SILENT:

.DEFAULT_GOAL := help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: build
build: ## Build the workspace container.
	docker build -t aws-workspaces .

.PHONY: run
run: ## Run the AWS Workspace Client
	docker run --rm -v /tmp/.X11-unix:/tmp/.X11-unix \
	--net=host \
	-v "${HOME}/.aws-workspaces":"/root/.local/share/Amazon Web Services" \
	-e DISPLAY=${DISPLAY} \
	-e --env="DISPLAY" \
	aws-workspaces

#xhost +
# docker run -it --rm --name aws-workspaces \
#   -v /tmp/.X11-unix:/tmp/.X11-unix \
#   -v "$HOME/.aws-workspaces":"/root/.local/share/Amazon Web Services" \
#   -e DISPLAY=${DISPLAY} \
#   aws-workspaces