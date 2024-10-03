#!/bin/bash

apt-get install unzip -y
apt-get install wget -y

wget --no-check-certificate 'https://drive.usercontent.google.com/u/0/uc?id=1JGk8b-tZgzAOnDqTx5B3F9qN6AyNs7Zy&export=download' -O worker2.zip

unzip worker2.zip -d worker2

mkdir -p /var/www/web-8080/resources

mv dir-listing/worker2/* /var/www/web-8080/resources

cat <<EOF >> /etc/nginx/sites-enabled/web-8080
server {
    listen 80;
    server_name sekiantterimakasih.it08.com www.sekiantterimakasih.it08.com;

    root /var/www/web-8080;
    index index.php index.html index.htm;

    location /resources {
        alias /var/www/web-8080/resources;
        autoindex on;
    }

    error_log /var/log/nginx/error.log;
    access_log /var/log/nginx/access.log;
}
EOF

service nginx restart