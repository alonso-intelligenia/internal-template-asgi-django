runner=$(shell whoami)

UID := $(shell id -u)
GID := $(shell id -g)

PROJECTNAME := {{project_name}}-backend
PROJECTNAME_DEV := $(PROJECTNAME)-dev
PROJECTNAME_PROD := $(PROJECTNAME)-prod

COMPOSE_DEV := env UID=${UID} GID=${GID} docker compose -p $(PROJECTNAME_DEV)
COMPOSE_PROD := env UID=${UID} GID=${GID} docker compose -p $(PROJECTNAME_PROD) -f docker-compose.production.yml

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: build-dev

build-dev: ## Build developer containers for services
	$(COMPOSE_DEV) build

build-production: ## Build production containers for services
	$(COMPOSE_PROD) build

up: up-dev

up-dev: ## Run developer for all services
	$(COMPOSE_DEV) up

down: down-dev

down-dev: ## Stop and remove all developer service containers
	$(COMPOSE_DEV) down --remove-orphans

down-dev-all: ## Stop and remove all service containers, networks and volumes
	$(COMPOSE_DEV) down --remove-orphans -v

# Django shortcuts

newapp: ## Create new backend app, expects name argument (i.e.: make newapp name=xxxxx)
	$(COMPOSE_DEV) run --rm django django-admin startapp '$(name)'
	sudo chown -R $(runner):$(runner) $(name)
	mv $(name) {{project_name}}_backend/$(name)

makemigrations: ## Run makemigrations command in django container.
	$(COMPOSE_DEV) run --rm django python manage.py makemigrations
	sudo -S chown -R $(runner):$(runner) -Rf .

mergemigrations: ## Run mergemigrations command in django container.
	$(COMPOSE_DEV) run --rm django python manage.py makemigrations --merge
	sudo -S chown -R $(runner):$(runner) -Rf .

migrate: ## Run migrate command in django container.
	$(COMPOSE_DEV) run --rm django python manage.py migrate

createsuperuser: ## Create superuser.
	$(COMPOSE_DEV) run --rm django python manage.py createsuperuser

bash-shell: ## Exec backend bash shell
	$(COMPOSE_DEV) exec -it django bash

# Unit tests things

pytest: ## Run pytest command in django container.
	$(COMPOSE_DEV) run --rm django pytest -v

show_urls: ## Run makemigrations command in django container.
	$(COMPOSE_DEV) run --rm django python manage.py show_urls

bash-shell: ## Exec backend bash shell
	$(COMPOSE_DEV) exec -it django bash
