#!/bin/bash


systemctl restart rpcbind
systemctl restart nfs-server
systemctl restart nfs-lock
systemctl restart nfs-idmap

exportfs -r

systemctl restart nfs-server