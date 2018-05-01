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
[ -f "$HOME/.iterm2_shell_integration.zsh" ] && source "$HOME/.iterm2_shell_integration.zsh"
[ -f "$HOME/.travis/travis.sh" ] && source "$HOME/.travis/travis.sh"
[ -f "$HOME/.nvm/nvm.sh" ] && source "$HOME/.nvm/nvm.sh"
[ -s "$HOME/.rvm/scripts/rvm" ] && source "$HOME/.rvm/scripts/rvm"
[ -f "$HOME/.vim/bundle/fzf/shell/completion.zsh" ] && source "$HOME/.vim/bundle/fzf/shell/completion.zsh"
[ -f "$HOME/.vim/bundle/fzf/shell/key-bindings.zsh" ] && source "$HOME/.vim/bundle/fzf/shell/key-bindings.zsh"
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"
[ -f "$HOME/Applications/google-cloud-sdk/path.zsh.inc" ] && source "$HOME/Applications/google-cloud-sdk/path.zsh.inc"
[ -f "$HOME/Applications/google-cloud-sdk/completion.zsh.inc" ] && source "$HOME/Applications/google-cloud-sdk/completion.zsh.inc"

# prevent a `1` exit code showing up as the most recent thing in the initial prompt
true
