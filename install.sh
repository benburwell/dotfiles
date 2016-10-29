#!/bin/zsh

cd $HOME/.dotfiles/links
# first create necessary directories
for d in $(find . ! -path . -type d); do
	mkdir -p $HOME/${d}
done
# create symlinks
for f in $(find . -type f); do
	src="$HOME/.dotfiles/links/$f"
	dst="$HOME/$f"
	ln -s $src $dst
done
cd $HOME

# initialize vundle
mkdir -p $HOME/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# setup nvim
mkdir -p $HOME/.config
ln -s $HOME/.vim $HOME/.config/nvim
ln -s $HOME/.vimrc $HOME/.config/nvim/init.vim

