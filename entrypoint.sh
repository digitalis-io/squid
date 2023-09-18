#!/bin/bash -x

ssl_crtd=$(find /usr -type f -name ssl_crtd)
$ssl_crtd -c -s /var/lib/ssl_db
chown -R squid:squid /var/lib/ssl_db

/usr/sbin/squid -N -f /etc/squid/squid.conf -z
/usr/sbin/squid -NYCd 1 -f /etc/squid/squid.conf
