FROM debian:buster

#### INSTALLATION ####

RUN apt-get update;                 \
	apt-get install net-tools;       \
	apt-get install -y mariadb-server;\
	apt-get install -y vim;            \
	rm -f ./etc/mysql/my.cnf;
#	rm -f ./etc/mysql/mariadb.cnf;       \
#	rm -f ./etc/my.cnf.fallback;
	#apt-get install -y procps;
#	apt-get install -y mariadb-client;\
	#apt-get install -y mysql-common;  \
#	apt-get install -y wget;            \
#	apt-get install -y openssl; // only if security is needed
COPY ./my.cnf ./etc/mysql/my.cnf
#COPY ./my.cnf ./etc/mysql/mariadb.cnf

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

#userdel mysql && groupadd -r mysql && useradd -r -g mysql mysql; \
#rm -rf /var/lib/mysql; \
#mkdir -p /var/lib/mysql;\
	#mysqld --initialize-insecure;                  #// to initialize datadir at 1st launch
	#/usr/bin/mysqld_safe --datadir='var/lib/mysql' #// advised way to launch mysqld
	#mysql_install_db;                              #// already done by apt-get
	#mysql_secure_installation                      #// advised, need mysql service started; improve security;

#### CONTAINER DEPLOYMENT ####
EXPOSE 3306
COPY ./start.sh .
RUN ["chmod", "+x", "./start.sh"]
CMD ["./start.sh"]
#CMD bash

#CMD ["service", "mysql", "start"]
#ENTRYPOINT ["mysqld_safe", "--user=mysql"]
