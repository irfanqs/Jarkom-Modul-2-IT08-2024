#!/bin/bash

cat <<EOF >> /etc/bind/named.conf.local
zone "pasopati.it08.com" {
    type master;
    also-notify { 192.237.3.3; };
    allow-transfer { 192.237.3.3; };
    file "/etc/bind/jarkom/pasopati.it08.com";
};
EOF

mkdir -p /etc/bind/jarkom

cat <<EOF > /etc/bind/jarkom/pasopati.it08.com
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
@       IN      NS      pasopati.it08.com.
@       IN      A       192.237.2.5
www     IN      CNAME   pasopati.it08.com.
medkit  IN      A       192.237.3.3
@       IN      AAAA    ::1
EOF

service bind9 restart