#!/bin/bash

# first things first...
sudo apt update
sudo apt upgrade -y

# Create initial places.
mkdir magic
cd magic/
la
mkdir proj
mkdir tool
mkdir sandbox
cd tool

# start loading some dependencies.
sudo apt install git zsh tree -y

# ZSH:
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z

# Emacs
# sudo apt install emacs-nox -y
# mkdir $HOME/.emacs
# cd $HOME/.emacs
# git clone git@github.com:krhoda/evilmacs.git
# mv evilmacs lisp
# echo "alias vil=\"emacs\"" >> $HOME/.zshrc

# JavaScript:
cd $HOME/magic/tool
mkdir .npm-packages
curl -sL https://deb.nodesource.com/setup_l2.x | sudo -E bash -
sudo apt install nodejs -y
npm config set prefix "$HOME/magic/tool/.npm-packages"
echo "NPM_PACKAGES=\$HOME/magic/tool/.npm-packages" >> $HOME/.zshrc
echo "export PATH=\$PATH:\$NPM_PACKAGES/bin" >> $HOME/.zshrc

# Golang:
wget https://dl.google.com/go/go1.13.linux-amd64.tar.gz
sudo tar -C /usr/local -xzvf go1.13.linux-amd64.tar.gz
echo "export PATH=\$PATH:/usr/local/go/bin" >> $HOME/.zshrc

# Haskell
curl -sSL https://get.haskellstack.org/ | sh
echo  "export PATH=/usr/local/stack/bin:\$PATH" >> $HOME/.zshrc

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Racket
sudo add-apt-repository ppa:plt/racket
sudo apt install racket -y

# Desktop
sudo apt install lxde -y
echo "export DISPLAY=:0" >> $HOME/.zshrc
echo "export LIBGL_ALWAYS_INDIRECT=1" >> $HOME/.zshrc

#
echo "Please add \"zsh-z\" to the plugins list in .zshrc for z powers"
