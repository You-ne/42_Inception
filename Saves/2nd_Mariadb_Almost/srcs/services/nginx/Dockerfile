FROM debian:buster

#### INSTALLATION ####

RUN apt-get update
RUN apt-get install -y nginx
RUN apt-get install -y openssl
RUN apt-get upgrade -y openssl
RUN apt-get install -y vim

#### CONFIGURATION ####

# copy files
#COPY ./index.html /var/www/myserver/index.html
#COPY ./myserver.conf ./tmp/myserver.conf
RUN mkdir -p /var/www/myserver/
RUN userdel www-data
RUN useradd -u 83 www-data
EXPOSE 80 443

##### CONTAINER START ####

COPY ./start.sh .
RUN ["chmod", "+x", "./start.sh"]
ENTRYPOINT ["./start.sh"]
#CMD ["nginx", "-g", "daemon off;"]
