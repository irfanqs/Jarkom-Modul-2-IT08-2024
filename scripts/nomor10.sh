#!/bin/bash

cat <<EOF >> /etc/bind/panah/panah.pasopati.it08.com
log     IN      A       192.237.2.5
www.log IN      CNAME   www.panah.pasopati.it08.com.
EOF

service bind9 restart