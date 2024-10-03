#!/bin/bash

cat <<EOF >> /etc/bind/named.conf.local
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
EOF

service bind9 restart