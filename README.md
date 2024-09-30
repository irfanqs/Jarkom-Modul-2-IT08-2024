# KOK ADA SIH MATKUL KAYA JARKOM

## Topologi 2

![alt text](image-1.png)

## Soal 1

1. Menjalankan script `dns_master.sh` di node **Sriwijaya** dengan isi sebagai berikut:

   ```
   #!/bin/bash

   cat <<EOF >> /etc/bind/named.conf.local
   zone "sriwijaya.com" {
       type master;
       also-notify { 192.237.3.3; };
       allow-transfer { 192.237.3.3; };
       file "/etc/bind/jarkom/sriwijaya.com";
   };
   EOF

   mkdir -p /etc/bind/jarkom

   cat <<EOF > /etc/bind/jarkom/sriwijaya.com
   ;
   ; BIND data file for local loopback interface
   ;
   \$TTL    604800
   @       IN      SOA     sriwijaya.com. root.sriwijaya.com. (
                                 2         ; Serial
                            604800         ; Refresh
                             86400         ; Retry
                           2419200         ; Expire
                            604800 )       ; Negative Cache TTL
   ;
   @       IN      NS      sriwijaya.com.
   @       IN      A       192.237.1.2
   www     IN      CNAME   sriwijaya.com.
   @       IN      AAAA    ::1
   EOF

   service bind9 restart
   ```

2. Menjalankan script `dns_slave.sh` di node **Majapahit** dengan isi sebagai berikut:

   ```
   #!/bin/bash

   cat <<EOF >> /etc/bind/named.conf.local
   zone "sriwijaya.com" {
       type slave;
       masters { 192.237.1.2; };
       file "/var/lib/bind/sriwijaya.com";
   };
   EOF

   service bind9 restart
   ```

3. Menjadikan **Tanjungkulai** dan **Bedahulu** sebagai web server
   ![alt text](image-2.png)

   ```
    #!/bin/bash

    apt-get update
    apt-get install lynx -y
    apt-get install apache2 -y
    apt-get install php -y
    apt-get install php libapache2-mod-php -y

    service apache2 start

    cd /etc/apache2/sites-available

    cat <<EOF >> sriwijaya.com.conf
    <VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/sriwijaya.com
        ServerName sriwijaya.com
        ServerAlias www.sriwijaya.com
    </VirtualHost>
    EOF

    a2ensite sriwijaya.com

    service apache2 restart

    mkdir -p /var/www/sriwijaya.com

    cd /var/www/sriwijaya.com

    cat <<EOF >> index.php
    <?php
        echo "Testing Web Server";
    ?>
    EOF
   ```

## Soal 2

1. Menambahkan domain **sudarsana.it08.com** yang mengarah ke Solok dengan ip `192.237.3.6`

   ```
   #!/bin/bash

   cat <<EOF >> /etc/bind/named.conf.local
   zone "sudarsana.it08.com" {
       type master;
       also-notify { 192.237.3.3; };
       allow-transfer { 192.237.3.3; };
       file "/etc/bind/jarkom/sudarsana.it08.com";
   };
   EOF

   cat <<EOF > /etc/bind/jarkom/sudarsana.it08.com
   ;
   ; BIND data file for local loopback interface
   ;
   \$TTL    604800
   @       IN      SOA     sudarsana.it08.com. root.sudarsana.it08.com. (
                                 2         ; Serial
                            604800         ; Refresh
                             86400         ; Retry
                           2419200         ; Expire
                            604800 )       ; Negative Cache TTL
   ;
   @       IN      NS      sudarsana.it08.com.
   @       IN      A       192.237.3.6
   www     IN      CNAME   sudarsana.it08.com.
   medkit  IN      A       192.237.3.3
   @       IN      AAAA    ::1
   EOF

   service bind9 restart
   ```

   ![alt text](image-3.png)

## Soal 3

1. Menambahkan domain **pasopati.it08.com** yang mengarah ke Kotalingga dengan ip `192.237.2.5`

   ```
   #!/bin/bash

   cat <<EOF >> /etc/bind/named.conf.local
   zone "pasopati.it08.com" {
       type master;
       also-notify { 192.237.3.3; };
       allow-transfer { 192.237.3.3; };
       file "/etc/bind/jarkom/pasopati.it08.com";
   };
   EOF

   cat <<EOF > /etc/bind/jarkom/pasopati.it08.com
   ;
   ; BIND data file for local loopback interface
   ;
   \$TTL    604800
   @       IN      SOA     pasopati.it08.com. root.pasopati.it08.com. (
                                 2         ; Serial
                            604800         ; Refresh
                             86400         ; Retry
                           2419200         ; Expire
                            604800 )       ; Negative Cache TTL
   ;
   @       IN      NS      pasopati.it08.com.
   @       IN      A       192.237.2.5
   www     IN      CNAME   pasopati.it08.com.
   medkit  IN      A       192.237.3.3
   @       IN      AAAA    ::1
   EOF

   service bind9 restart
   ```

   ![alt text](image-4.png)

## Soal 4

1. Menambahkan domain **rujapala.it08.com** yang mengarah ke Tanjungkulai dengan ip `192.237.2.2`

   ```
   #!/bin/bash

   cat <<EOF >> /etc/bind/named.conf.local
   zone "rujapala.it08.com" {
       type master;
       also-notify { 192.237.3.3; };
       allow-transfer { 192.237.3.3; };
       file "/etc/bind/jarkom/rujapala.it08.com";
   };
   EOF

   mkdir -p /etc/bind/jarkom

   cat <<EOF > /etc/bind/jarkom/rujapala.it08.com
   ;
   ; BIND data file for local loopback interface
   ;
   \$TTL    604800
   @       IN      SOA     rujapala.it08.com. root.rujapala.it08.com. (
                                 2         ; Serial
                            604800         ; Refresh
                             86400         ; Retry
                           2419200         ; Expire
                            604800 )       ; Negative Cache TTL
   ;
   @       IN      NS      rujapala.it08.com.
   @       IN      A       192.237.2.2
   www     IN      CNAME   rujapala.it08.com.
   medkit  IN      A       192.237.3.3
   @       IN      AAAA    ::1
   EOF

   service bind9 restart
   ```

   ![alt text](image-5.png)

## Soal 5

(tinggal ss)

## Soal 6
