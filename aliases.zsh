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
if [[ $(uname) == "Ubuntu" ]]; then
  alias ls="ls --color"
  alias l="ls -lah --color"
  alias ll="ls -l --color"
  alias la="ls -la --color"
fi

# git
alias g="git"
alias gl='git pull'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gp='git push'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcp='git cherry-pick'
alias gb='git branch'
alias gs='git status' # upgrade your git if -sb breaks for you. it's fun.
alias gr='git remote'
alias gm='git merge'
alias gsl='git stash list'
alias gsp='git stash pop'
alias gss='git stash save'

# golang
alias oi="go install"
alias ob="go build"
alias gg="go get"
alias of="go fmt"

# sf
alias sc="sf compile"
alias st="sf test"
alias sct="sf compileAndTest"
alias sr="sf retrieve"
alias sx="sf execute"
alias sq="sf query"
alias sap="sf aura push"
alias sal="sf aura pull"
alias stt="sf toolingTest"

# http
alias http="python -m SimpleHTTPServer 8000"

# heroku
alias h="heroku"
alias hpg="heroku pg:psql"
alias hps="heroku ps"
alias hpss="heroku ps:scale"
alias hlt="heroku logs --tail"
alias hu="git push heroku master"

