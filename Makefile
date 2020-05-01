include .env

build:
	docker build -t ${PROJECT} .

up:
	docker run -d --name ${PROJECT} \
		-p 8000:8000 \
		-v ${PWD}/src/:/app/ \
		${PROJECT} php -S 0.0.0.0:8000 -t /app/

down:
	docker stop ${PROJECT} && docker rm ${PROJECT}

restart:
	docker restart ${PROJECT}

logs:
	docker logs -f ${PROJECT}

bash:
	docker exec -it ${PROJECT} bash