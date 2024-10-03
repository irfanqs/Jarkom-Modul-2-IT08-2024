#!/bin/bash

cat <<EOF >> /etc/bind/jarkom/pasopati.it08.com
ns1     IN      A       192.237.3.3 ; IP Majapahit
panah   IN      NS      ns1
EOF

service bind9 restart