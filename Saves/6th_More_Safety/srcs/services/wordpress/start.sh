 #Php enable server to give php files

# Wordpress
#mv wordpress/ /var/www/myServer/
#mv /tmp/wp-config.php /var/www/myServer/wordpress

# Php my admin
#mv /tmp/config.inc.php /var/www/myServer/phpmyadmin/config.inc.php

# Allow access to nginx User 
#chown -R www-data:www-data /var/www/* # www-data:www-data == user:group ; www-data == nginx
#chown -R www-data:www-data /usr/local/bin/wp
#chmod -R 755 /usr/local/bin/wp
#chmod -R 755 /var/www/*
#su www-data
/usr/sbin/php-fpm7.3 -F
#/usr/bin/php7.3
