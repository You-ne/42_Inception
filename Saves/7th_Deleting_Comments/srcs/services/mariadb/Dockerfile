FROM debian:buster

#### INSTALLATION ####

RUN apt-get update;                 \
	apt-get install net-tools;       \
	apt-get install -y mariadb-server;\
	apt-get install -y vim;            \
	rm -f ./etc/mysql/my.cnf;

COPY ./my.cnf ./etc/mysql/my.cnf

#### CONFIGURATION ####

RUN mkdir -p /var/lib/mysql;\
	mkdir -p /var/log/mysql; \
	mkdir -p /var/run/mysqld; \
	chown mysql:mysql -R /var/lib/mysql;\
	chown mysql:mysql -R /var/log/mysql; \
	chown mysql:mysql -R /var/run/mysqld; \
	chown mysql:mysql /etc/mysql/my.cnf;\
	chmod  0444 /etc/mysql/my.cnf;\
	chmod -R 777 /var/run/mysqld;\
	chmod -R 777 /var/lib/mysql;

#### CONTAINER DEPLOYMENT ####
EXPOSE 3306
COPY ./start.sh .
RUN ["chmod", "+x", "./start.sh"]
CMD ["./start.sh"]
