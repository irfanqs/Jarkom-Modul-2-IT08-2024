#!/bin/bash

cat <<EOF >> /etc/bind/named.conf.local
zone "panah.pasopati.it08.com" {
    type master;
    file "/etc/bind/panah/panah.pasopati.it08.com";
};
EOF

mkdir -p /etc/bind/panah

cat <<EOF >> /etc/bind/panah/panah.pasopati.it08.com
;
; BIND data file for local loopback interface
;
\$TTL    604800
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
EOF

service bind9 restart