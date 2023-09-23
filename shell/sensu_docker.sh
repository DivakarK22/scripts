#!/bin/bash

cat <<EOF > /etc/yum.repos/sensu.repo
[sensu]
name=sensu-main
baseurl=https://buildlogs.centos.org/centos/7/opstools/x86_64/
gpgcheck=0
enabled=1
EOF \
    && yum repolist all \
    && yum install epel-release sensu uchiwa git -y \
    && mkdir $HOME/git && cd $HOME/git && git clone https://github.com/DivakarK22/salt.git
    && cp $HOME/git/salt/salt/sensu/conf.d-master/* /etc/sensu/conf.d/
    && yum install redis rabbitmq-server -y
    && cat <<EOF > /etc/sensu/conf.d/client.json
{
  "client": {
    "name": "sensu",
    "address": "192.168.1.10",
    "subscriptions": [
      "el7"
    ]
  },
  "socket": {
    "bind": "127.0.0.1",
    "port": "3030"
 }
}
EOF 