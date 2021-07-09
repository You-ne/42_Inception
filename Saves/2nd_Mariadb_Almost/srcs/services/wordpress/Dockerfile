
FROM debian:buster

# install
RUN apt-get update
RUN apt-get install -y php7.3
RUN apt-get install -y php7.3-fpm php7.3-mysql
RUN apt-get install -y wget
RUN apt-get install -y php-json php-mbstring
RUN apt-get install -y vim

RUN mkdir -p /var/www/myserver

# get wordpress
RUN wget -c https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz
RUN rm -rf latest.tar.gz

# get php_my_admin
RUN mkdir -p /var/www/myserver/phpmyadmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz --strip-components 1 -C /var/www/myserver/phpmyadmin
RUN rm -rf phpMyAdmin-4.9.0.1-all-languages.tar.gz

# copy files
COPY ./start.sh .
#COPY ./config.inc.php ./var/www/myserver/phpmyadmin/
#COPY ./wp-config.php ./var/www/myserver/phpmyadmin/

CMD bash start.sh
