# KOK ADA SIH MATKUL KAYA JARKOM
jarkom mnya mnyed <br>
a nya aji

## Topologi 2

![image](https://github.com/user-attachments/assets/7f84d318-47be-47e5-95a0-d20edafdf682)

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
   @       IN      AAAA    ::1
   EOF

   service bind9 restart
   ```

   ![alt text](image-5.png)

## Soal 5

(tinggal ss)

## Soal 6

1. Mengatur kembali `/etc/bind/named.conf.local` pada DNS Master (Sriwijaya) dan menambahkan script berikut:

   ```
   zone "2.237.192.in-addr.arpa" { // IP dari Kotalingga 192.237.2.5
    type master;
    file "/etc/bind/jarkom/2.237.192.in-addr.arpa";
   };
   ```

2. Pada `/etc/bind/jarkom/2.237.192.in-addr.arpa` tambahkan:
   ```
   ;
   ; BIND data file for local loopback interface
   ;
   $TTL    604800
   @       IN      SOA     pasopati.it08.com. root.pasopati.it08.com. (
                                 2         ; Serial
                            604800         ; Refresh
                             86400         ; Retry
                           2419200         ; Expire
                            604800 )       ; Negative Cache TTL
   ;
   2.237.192.in-addr.arpa.       IN      NS      pasopati.it08.com.
   5                             IN      PTR     pasopati.it08.com.
   ```

## Soal 7

1. Menambahkan script di bawah untuk tiap domain di `/etc/bind/named.conf.local`. Hal ini sudah diterapkan sebelumnya.

   ```
   also-notify { 192.237.3.3; };
   allow-transfer { 192.237.3.3; };
   ```

2. Pada node Majapahit, kita perlu menambahkan script berikut pada `/etc/bind/named.conf.local`.

   ```
   zone "sudarsana.it08.com" {
    type slave;
    masters { 192.237.1.2; };
    file "/var/lib/bind/sudarsana.it08.com";
   };

   zone "pasopati.it08.com" {
       type slave;
       masters { 192.237.1.2; };
       file "/var/lib/bind/pasopati.it08.com";
   };

   zone "rujapala.it08.com" {
       type slave;
       masters { 192.237.1.2; };
       file "/var/lib/bind/rujapala.it08.com";
   };
   ```

## Soal 8

1. Pada `/etc/bind/jarkom/sudarsana.it08.com`, tambahkan konfigurasi berikut:
   ```
   cakra  IN      A       192.237.2.4 ; IP Bedahulu
   ```

## Soal 9

1. Pada `/etc/bind/jarkom/pasopati.it08.com`, tambahkan konfigurasi berikut:

   ```
   ns1     IN      A       192.237.3.3 ; IP Majapahit
   panah   IN      NS      ns1
   ```

2. Pada `/etc/bind/named.conf.local` di node Majapahit, tambahkan konfigurasi berikut:

   ```
   zone "panah.pasopati.it08.com" {
      type master;
      file "/etc/bind/panah/panah.pasopati.it08.com";
   };
   ```

3. Untuk mendelegasikan subdomain ke Majapahit, kita perlu mengedit `/etc/bind/named.conf.options` pada node Sriwijaya dan Majapahit sebagai berikut:

   ```
   allow-query{any;};
   // dnnsec-validation auto;
   ```

4. Pada `/etc/bind/panah/panah.pasopati.it08.com`, arahkan ke IP Kotalingga `192.237.2.5`
   ```
   ;
   ; BIND data file for local loopback interface
   ;
   $TTL    604800
   @       IN      SOA     panah.pasopati.it08.com. root.panah.pasopati.it08.com. (
                                 2         ; Serial
                            604800         ; Refresh
                             86400         ; Retry
                           2419200         ; Expire
                            604800 )       ; Negative Cache TTL
   ;
   @       IN      NS      panah.pasopati.it08.com.
   @       IN      A       192.237.2.5
   www     IN      A       192.237.2.5
   ```

## Soal 10

1. Untuk membuat log, kita dapat melakukan perubahan ke `/etc/bind/panah/panah.pasopati.it08.com` sebagai berikut:

   ```
   log     IN      A       10.66.1.2
   www.log IN      CNAME   www.panah.pasopati.it08.com.
   ```

## Soal 11

1. mem-forward IP Nusantara melalui DNS Server Majapahit dengan mengedit file /etc/bind/named.conf.options
    
    ```
    options {
        directory \"/var/cache/bind\";
    
        // If there is a firewall between you and nameservers you want
        // to talk to, you may need to fix the firewall to allow multiple
        // ports to talk.  See http://www.kb.cert.org/vuls/id/800113
    
        // If your ISP provided one or more IP addresses for stable
        // nameservers, you probably want to use them as forwarders.
        // Uncomment the following block, and insert the addresses replacing
        // the all-0's placeholder.
    
    	forwarders {
    		192.168.122.1; // DNS Noesantara Server
    	};
    
        //========================================================================
        // If BIND logs error messages about the root key being expired,
        // you will need to update your keys.  See https://www.isc.org/bind-keys
        //========================================================================
        //dnssec-validation auto;
        allow-query {any;};
    
        auth-nxdomain no;
        listen-on-v6 { any; };
    }
    ```
    
2. Memforward IP Nusantara melalui DNS Server Majapahit dengan mengedit file /etc/bind/named.conf.options (sama seperti  di server Majapahit)
     ```
    options {
        directory \"/var/cache/bind\";
    
        // If there is a firewall between you and nameservers you want
        // to talk to, you may need to fix the firewall to allow multiple
        // ports to talk.  See http://www.kb.cert.org/vuls/id/800113
    
        // If your ISP provided one or more IP addresses for stable
        // nameservers, you probably want to use them as forwarders.
        // Uncomment the following block, and insert the addresses replacing
        // the all-0's placeholder.
    
    	forwarders {
    		192.168.122.1; // DNS Noesantara Server
    	};
    
        //========================================================================
        // If BIND logs error messages about the root key being expired,
        // you will need to update your keys.  See https://www.isc.org/bind-keys
        //========================================================================
        //dnssec-validation auto;
        allow-query {any;};
    
        auth-nxdomain no;
        listen-on-v6 { any; };
    }
    ```
3. Mencoba test di clientnya
    
    ```
    ping google.com -c 5
    ```
    ![image 1](https://github.com/user-attachments/assets/edc4a7bd-390b-49c1-9e48-08ec9ed7776a)
    ![image](https://github.com/user-attachments/assets/ec9f9450-ba1c-4c8d-b266-260133697470)





    
