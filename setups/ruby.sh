#!/bin/bash

yum update -y
#Install req pkgs
yum install -y git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel

#Install Nodejs
curl -sL https://rpm.nodesource.com/setup_12.x | bash
yum install -y nodejs

#Install Yarn
curl -sL https://dl.yarnpkg.com/rpm/yarn.repo -o /etc/yum.repos.d/yarn.repo
yum install -y yarn

#Install Ruby 2.7.0
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL
#Install the latest version of Ruby (v2.7.0)
rbenv install 2.7.0
#Set Ruby v2.7.0 as the default version for all shells.
rbenv global 2.7.0

#HTTP
gem install sensu-plugins-http