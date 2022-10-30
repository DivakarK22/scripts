#!/bin/bash

yum update -y

yum install git -y

mkdir git

cd git

git clone https://github.com/DivakarK22/scripts.git

cd setups

bash installsaltMinion.sh
