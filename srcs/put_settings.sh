# Run PHP's FastCGI extension
bash /etc/init.d/php7.3-fpm start

# Set SSL-certificate
mkdir /var/ssl/
openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 \
	-keyout /var/ssl/localhost.key \
	-out /var/ssl/localhost.crt \
	-subj "/C=RU/ST=Tatarstan/L=Kazan/O=Example-Certificates/CN=localhost.local"

# Run nginx
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost
service nginx start

# Install and configure WordPress
wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz
tar -xvf /tmp/wordpress.tar.gz -C /var/www/html
chown -R www-data:www-data /var/www/html/wordpress
chmod -R 775 /var/www/html/wordpress

# Configure MariaDB
mv /tmp/wp-config.php /var/www/html/wordpress/
service mysql start
echo "CREATE DATABASE poop_zemli DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mariadb
echo "GRANT ALL ON poop_zemli.* TO 'root'@'localhost';" | mariadb
# echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('kai');" | mariadb
echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mariadb
echo "FLUSH PRIVILEGES;" | mariadb

# Download and uparchive phpmyadmin
wget -O phpmyadmin.tar.gz https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
tar -xvf phpmyadmin.tar.gz -C /var/www/html/
mv /var/www/html/phpMyAdmin-5.0.4-all-languages /var/www/html/phpmyadmin
mv /tmp/config.inc.php /var/www/html/phpmyadmin/


bash
