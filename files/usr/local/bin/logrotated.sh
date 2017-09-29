#!/bin/sh
# Simple while loop to get log rotate working

/usr/sbin/logrotate -f /etc/logrotate.d/haproxy.conf

while true
do
  sleep 1h
  /usr/sbin/logrotate -f /etc/logrotate.d/haproxy.conf
done
