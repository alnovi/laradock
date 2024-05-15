.SILENT:

#################################################################
# WB
#################################################################

pvz-audit:
	docker-compose up -d workspace postgres-postgis

#################################################################
# IBOLIT
#################################################################

ibolit-api:
	docker-compose up -d workspace nginx php-fpm mariadb redis

ibolit-build-api:
	docker-compose build workspace nginx php-fpm mariadb redis

ibolit-customizer:
	docker-compose up -d workspace mongo mongo-webui redis

ibolit-build-customizer:
	docker-compose build workspace mongo mongo-webui redis

#################################################################
# ALNOVI
#################################################################

alnovi-swagger:
	docker-compose up -d swagger-editor swagger-ui

alnovi-build-swagger:
	docker-compose build swagger-editor swagger-ui

alnovi-go-link:
	docker-compose up -d workspace mongo

alnovi-sso:
	docker-compose up -d workspace postgres

#################################################################
# SERVICES
#################################################################

service-mariadb:
	docker-compose up -d mariadb

service-postgres:
	docker-compose up -d postgres

service-mongo:
	docker-compose up -d mongo

#################################################################
# TOOLS
#################################################################

ps:
	docker-compose ps

stop:
	docker-compose stop

exec:
	docker-compose exec --user=laradock workspace zsh

exec-root:
	docker-compose exec workspace zsh

build-workspace:
	docker-compose build workspace

prune-all:
	docker system prune --force
	docker system prune --volumes
	docker container prune --force
	docker image prune --force
	docker image prune -a
	docker volume prune --force
	docker network prune --force
	docker system df

.DEFAULT_GOAL := pvz-audit
