OS := $(shell uname)

start:			## Start the Docker containers
ifeq ($(OS),Darwin)
	docker volume create --name=sf_dev-sync
	docker-sync start
	docker-compose -f docker-compose.yml up -d
else
	docker-compose up -d
endif

stop:           ## Stop the Docker containers
ifeq ($(OS),Darwin)
	docker-compose stop
	rm -fr .docker-sync
	docker-sync stop
else
	docker-compose stop
endif

install:
	docker network create nginx-ssl
	docker network create net-mysql
	make start

rebuild:		## Restart the Docker containers using updated Dockerfile
	docker-compose -f docker-compose-dev.yml up --build -d

reinstall:		## Rebuild the Docker containers
	docker stop $$(docker ps -aq)
	docker rm $$(docker container ls -aq)
	docker rmi $$(docker images -q)
	rm -fr ./docker-sync
	rm -fr ./.data
	make prune
	make install

restart:		## Restart the Docker containers
	make stop && make start

prune:
	docker system prune -a
	docker container prune -f
	## sudo docker volume rm $(sudo docker volume ls -qf dangling=true)
	docker image prune -f
	docker volume prune -f
	docker network prune -f
