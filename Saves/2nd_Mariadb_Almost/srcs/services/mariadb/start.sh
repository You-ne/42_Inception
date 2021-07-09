#!/bin/bash
# Database SQL (access to root user no pwd)
#mysqld_safe --user="mysql"
echo "SCRIPT LAUNCHED"
service mysql start
mysql -u root
#echo "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql -u root
#echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -u root
#echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root
#echo "FLUSH PRIVILEGES;" | mysql -u root
