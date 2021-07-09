FROM debian:buster

#### INSTALLATION ####
RUN apt-get update;\
	apt-get install -y mysql-common; \
	apt-get install -y mariadb-server;\
	apt-get install -y mariadb-client; \
	apt-get install -y vim;\
	apt-get install -y wget;

#### CONFIGURATION ####

#userdel mysql && groupadd -r mysql && useradd -r -g mysql mysql; \
#rm -rf /var/lib/mysql; \
#mkdir -p /var/lib/mysql;\
RUN mkdir -p /var/lib/mysql;\
	mkdir -p /var/log/mysql; \
	mkdir -p /var/run/mysqld; \
	chown mysql:mysql -R /var/lib/mysql;\
	chown mysql:mysql -R /var/log/mysql; \
	chown mysql:mysql -R /var/run/mysqld; \
	mysql_install_db;
#	chmod 777 /var/run/mysqld; \ works but unsafe
#	chmod 777 /var/lib/mysql;
EXPOSE 3306

#### CONTAINER START ####
COPY ./start.sh .
RUN ["chmod", "+x", "./start.sh"]
CMD bash ./start.sh
