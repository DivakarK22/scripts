#!/bin/bash

sudo yum update -y
#Install req pkgs
sudo yum install -y git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel

#Install Nodejs
sudo curl -sL https://rpm.nodesource.com/setup_12.x | bash
sudo yum install -y nodejs ruby

#Install Yarn
sudo curl -sL https://dl.yarnpkg.com/rpm/yarn.repo -o /etc/yum.repos.d/yarn.repo
sudo yum install -y yarn

#Install Ruby 2.7.0
cd
rm -rf .rbenv
cd /home/vagrant
rm -rf .rbenv
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd /home/vagrant
git clone https://github.com/rbenv/rbenv.git /home/vagrant


git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/rbenv/ruby-build.git /home/vagrant/.rbenv/plugins/ruby-build
cd
#Install the latest version of Ruby (v2.7.0)
rbenv install 2.7.0
#Set Ruby v2.7.0 as the default version for all shells.
rbenv global 2.7.0

#HTTP
gem install sensu-plugins-http
