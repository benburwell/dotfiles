# navigation shortcuts
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
if [[ $(uname) == "Darwin" ]]; then
  alias ls="ls -Gh"
  alias l="ls -lAhG"
  alias ll="ls -lGh"
  alias la="ls -lAGh"
fi
if [[ $(uname) == "FreeBSD" ]]; then
  alias ls="ls -Gh"
  alias l="ls -lAhG"
  alias ll="ls -lGh"
  alias la="ls -lAGh"
fi
if [[ $(uname -a | grep Ubuntu) ]]; then
  alias ls="ls --color"
  alias l="ls -lah --color"
  alias ll="ls -l --color"
  alias la="ls -la --color"
fi

# git
alias g="git"
alias gl='git pull'
alias glr='git pull --rebase'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%aN>%Creset' --abbrev-commit"
alias gp='git push'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcp='git cherry-pick'
alias gb='git branch'
alias gbs='git-branches'
alias gs='git status'
alias gr='git remote'
alias gm='git merge'
alias gsl='git stash list'
alias gsp='git stash pop'
alias gss='git stash save'

# golang
alias goi="go install"
alias gob="go build"
alias gog="go get"
alias gof="go fmt"

# heroku
alias h="heroku"
alias hpg="heroku pg:psql"
alias hps="heroku ps"
alias hpss="heroku ps:scale"
alias hlt="heroku logs --tail"

# party parrot
alias parrot="terminal-parrot"
alias celebrate="terminal-parrot -delay 50 -loops 3"

# docker-compose
alias dc="docker-compose"
alias dcu="docker-compose up"
alias dcd="docker-compose down"
alias dcl="docker-compose pull"

# docker
alias d="docker"
alias dps="docker ps"
alias dpsa="docker ps -a"
alias dim="docker images"
