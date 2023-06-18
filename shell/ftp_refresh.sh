#!/bin/bash
#!/bin/bash

#sudo su
#sudo yum install nfs-utils
#mkdir /nfs
#chmod 777 /nfs
mv /etc/exports /etc/exports.bk
sudo yum remove nfs-utilsi rpcbind -y
sudo yum install nfs-utils rpcbind -y
systemctl enable nfs-server
systemctl enable nfs-lock
systemctl enable nfs-idmap
systemctl start rpcbind
systemctl start nfs-server
systemctl start nfs-lock
systemctl start nfs-idmap
mv /etc/exports.bk /etc/exports
systemctl restart rpcbind
systemctl restart nfs-server
systemctl restart nfs-lock
systemctl restart nfs-idmap
exportfs -r
systemctl restart nfs-server
