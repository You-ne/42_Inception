FROM debian:buster

#### CONTAINER INITIALISATION ####
RUN apt-get update;                          \
	apt-get install -y php7.3;                \
	apt-get install -y php7.3-fpm;             \
	apt-get install -y php7.3-mysql;            \
	apt-get install -y php-json php-mbstring;    \
	apt-get install -y wget;                      \
	apt-get install -y vim;                        \
	apt-get install -y less;                        \
	apt-get install -y mariadb-client;                \
	mkdir -p /var/www/myserver;

COPY ./uploads.ini ./tmp

#### FURTHER INSTALLATION ####
RUN wget -c --output-document='/usr/local/bin/wp' --no-check-certificate \
	'https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar'; \
	wget -c https://wordpress.org/latest.tar.gz;         \
	tar -xvzf latest.tar.gz;                              \
	rm -rf latest.tar.gz;                                  \
	rm -f /var/www/myserver/wordpress/wp-config-sample.php; \
	mv ./wordpress /var/www/myserver;                        \
	cp ./tmp/uploads.ini /etc/php/7.3/apache2/conf.d;         \
	cp ./tmp/uploads.ini /etc/php/7.3/fpm/conf.d;              \
	cp ./tmp/uploads.ini /etc/php/7.3/cli/conf.d;               \
	touch /var/log/php7.3-fpm.log;                               \
	mkdir -p /run/php;                                            \
	mkdir -p /etc/php/7.3/fpm/pool.d;


#### PERMISSIONS ADMIN ####
RUN chown -R www-data:www-data /usr/local/bin/wp; \
	chmod -R 755 /usr/local/bin/wp;                \
    chown -R www-data:www-data /var/www/*;          \
	chmod -R 755 /var/www/*;                         \
	chown -R www-data:www-data /run/php;              \
	chmod -R 755 /run/php;                             \
	chown  www-data:www-data /var/log/php7.3-fpm.log;   \
	chmod  755 /var/log/php7.3-fpm.log;

#### COPY CONFIG AND SCRIPT FILES ####
COPY ./server_pool.conf ./etc/php/7.3/fpm/pool.d
COPY ./wp-config.php /var/www/myserver/wordpress/wp-config.php

#### CONTAINER DEPLOYMENT ####
#CMD ["ping", "mariadb"]
CMD ["/usr/sbin/php-fpm7.3", "-F"]
