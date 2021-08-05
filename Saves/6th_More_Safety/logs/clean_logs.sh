#! /bin/bash
if [ ! -e ./nginx_logs/access.log.old ]; then
touch ./nginx_logs/access.log.old
fi

if [ ! -e ./nginx_logs/error.log.old ]; then
touch ./nginx_logs/error.log.old
fi

if [ ! -e ./php-fpm_logs/php7.3-fpm.log.old ]; then
touch ./php-fpm_logs/php7.3-fpm.log.old
fi

if [ ! -e ./mariadb_logs/error.log.old ]; then
touch ./mariadb_logs/error.log.old
fi

cat ./nginx_logs/access.log >> ./nginx_logs/access.log.old
cat ./nginx_logs/error.log >> ./nginx_logs/error.log.old
cat ./php-fpm_logs/php7.3-fpm.log >> ./php-fpm_logs/php7.3-fpm.log.old
cat ./mariadb_logs/error.log >> ./mariadb_logs/error.log.old

sudo rm ./nginx_logs/access.log
sudo rm ./nginx_logs/error.log
sudo rm ./php-fpm_logs/php7.3-fpm.log
sudo rm ./mariadb_logs/error.log

sudo touch ./nginx_logs/access.log
sudo touch ./nginx_logs/error.log
sudo touch ./php-fpm_logs/php7.3-fpm.log
sudo touch ./mariadb_logs/error.log
