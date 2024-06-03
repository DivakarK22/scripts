#!/bin/bash

echo "Installing zsh as default Shell"

echo "Install required Packages"

yum install wget curl git -y | true
dnf install wget curl git -y | true

echo "Installng zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Cloning ZSH Theme file"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

echo "Modifying zsh config"
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k/powerlevel10k"/' 
source ~/.zshrc

echo "Please use "p10k configure" to configure the Theme"



