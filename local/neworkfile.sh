#!/bin/bash

yum update -y

yum install git -y

cd $HOME

git clone https://github.com/DivakarK22/scripts.git

cat <<EOF >> /etc/sysconfig/network-scripts/ifcfg-eth0
