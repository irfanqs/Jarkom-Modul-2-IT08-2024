#!/bin/bash

cat <<EOF >> /etc/bind/named.conf.local
zone "3.237.192.in-addr.arpa" {
    type master;
    also-notify { 192.237.3.3; };
    allow-transfer { 192.237.3.3; };
    file "/etc/bind/jarkom/3.237.192.in-addr.arpa";
};
EOF

mkdir -p /etc/bind/jarkom

cat <<EOF >> /etc/bind/jarkom/3.237.192.in-addr.arpa
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
3.237.192.in-addr.arpa      IN      NS      solok.it08.com.
2                           IN      PTR     www.solok.it08.com.
EOF

service bind9 restart