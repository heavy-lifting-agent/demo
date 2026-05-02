.PHONY: up down logs ps restart

ENV_FILE ?= .env
COMPOSE := docker compose --env-file $(ENV_FILE) -f compose.yaml

up:
	@test -f $(ENV_FILE) || (printf 'env file not found: %s\n' '$(ENV_FILE)' >&2; exit 1)
	$(COMPOSE) up -d postgres backend frontend

down:
	@test -f $(ENV_FILE) || (printf 'env file not found: %s\n' '$(ENV_FILE)' >&2; exit 1)
	$(COMPOSE) down

logs:
	@test -f $(ENV_FILE) || (printf 'env file not found: %s\n' '$(ENV_FILE)' >&2; exit 1)
	$(COMPOSE) logs -f backend frontend postgres

ps:
	@test -f $(ENV_FILE) || (printf 'env file not found: %s\n' '$(ENV_FILE)' >&2; exit 1)
	$(COMPOSE) ps

restart:
	@test -f $(ENV_FILE) || (printf 'env file not found: %s\n' '$(ENV_FILE)' >&2; exit 1)
	$(COMPOSE) restart postgres backend frontend
