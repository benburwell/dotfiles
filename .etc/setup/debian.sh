#!/bin/bash

chsh --shell=$(which zsh)
git clone https://github.com/benburwell/dotfiles.git ~/.dotfiles
cd ~/.dotfiles && stow .
cd $HOME
mkdir -p ~/code/src
echo "PROJECTS=~/code" > ~/.localrc

# nodejs
mkdir ~/.nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
source ~/.nvm/nvm.sh
nvm install node
npm install --global typescript

# neovim
sudo pip install neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall
cd ~/.local/share/nvim/plugged/YouCompleteMe
export PATH=$PATH:/usr/local/go/bin
./install.py --go-completer --js-completer --java-completer

sudo apt update
sudo apt install -y pass gnucash irssi transmission wireshark exuberant-ctags shellcheck

go get -u github.com/junegunn/fzf
wget https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
sudo dpkg -i ripgrep_0.8.1_amd64.deb

# chromium
# mactex
# virtualbox
# ctop
# dep
# google-java-format
# hub
# jq
# maven
# mutt
# oath-toolkit
# postgresql@9.5

