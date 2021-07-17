#!/bin/bash
sed -i "/bind-address/c\bind-address = 0.0.0.0/" ./etc/mysql/mariadb.conf.d/50-server.cnf
service mysql start
#####################

echo "Creating WP database, user, and managing privileges..."
echo "CREATE DATABASE $MYSQL_DATABASE DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql -u root
echo "CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED by '$MYSQL_USER_PASSWORD';" | mysql -u root
echo "CREATE USER '$MYSQL_USER'@'wordpress-php' IDENTIFIED by '$MYSQL_USER_PASSWORD';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'localhost' WITH GRANT OPTION;" | mysql -u root
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'wordpress-php' WITH GRANT OPTION;" | mysql -u root
echo "GRANT SHUTDOWN ON *.* TO 'root'@'localhost';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -u root
#echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root

#####################

echo "Setting root password..."
echo "                  "
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql -u root
echo "SHOW GRANTS for 'root'@'localhost';" | mysql -u root -proot
echo "FLUSH PRIVILEGES;"

#####################

echo "Restarting..."
echo "                  "
mysqladmin -uroot -proot shutdown > /dev/null
service mysql start

#####################

echo "Checking mysql version, users and databases..."
echo "                  "
mysqladmin -uroot -proot version
echo "List of Databases:"
echo "                  "
echo "------------------"
echo "SHOW DATABASES" | mysql -u root -proot
echo "------------------"
echo "                  "
echo "List of Users:"
echo "              "
echo "--------------"
echo "select host, user, password from mysql.user;" | mysql -u root -proot
echo "--------------"

####################

echo "Shutting down MariaDB server, and restarting for deployment..."
echo "              "
mysqladmin -uroot -proot shutdown > /dev/null
#service mysql restart
#service mysql -u root -proot stop
cat /etc/hosts
mysqld_safe --user=mysql
