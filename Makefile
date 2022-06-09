SHELL:= /usr/bin/env bash
PAAS_PASSWORD_STORE_DIR := ${HOME}/.paas-pass


.PHONY: upload-ghcr-secrets
upload-ghcr-secrets: export PASSWORD_STORE_DIR = $(PAAS_PASSWORD_STORE_DIR)
upload-ghcr-secrets:
	gh secret set CI_USER_USERNAME < <(pass github.com/ci-user-username)
	gh secret set CI_USER_CONTAINER_REGISTRY_TOKEN < <(pass github.com/ci-user-container-registry-token)
	gh secret set DOCKERHUB_USERNAME < <(pass dockerhub/ci/id)
	gh secret set DOCKERHUB_PASSWORD < <(pass dockerhub/ci/password)
