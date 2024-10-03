#!/bin/bash

cat <<EOF >> /etc/bind/named.conf.local
zone "sudarsana.it08.com" {
    type master;
    also-notify { 192.237.3.3; };
    allow-transfer { 192.237.3.3; };
    file "/etc/bind/jarkom/sudarsana.it08.com";
};
EOF

mkdir -p /etc/bind/jarkom

cat <<EOF >> /etc/bind/jarkom/sudarsana.it08.com
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