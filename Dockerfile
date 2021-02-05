FROM debian:buster

LABEL maintainer="zskeeter"

RUN apt update && apt install -y nginx \
			wget \
			nodejs \
			mariadb-server \
			php libapache2-mod-php php-mysql

COPY ./srcs/* /tmp/
COPY ./srcs/localhost /etc/nginx/sites-available
COPY hello.js ./

EXPOSE 80 443

RUN bash /tmp/put_settings.sh
CMD node hello.js