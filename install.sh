#!/usr/bin/env zsh

cd $HOME/.dotfiles/links
# first create necessary directories
for d in $(find . ! -path . -type d); do
	mkdir -p $HOME/${d}
done
# create symlinks
for f in $(find . -type f); do
	src="$HOME/.dotfiles/links/$f"
	dst="$HOME/$f"
	if [ ! -f $dst ]; then
		echo "===> Symlinking $dst"
		ln -s $src $dst
	else
		echo "---> Found existing $dst, skipping"
	fi
done
cd $HOME

# initialize vundle
mkdir -p $HOME/.vim/bundle
if [ ! -d $HOME/.vim/bundle/Vundle.vim ]; then
	echo "===> Getting Vundle"
	git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
else
	echo "---> Looks like we already have Vundle, skipping"
fi
vim +PluginInstall +qall

# setup nvim
mkdir -p $HOME/.config
if [ ! -d $HOME/.config/nvim ]; then
	echo "===> Linking .vim for Neovim"
	ln -s $HOME/.vim $HOME/.config/nvim
else
	echo "---> Looks like .vim has already been set up for Neovim"
fi
if [ ! -f $HOME/.config/nvim/init.vim ]; then
	echo "===> Linking .vimrc for Neovim"
	ln -s $HOME/.vimrc $HOME/.config/nvim/init.vim
else
	echo "---> Looks like .vimrc has already been set up for Neovim"
fi
