# Download and uparchive phpmyadmin
wget -O phpmyadmin.tar.gz https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
tar -xvf phpmyadmin.tar.gz -C /var/www/html/
mv /var/www/html/phpMyAdmin-5.0.4-all-languages /var/www/html/phpmyadmin

# Set SSL-certificate
mkdir /var/ssl/
openssl req -new -nodes -newkey rsa:2048 \
	-out /var/ssl/localhost.crt \
	-keyout /var/ssl/localhost.key \
	-subj "/C=RU/ST=Tatarstan/L=Kazan/O=Example-Certificates/CN=localhost.local"


# chown -R www-data:www-data /var/lib/phpmyadmin

# Run nginx
service nginx start