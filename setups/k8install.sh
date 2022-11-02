#!/bin/bash

sudo rm -rf /etc/yum.repos.d/kubernetes.repo docker-ce.repo

sudo yum remove -y  docker-ce docker-ce-cli containerd.io docker-compose-plugin

sudo rm -rf /var/lib/docker

sudo rm -rf /var/lib/containerd

yum -y remove kubeadm kubectl kubelet kubernetes-cni kube*

docker rm `docker ps -a -q`

docker rmi `docker images -q`

kubeadm reset

yum remove -y  kubeadm kubectl kubelet kubernetes-cni kube*

yum autoremove

rm -rf ~/.kube

systemctl disable firewalld; systemctl stop firewalld

swapoff -a; sed -i '/swap/d' /etc/fstab

setenforce 0
sed -i --follow-symlinks 's/^SELINUX=enforcing/SELINUX=disabled/' /etc/sysconfig/selinux

cat >>/etc/sysctl.d/kubernetes.conf<<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system

yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce-19.03.12
systemctl enable --now docker


sudo firewall-cmd --permanent --add-port=6443/tcp
sudo firewall-cmd --permanent --add-port=2379-2380/tcp
sudo firewall-cmd --permanent --add-port=10250/tcp
sudo firewall-cmd --permanent --add-port=10251/tcp
sudo firewall-cmd --permanent --add-port=10252/tcp
sudo firewall-cmd --permanent --add-port=10255/tcp
sudo firewall-cmd --reload

yum install -y kubeadm* kubelet* kubectl*


systemctl enable --now kubelet