#!/usr/bin/env zsh

DOTFILES="$HOME/code/src/github.com/benburwell/dotfiles"
cd "$DOTFILES/links"
# first create necessary directories
for d in $(find . ! -path . -type d); do
	mkdir -p $HOME/${d}
done
# create symlinks
for f in $(find . -type f); do
	src="$DOTFILES/links/$f"
	dst="$HOME/$f"
	if [[ ! -f "$dst" ]]; then
		echo "===> Symlinking $dst"
		ln -s $src $dst
	else
		echo "---> Found existing $dst, skipping"
	fi
done
cd "$HOME"

# initialize vundle
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall

# setup nvim
mkdir -p "$HOME/.config"
if [[ ! -d "$HOME/.config/nvim" ]]; then
	mkdir -p "$HOME/.config/nvim"
	echo "===> Linking .vim for Neovim"
	ln -s "$HOME/.vim" "$HOME/.config/nvim"
else
	echo "---> Looks like .vim has already been set up for Neovim"
fi
if [[ ! -f "$HOME/.config/nvim/init.vim" ]]; then
	echo "===> Linking .vimrc for Neovim"
	ln -s "$HOME/.vimrc" "$HOME/.config/nvim/init.vim"
else
	echo "---> Looks like .vimrc has already been set up for Neovim"
fi

