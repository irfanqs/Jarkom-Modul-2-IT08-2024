#!/bin/bash

apt-get update
apt-get install lynx -y
apt-get install apache2 -y
apt-get install php -y
apt-get install php libapache2-mod-php -y

service apache2 start

cd /etc/apache2/sites-available

cat <<EOF >> default-8080.conf
<VirtualHost  *:8080>
ServerAdmin webmaster@localhost
DocumentRoot /var/www/web-8080

ErrorLog \${APACHE_LOG_DIR}/error.log
CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF

echo "Listen 8080" >> /etc/apache2/ports.conf

a2ensite default-8080.conf

service apache2 reload
service apache2 restart

mkdir -p /var/www/web-8080

cd /var/www/web-8080

cat <<EOF >> index.php
<?php
  \$hostname = gethostname();
  \$date = date('Y-m-d H:i:s');
  \$php_version = phpversion();
  \$username = get_current_user();

  echo "Hello World!<br>";
  echo "Saya adalah: \$username<br>";
  echo "Saat ini berada di: \$hostname<br>";
  echo "Versi PHP yang saya gunakan: \$php_version<br>";
  echo "Tanggal saat ini: \$date<br>";
?>
EOF