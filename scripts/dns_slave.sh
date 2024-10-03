#!/bin/bash

cat <<EOF >> /etc/bind/named.conf.local
zone "sriwijaya.com" {
    type slave;
    masters { 192.237.1.2; };
    file "/var/lib/bind/sriwijaya.com";
};
EOF

service bind9 restart