#!/bin/bash

echo "Installing zsh as default Shell"

echo "Install required Packages"

yum install wget curl git zsh -y | true
dnf install wget curl git zsh -y | true

echo "Installng zsh"
curl https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh > /opt/install.sh
bash /opt/install.sh
echo "Cloning ZSH Theme file"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

echo "Modifying zsh config"
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k/powerlevel10k"/' ~/.zshrc
source ~/.zshrc

echo "Please use "p10k configure" to configure the Theme"



