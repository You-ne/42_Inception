FROM debian:buster

# install
RUN apt-get update
RUN apt-get install -y nginx
RUN apt-get install -y openssl
RUN apt-get upgrade -y openssl
RUN apt-get install -y vim

RUN mkdir -p /var/www/myserver/

# copy files
#COPY ./index.html /var/www/myserver/index.html
COPY ./myserver.conf ./tmp/myserver.conf
COPY ./start.sh .
RUN userdel www-data
RUN useradd -u 83 www-data
EXPOSE 80 443

CMD bash start.sh
