# navigation shortcuts
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
if [[ $(uname) == "Darwin" || $(uname) == "FreeBSD" ]]; then
  alias l="ls -lAhG"
  alias la="ls -lAGh"
  alias ll="ls -lGh"
  alias ls="ls -Gh"
else
  alias l="ls -lah --color"
  alias la="ls -la --color"
  alias ll="ls -l --color"
  alias ls="ls --color"
fi

# git
alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gcb="git checkout -b"
alias gco="git checkout"
alias gd="git diff"
alias gds="git diff --staged"
alias gl="git pull"
alias gm="git merge"
alias gp="git push"
alias gs="git status"
alias gt="git tag"

# docker-compose
alias dc="docker-compose"
alias dcd="docker-compose down"
alias dcud="docker-compose up -d"

# pass
alias pc="pass --clip"
alias poc="pass otp --clip"
