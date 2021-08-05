FROM debian:buster

#### CONTAINER INITIALISATION ####
#COPY ./start.sh .
RUN apt-get update;                          \
	apt-get install -y php7.3;                \
	apt-get install -y php7.3-fpm;             \
	apt-get install -y php7.3-mysql;            \
	apt-get install -y php-json php-mbstring;    \
	apt-get install -y wget;                      \
	apt-get install -y vim;                        \
	apt-get install -y less;                        \
	mkdir -p /var/www/myserver;

COPY ./uploads.ini ./tmp

#### FURTHER INSTALLATION ####

RUN wget -c --output-document='/usr/local/bin/wp' --no-check-certificate \
	'https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar'; \
	wget -c https://wordpress.org/latest.tar.gz;   \
	tar -xvzf latest.tar.gz;                        \
	rm -rf latest.tar.gz;                            \
	mv ./wordpress /var/www/myserver;                 \
	cp ./tmp/uploads.ini /etc/php/7.3/apache2/conf.d;  \
	cp ./tmp/uploads.ini /etc/php/7.3/fpm/conf.d;       \
	cp ./tmp/uploads.ini /etc/php/7.3/cli/conf.d;        \
	touch /var/log/php7.3-fpm.log;                        \
	mkdir -p /run/php;                                     \
	mkdir -p /etc/php/7.3/fpm/pool.d;

COPY ./server_pool.conf ./etc/php/7.3/fpm/pool.d

#RUN echo '$NGINX_SERVER' >> ./etc/php/7.3/fpm/pool.d/www.conf;

#### PERMISSIONS ADMIN ####
#chmod +x ./start.sh;

RUN chown -R www-data:www-data /usr/local/bin/wp; \
	chmod -R 755 /usr/local/bin/wp;                \
    chown -R www-data:www-data /var/www/*;          \
	chmod -R 755 /var/www/*;                         \
	chown -R www-data:www-data /run/php;              \
	chmod -R 755 /run/php;                             \
	chown  www-data:www-data /var/log/php7.3-fpm.log;   \
	chmod  755 /var/log/php7.3-fpm.log;


#### PHP MYADMIN INSTALLATION ####
#RUN mkdir -p /var/www/myserver/phpmyadmin
#RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
#RUN tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz --strip-components 1 -C /var/www/myserver/phpmyadmin
#RUN rm -rf phpMyAdmin-4.9.0.1-all-languages.tar.gz

#### ADMINER INSTALLATION ####


#### COPY CONFIG AND SCRIPT FILES ####
#COPY ./config.inc.php ./var/www/myserver/phpmyadmin/
#COPY ./wp-config.php ./var/www/myserver/phpmyadmin/

#### CONTAINER DEPLOYMENT ####
#USER www-data
#CMD  ./start.sh
#CMD bash
CMD ["/usr/sbin/php-fpm7.3", "-F"]
#CMD ./start.sh
#CMD ["/usr/bin/php7.3"]
