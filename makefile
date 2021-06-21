.SILENT:

ibolit:
	docker-compose up -d workspace nginx php-fpm mariadb redis

api-server:
	docker-compose up -d postgres

ps:
	docker-compose ps

stop:
	docker-compose stop

exec:
	docker-compose exec --user=laradock workspace zsh

exec-root:
	docker-compose exec workspace zsh

build-ibolit:
	docker-compose build workspace nginx php-fpm mariadb redis

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

.DEFAULT_GOAL := ibolit
