#!/bin/bash
mv /etc/exports /etc/exports.bk

sudo yum remove nfs-utils -y

sudo yum install nfs-utils -y

mv /etc/exports /etc/exports.bk

systemctl restart rpcbind
systemctl restart nfs-server
systemctl restart nfs-lock
systemctl restart nfs-idmap

exportfs -r

systemctl restart nfs-server