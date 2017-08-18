# navigation shortcuts
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
if [[ $(uname) == "Darwin" ]]; then
  alias l="ls -lAhG"
  alias la="ls -lAGh"
  alias ll="ls -lGh"
  alias ls="ls -Gh"
fi
if [[ $(uname) == "FreeBSD" ]]; then
  alias l="ls -lAhG"
  alias la="ls -lAGh"
  alias ll="ls -lGh"
  alias ls="ls -Gh"
fi
if [[ $(uname -a | grep Ubuntu) ]]; then
  alias l="ls -lah --color"
  alias la="ls -la --color"
  alias ll="ls -l --color"
  alias ls="ls --color"
fi

# git
alias g="git"
alias ga="git add"
alias gb="git branch"
alias gbs="git-branches"
alias gc="git commit"
alias gcb="git checkout -b"
alias gco="git checkout"
alias gcp="git cherry-pick"
alias gd="git diff"
alias gds="git diff --staged"
alias gf="git fetch"
alias gl="git pull"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%aN>%Creset' --abbrev-commit"
alias glr="git pull --rebase"
alias gm="git merge"
alias gp="git push"
alias gr="git remote"
alias gs="git status"
alias gsl="git stash list"
alias gsp="git stash pop"
alias gss="git stash save"

# golang
alias gob="go build"
alias gof="go fmt"
alias gog="go get"
alias goi="go install"

# heroku
alias h="heroku"
alias hlt="heroku logs --tail"
alias hpg="heroku pg:psql"
alias hps="heroku ps"
alias hpss="heroku ps:scale"

# party parrot
alias celebrate="terminal-parrot -delay 50 -loops 3"
alias parrot="terminal-parrot"

# docker-compose
alias dc="docker-compose"
alias dcd="docker-compose down"
alias dcl="docker-compose pull"
alias dcu="docker-compose up"
alias dcud="docker-compose up -d"

# docker
alias d="docker"
alias dim="docker images"
alias dps="docker ps"
alias dpsa="docker ps -a"

# make
alias m="make"
