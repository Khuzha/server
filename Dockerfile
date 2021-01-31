FROM debian:buster

RUN apt update && apt install -y nginx \
			nodejs \
			mariadb-server \
			php libapache2-mod-php php-mysql

WORKDIR "/app"
COPY . .


EXPOSE 80 443

CMD [ "node", "hello.js" ]