.SILENT:

up:
	docker-compose up -d workspace nginx php-fpm mariadb redis

ps:
	docker-compose ps

stop:
	docker-compose stop

exec:
	docker-compose exec --user=laradock workspace zsh

exec-root:
	docker-compose exec workspace zsh

build:
	docker-compose build workspace nginx php-fpm mariadb redis

build-workspace:
	docker-compose build workspace

.DEFAULT_GOAL := up
