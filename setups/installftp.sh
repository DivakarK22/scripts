#!/bin/bash

sudo yum install httpd -y

sudo systemctl start httpd

sudo systemctl enable httpd

sudo mkdir /var/www/html/

sudo createrepo /var/www/html/

touch /etc/yum.repos.d/local.repo

cat <<EOF > /etc/yum.repos.d/local.repo
[local-base]
name=Yum Local Base
baseurl=http://192.168.1.61:80/
enabled=1
gpgcheck=0
EOF

sudo yum repolist

sudo yum install nfs-utils -y

sudo mkdir /nfs
sudo chmod 777 /nfs
systemctl enable rpcbind
systemctl enable nfs-server
systemctl enable nfs-lock
systemctl enable nfs-idmap
systemctl start rpcbind
systemctl start nfs-server
systemctl start nfs-lock
systemctl start nfs-idmap
systemctl restart nfs-server

