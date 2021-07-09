# Php enable server to give php files
service php7.3-fpm start

# Wordpress
#mv wordpress/ /var/www/myServer/
#mv /tmp/wp-config.php /var/www/myServer/wordpress

# Php my admin
#mv /tmp/config.inc.php /var/www/myServer/phpmyadmin/config.inc.php

# Allow access to nginx User 
chown -R www-data:www-data /var/www/* # www-data:www-data == user:group ; www-data == nginx
chmod -R 755 /var/www/*

