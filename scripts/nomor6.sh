#!/bin/bash

cat <<EOF >> /etc/bind/named.conf.local
zone "2.237.192.in-addr.arpa" {
    type master;
    file "/etc/bind/jarkom/2.237.192.in-addr.arpa";
};
EOF

mkdir -p /etc/bind/jarkom

cat <<EOF > /etc/bind/jarkom/2.237.192.in-addr.arpa
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
2.237.192.in-addr.arpa.       IN      NS      pasopati.it08.com.
5                             IN      PTR     pasopati.it08.com.

service bind9 restart