#!/bin/bash

cat <<EOF >> /etc/bind/jarkom/sudarsana.it08.com
cakra  IN      A       192.237.2.4 ; IP Bedahulu
EOF

service bind9 restart