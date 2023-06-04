#!/bin/bash

cd /etc/dhcp

$PWD

sudo git pull

sudo systemctl restart dhcpd

echo "DONE"
