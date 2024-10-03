#!/bin/bash

cat <<EOF >> /etc/bind/named.conf.local
zone "sekiantterimakasih.it08.com" {
 		type master;
 		file "/etc/bind/jarkom/sekiantterimakasih.it08.com";
};
EOF

mkdir -p /etc/bind/jarkom

cat <<EOF > /etc/bind/jarkom/sekiantterimakasih.it08.com
;
; BIND data file for local loopback interface
;
\$TTL    604800
@       IN      SOA     sekiantterimakasih.it08.com. root.sekiantterimakasih.it08.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      sekiantterimakasih.it08.com.
@       IN      A       192.237.2.2
www     IN      CNAME   sekiantterimakasih.it08.com.
EOF

service bind9 restart