FROM debian:buster

#### INSTALLATION ####

RUN apt-get update;          \
	apt-get install -y nginx; \
	apt-get install -y openssl;\
	apt-get upgrade -y openssl; \
	apt-get install -y vim;

#### CONFIGURATION ####

COPY ./conf.d/myserver.conf /etc/nginx/conf.d/myserver.conf

RUN userdel www-data;                     \
	useradd -U www-data;                   \
	mkdir -p /var/www/myserver/wordpress;   \
	rm -rf /etc/nginx/sites-enabled/default; \
	rm -rf /etc/nginx/sites-available/default;\
	rm -rf /var/www/html/;                     \
	openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out myserver.crt -keyout myserver.key -subj "/C=FR/ST=Ile de France/L=Paris/O=Home/OU=Home/CN=myserver";             \
	mv myserver.crt /etc/ssl/certs/;   \
	mv myserver.key /etc/ssl/private/;  \
	chown -R www-data:www-data var/www/*;\
	chmod -R 755 /var/www/*;

##### CONTAINER START ####

EXPOSE 80 44
CMD ["nginx", "-g", "daemon off;"]
