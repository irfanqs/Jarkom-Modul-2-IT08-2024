#!/bin/bash

cat <<EOF >> /etc/bind/named.conf.local
zone "sriwijaya.com" { 
    type master;
    also-notify { 192.237.3.3; };
    allow-transfer { 192.237.3.3; };
    file "/etc/bind/jarkom/sriwijaya.com"; 
};

zone "1.237.192.in-addr.arpa" {
    type master;
    file "/etc/bind/jarkom/1.237.192.in-addr.arpa";
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

cat <<EOF > /etc/bind/jarkom/1.237.192.in-addr.arpa
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
1.237.192.in-addr.arpa       IN      NS      sriwijaya.com. 
2                            IN      PTR     sriwijaya.com.
EOF

service bind9 restart

