#!/bin/bash
sed -i "/bind-address/c\bind-address = 0.0.0.0/" ./etc/mysql/mariadb.conf.d/50-server.cnf
service mysql start
#####################

echo "CREATE DATABASE $MYSQL_DATABASE DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql -u root
echo "CREATE USER '$MYSQL_USER'@'wordpress-php.srcs_intra' IDENTIFIED by '$MYSQL_USER_PASSWORD';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'wordpress-php.srcs_intra' WITH GRANT OPTION;" | mysql -u root
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -u root

#####################

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql -u root
echo "SHOW GRANTS for 'root'@'localhost';" | mysql -u root -proot
echo "FLUSH PRIVILEGES;"

#####################

mysqladmin -uroot -proot shutdown > /dev/null
service mysql start

#####################

mysqladmin -uroot -proot version
echo "SHOW DATABASES" | mysql -u root -proot
echo "select host, user, password from mysql.user;" | mysql -u root -proot

####################

echo "Shutting down MariaDB server, and restarting for deployment..."
mysqladmin -uroot -proot shutdown > /dev/null
cat /etc/hosts
mysqld_safe --user=mysql
