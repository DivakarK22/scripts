#!/bin/bash

#RUN THIS ON MASTER/CLIENT SERVER

sudo yum install nfs-utils -y
sudo mkdir /nfs
sudo chmod 777 /nfs

sudo systemctl enable rpcbind
sudo systemctl enable nfs-server
sudo systemctl enable nfs-lock
sudo systemctl enable nfs-idmap
sudo systemctl start rpcbind
sudo systemctl start nfs-server
sudo systemctl start nfs-lock
sudo systemctl start nfs-idmap

sudo systemctl restart nfs-server