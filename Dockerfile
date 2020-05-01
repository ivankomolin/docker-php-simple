FROM php:7.3-alpine

WORKDIR /app

RUN apk add bash && \
	curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer