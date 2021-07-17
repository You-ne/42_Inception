FROM debian:buster

#### INSTALLATION ####

RUN apt-get update
RUN apt-get install -y nginx
RUN apt-get install -y openssl
RUN apt-get upgrade -y openssl
RUN apt-get install -y vim

#### CONFIGURATION ####

# uid 83?
# copy files
#COPY ./index.html /var/www/myserver/index.html
#COPY ./myserver.conf ./tmp/myserver.conf
RUN userdel www-data;                     \
	useradd -U www-data;                   \
	mkdir -p /var/www/myserver/wordpress;   \
	rm -rf /etc/nginx/sites-enabled/default; \
	rm -rf /etc/nginx/sites-available/default;\
	rm -rf /var/www/html/;                     \
	openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out myserver.crt -keyout myserver.key -subj "/C=FR/ST=Ile de France/L=Paris/O=Ecole 42/OU=Ecole 42/CN=myserver";             \
	mv myserver.crt /etc/ssl/certs/;   \
	mv myserver.key /etc/ssl/private/;  \
	chown -R www-data:www-data var/www/*;\
	chmod -R 755 /var/www/*;

##### CONTAINER START ####

EXPOSE 80 44
#COPY ./start.sh .
#RUN ["chmod", "+x", "./start.sh"]
#ENTRYPOINT ["./start.sh"]
CMD ["nginx", "-g", "daemon off;"]
