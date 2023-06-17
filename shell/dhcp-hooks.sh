#!/bin/bash

cd /etc/dhcp/

$PWD

sudo git pull

sudo systemctl restart dhcpd

rm -rf /etc/named.conf

rm -rf /etc/named.rfc1912.zones

rm -rf /var/named/example.fwd

rm -rf /var/named/example.rev

cd /etc/dhcp/named

cp example.fwd /var/named/

cp example.rev /var/named/

chown named.named /var/named/example.fwd

chown named.named /var/named/example.rev

cp named.conf /etc/

cp named.rfc1912.zones /etc/

chown named.named /etc/named.rfc1912.zones

chown named.named /etc/named.conf

systemctl restart named

echo "DONE"
