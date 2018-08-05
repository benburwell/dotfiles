#!/bin/bash

# enable contrib repositories
sudo sed -i -E "s/main$/main contrib/" /etc/apt/sources.list

sudo apt update
sudo apt install -y \
  apt-transport-https \
  build-essential \
  ca-certificates \
  cmake \
  curl \
  dirmngr \
  exuberant-ctags \
  fonts-firacode \
  git \
  gnucash \
  i3 \
  irssi \
  jq \
  maven \
  mutt \
  neovim \
  network-manager-openvpn-gnome \
  oathtool \
  openvpn \
  pass \
  postgresql-client \
  python-dev \
  python3-dev \
  rxvt-unicode-256color \
  shellcheck \
  software-properties-common \
  stow \
  sudo \
  texlive \
  tmux \
  transmission \
  wget \
  wireshark \
  zsh

# SSH and GPG keys
KEYS=/media/ben/FW
gpg --import $KEYS/ben.pub.asc
gpg --import $KEYS/ben.sec.asc
gpg --import $KEYS/pass.pub.asc
gpg --import $KEYS/pass.sec.asc
mkdir -p ~/.ssh
cp $KEYS/id_rsa ~/.ssh/id_rsa
cp $KEYS/id_rsa.pub ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa.pub
ssh-add ~/.ssh/id_rsa

chsh --shell="$(which zsh)"
git --git-dir=~/.dotfiles --work-tree=~/.dotfiles remote set-url origin git@github.com/benburwell/dotfiles.git
cd ~/.dotfiles && stow .
mkdir -p ~/code/src
cat <<EOF > ~/.localrc
# vim: :set ft=zsh:
export PROJECTS=~/code
export VIRTYX_DIR=~/code/src/github.com/virtyx-technologies
export GITHUB_TOKEN=
export PASSWORD_STORE_GENERATED_LENGTH=
EOF

# pip
curl \
  --fail \
  --location \
  --silent \
  --output /tmp/get-pip.py \
  https://bootstrap.pypa.io/get-pip.py
sudo python /tmp/get-pip.py
rm /tmp/get-pip.py

# golang
curl \
  --fail \
  --location \
  --silent \
  --output /tmp/go.tar.gz \
  https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf /tmp/go.tar.gz
PATH="$PATH:/usr/local/go/bin"
GOPATH="$HOME/code"

# docker & java
curl \
  --fail \
  --location \
  --silent \
  --output /tmp/docker_gpg \
  https://download.docker.com/linux/debian/gpg
sudo apt-key add /tmp/docker_gpg
rm /tmp/docker_gpg
echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | sudo tee /etc/apt/sources.list.d/java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | sudo tee -a /etc/apt/sources.list.d/java.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
sudo apt update
sudo apt install -y docker-ce oracle-java8-installer
sudo systemctl start docker # start now
sudo systemctl enable docker # start at boot
sudo usermod -a -G docker "$USER"

# nodejs
mkdir -p ~/.nvm
curl \
  --fail \
  --silent \
  --location \
  --output - \
  https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
# shellcheck source=/dev/null
. ~/.nvm/nvm.sh
nvm install node
npm install --global typescript

# neovim
sudo pip install neovim
curl \
  --fail \
  --location \
  --silent \
  --create-dirs \
  --output ~/.local/share/nvim/site/autoload/plug.vim \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim --headless +PlugInstall +qall!
cd ~/.local/share/nvim/plugged/YouCompleteMe || exit
export PATH=$PATH:/usr/local/go/bin
./install.py --go-completer --js-completer --java-completer

# fzf
go get -u github.com/junegunn/fzf

# ripgrep
curl \
  --location \
  --fail \
  --output /tmp/ripgrep_0.8.1_amd64.deb \
  https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
sudo dpkg -i /tmp/ripgrep_0.8.1_amd64.deb
rm -f /tmp/ripgrep_0.8.1_amd64.deb

# google-java-format
sudo curl \
  --location \
  --fail \
  --create-dirs \
  --output /usr/local/opt/google-java-format/libexec/google-java-format-1.6-all-deps.jar \
  https://github.com/google/google-java-format/releases/download/google-java-format-1.6/google-java-format-1.6-all-deps.jar

# pass-otp
mkdir -p ~/code/src/github.com/tadfisher
git clone git@github.com:tadfisher/pass-otp.git ~/code/src/github.com/tadfisher/pass-otp
cd ~/code/src/github.com/tadfisher/pass-otp || exit
sudo make install

# ctop
sudo curl \
  --fail \
  --location \
  --output /usr/local/bin/ctop \
  https://github.com/bcicen/ctop/releases/download/v0.7.1/ctop-0.7.1-linux-amd64
sudo chmod +x /usr/local/bin/ctop

# dep
curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

# hub
mkdir -p ~/code/src/github.com/github
git clone git@github.com:github/hub.git ~/code/src/github.com/github/hub
cd ~/code/src/github.com/github/hub || exit
sudo make install prefix=/usr/local

# password store
git clone git@gitlab.int.burwell.io:benburwell/password-store.git ~/.password-store

# aws
sudo pip install awscli
mkdir ~/.aws
cat <<EOF > ~/.aws/credentials
[default]
aws_access_key_id = $(pass virtyx/aws-access-key)
aws_secret_access_key = $(pass virtyx/aws-secret-key)
EOF

sudo apt install -y gconf2 libappindicator1
sudo apt --fix-broken install
curl \
  --fail \
  --silent \
  --location \
  --output /tmp/slack.deb \
  https://downloads.slack-edge.com/linux_releases/slack-desktop-3.2.1-amd64.deb
sudo dpkg -i /tmp/slack.deb
rm -f /tmp/slack.deb

curl \
  --fail \
  --silent \
  --location \
  --output /tmp/ngrok.zip \
  https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
sudo unzip /tmp/ngrok.zip -d /usr/local/bin
rm -f /tmp/ngrok.zip
mkdir -p ~/.ngrok2
echo "authtoken: $(pass ngrok-token)" > ~/.ngrok2/ngrok.yml

# TODO: openvpn
# TODO: maven settings.xml
