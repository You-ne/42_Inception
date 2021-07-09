FROM debian:buster

# install
RUN apt-get update
RUN apt-get install -y mariadb-server
RUN apt-get install -y wget
RUN apt-get install -y vim

RUN userdel mysql

RUN useradd -u 999 mysql

COPY ./start.sh .

CMD bash start.sh

