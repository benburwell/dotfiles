# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n "%{$bg%F{$CURRENT_BG}%}%{$fg%}"
  else
    echo -n "%{$bg%}%{$fg%} "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

# End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG=''
}

### Prompt components
# Each component will draw itself, and hide itself if no information needs to be shown

# Git: branch/detached head, dirty status
prompt_git() {

  () {
    local LC_ALL="" LC_CTYPE="en_US.UTF-8"
  }
  local ref dirty mode repo_path
  repo_path=$(git rev-parse --git-dir 2>/dev/null)

  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    dirty=$(git status --porcelain 2> /dev/null | wc -l)
    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git rev-parse --short HEAD 2> /dev/null)"
    if [[ $dirty -ne 0 ]]; then
      prompt_segment default yellow
    else
      prompt_segment default green
    fi

    if [[ -e "${repo_path}/BISECT_LOG" ]]; then
      mode=" <B>"
    elif [[ -e "${repo_path}/MERGE_HEAD" ]]; then
      mode=" >M<"
    elif [[ -e "${repo_path}/rebase" || -e "${repo_path}/rebase-apply" || -e "${repo_path}/rebase-merge" || -e "${repo_path}/../.dotest" ]]; then
      mode=" >R>"
    fi

    setopt promptsubst
    autoload -Uz vcs_info

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' get-revision true
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' stagedstr '[s]'
    zstyle ':vcs_info:git:*' unstagedstr '[u]'
    zstyle ':vcs_info:*' formats ' %u%c'
    zstyle ':vcs_info:*' actionformats ' %u%c'
    vcs_info
    echo -n "${ref/refs\/heads\//}${vcs_info_msg_0_%% }${mode}"
  fi
}

prompt_host() {
	prompt_segment yellow red '%M'
}

# Dir: current working directory
prompt_dir() {
  prompt_segment default blue '%1d'
}

# Status:
# - was there an error
# - am I root
# - are there background jobs?
prompt_status() {
	[[ $RETVAL -ne 0 ]] && prompt_segment default red "[ret $RETVAL]"
	[[ $UID -eq 0 ]] && prompt_segment default green "[superuser]"
	[[ $(jobs -l | wc -l) -gt 0 ]] && prompt_segment default yellow "[bg jobs]"
}

prompt_rvm() {
  if exists "ruby"; then
    prompt_segment default red "$(ruby --version | cut -d' ' -f2 | cut -d'p' -f1)"
  fi
}

exists() {
	type "$1" >/dev/null 2>/dev/null
}

prompt_node() {
	if exists "node"; then
		prompt_segment default green "$(node -v | sed 's/v//')"
	fi
}

prompt_time() {
	prompt_segment default magenta "$(date +'%T')"
}

## Main prompt
build_prompt() {
  RETVAL=$?
  prompt_status
	prompt_time
  prompt_rvm
  prompt_node
	#prompt_host
  prompt_dir
  prompt_git
  prompt_end
}

PROMPT='%{%f%b%k%}$(build_prompt)
; '

