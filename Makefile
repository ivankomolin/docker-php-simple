include .env

build:
	docker build -t ${PROJECT} .

up:
	docker run -d --name ${PROJECT} \
		-p 8000:8000 \
		-v ${PWD}/src/:/app/ \
		${PROJECT} bash -c " \
			groupmod --non-unique --gid $(shell id -u) www-data && \
			usermod --non-unique --uid $(shell id -g) www-data && \
			sudo -EH -u www-data php -S 0.0.0.0:8000 -t /app/ \
		"

down:
	docker stop ${PROJECT} && docker rm ${PROJECT}

restart:
	docker restart ${PROJECT}

logs:
	docker logs -f ${PROJECT}

bash:
	docker exec -it ${PROJECT} bash -c " \
		groupmod --non-unique --gid $(shell id -u) www-data && \
		usermod --non-unique --uid $(shell id -g) www-data && \
		sudo -EH -u www-data bash \
	"