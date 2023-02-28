#!/bin/bash

yum install gcc-c++ patch readline readline-devel zlib zlib-devel libffi-devel \
 openssl-devel make bzip2 autoconf automake libtool bison sqlite-devel

curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -

curl -L get.rvm.io | bash -s stable

source /etc/profile.d/rvm.sh
rvm reload

rvm requirements run

rvm install 2.7

rvm use 2.7 --default