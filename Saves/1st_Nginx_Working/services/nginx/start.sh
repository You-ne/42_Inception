# Create symlink between site-available and enabled
mv ./tmp/myserver.conf /etc/nginx/sites-available/myserver.conf
ln -s /etc/nginx/sites-available/myserver.conf /etc/nginx/sites-enabled/
rm -rf /etc/nginx/sites-enabled/default
rm -rf /etc/nginx/sites-available/default
rm -rf /var/www/html/
mkdir /var/www/myserver/images
# SSL
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out myserver.crt -keyout myserver.key -subj "/C=FR/ST=Ile de France/L=Paris/O=Ecole 42/OU=Ecole 42/CN=myserver"
mv myserver.crt /etc/ssl/certs/
mv myserver.key /etc/ssl/private/

echo "daemon off;" >> /etc/nginx/nginx.conf
# Allow access to nginx User
chown -R www-data /var/www/* # www-data:www-data == user:group ; www-data == nginx
chmod -R 755 /var/www/*
service nginx start
#nginx -g "daemon off;"
