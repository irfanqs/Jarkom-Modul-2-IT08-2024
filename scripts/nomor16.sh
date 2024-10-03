#!/bin/bash

cat <<EOF >> /etc/bind/named.conf.local
zone "solok.it08.com" {
    type master;
    file "/etc/bind/jarkom/solok.it08.com";
};
EOF

mkdir -p /etc/bind/jarkom

cat <<EOF >> /etc/bind/jarkom/solok.it08.com
;
; BIND data file for local loopback interface
;
\$TTL    604800
@       IN      SOA     solok.it08.com. root.solok.it08.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      solok.it08.com.
@       IN      A       192.237.2.2     ; IP Tanjungkulai
www     IN      A       192.237.2.2
EOF

service bind9 restart