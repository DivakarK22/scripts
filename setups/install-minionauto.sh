#!/bin/bash

yum update -y

yum install git -y

cd $HOME

mkdir git

cd git

git clone https://github.com/DivakarK22/scripts.git

cd $HOME/git/scripts/setups

bash installsaltMinion.sh
