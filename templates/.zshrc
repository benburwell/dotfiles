# vim: set ft=zsh:

# shortcut to this dotfiles path is $ZSH
export ZSH=$HOME/.zsh

# Load any machine-specific config and environment variables
if [[ -a ~/.localrc ]]; then
  source ~/.localrc
fi

source $ZSH/env.zsh
source $ZSH/path.zsh
source $ZSH/window.zsh
source $ZSH/aliases.zsh
source $ZSH/config.zsh
source $ZSH/prompt.zsh

for f in $(find $ZSH/functions -type f); do
  source $f
done

fpath=($HOME/.bin $ZSH/functions $fpath)

export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
gpg-connect-agent updatestartuptty /bye > /dev/null 2>&1

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit
source $ZSH/completion.zsh

# external scripts
{{ range .Vars.ZSH.AutoScripts }}
if [[ -f "{{ . }}" ]] ; then source "{{ . }}" ; fi
{{ end }}

if [[ -x /usr/bin/setxkbmap ]]; then
  setxkbmap -option caps:escape
fi
