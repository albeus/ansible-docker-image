.PHONY: all build tag-latest tag-version  publish-latest

APP_NAME=ansible
DOCKER_REPO=dockerhub.ebi.ac.uk/sd-public/docker-images/ansible-image

build:
	docker build -t ${APP_NAME} .

tag-latest: ## Generate container `{version}` tag
	@echo 'create tag latest'
	docker tag $(APP_NAME) $(DOCKER_REPO)/$(APP_NAME):latest

tag-version: ## Generate container `latest` tag
	@echo 'create tag $(VERSION)'
	docker tag $(APP_NAME) $(DOCKER_REPO)/$(APP_NAME):$(VERSION)

publish-latest: tag-latest ## Publish the `latest` taged container to ECR
	@echo 'publish latest to ${DOCKER_REPO}'
	docker push ${DOCKER_REPO}/$(APP_NAME):latest
