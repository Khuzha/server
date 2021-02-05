# Download and uparchive phpmyadmin
wget -O phpmyadmin.tar.gz https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
tar -xvf phpmyadmin.tar.gz -C /var/www/html/
mv /var/www/html/phpMyAdmin-5.0.4-all-languages /var/www/html/phpmyadmin
chown -R www-data:www-data /var/lib/phpmyadmin
