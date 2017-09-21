# vim: set ft=zsh:

# shortcut to this dotfiles path is $ZSH
export ZSH=$HOME/.dotfiles

# Load any machine-specific config and environment variables
if [[ -a ~/.localrc ]]; then
  source ~/.localrc
fi

source $ZSH/env.zsh
source $ZSH/path.zsh
source $ZSH/prompt.zsh
source $ZSH/window.zsh
source $ZSH/aliases.zsh
source $ZSH/config.zsh

for f in $(find ~/.dotfiles/functions/ -type f); do
	source $f
done

fpath=(~/.dotfiles/bin ~/.dotfiles/functions $fpath)

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit
source $ZSH/completion.zsh

# external scripts
[ -f ~/.iterm2_shell_integration.zsh ] && source ~/.iterm2_shell_integration.zsh
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh
[ -f ~/.nvm/nvm.sh ] && source ~/.nvm/nvm.sh
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# prevent a `1` exit code showing up as the most recent thing in the initial prompt
true
