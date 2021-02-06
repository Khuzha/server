FROM debian:buster

LABEL maintainer="zskeeter"

RUN apt update && \
	apt install -y nginx \
	wget \
	mariadb-server \
	php php-fpm php-mysql php-cli

COPY ./srcs/* /tmp/
COPY ./srcs/localhost /etc/nginx/sites-available
COPY hello.js ./

EXPOSE 80 443

CMD bash /tmp/put_settings.sh