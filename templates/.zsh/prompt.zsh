autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git:*' unstagedstr '*'
zstyle ':vcs_info:git*' formats " %b%u%c"
zstyle ':vcs_info:git*' actionformats " %b (%a)"

git_prompt() {
  local dirty
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    dirty=$(git status --porcelain 2>/dev/null | wc -l)
    vcs_info
    if [[ "$dirty" -ne "0" ]]; then
      echo -n "%F{yellow}${vcs_info_msg_0_}%f"
    else
      echo -n "%F{green}${vcs_info_msg_0_}%f"
    fi
  fi
}

export PROMPT='%F{blue}%~%f$(git_prompt) '
