HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY
setopt AUTO_CD
setopt COMPLETE_IN_WORD
setopt CORRECT
setopt EXTENDED_GLOB
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
setopt LOCAL_OPTIONS
setopt LOCAL_TRAPS
setopt NO_BG_NICE
setopt NO_HUP
setopt NO_LIST_BEEP
setopt PROMPT_SUBST

# open a file for editing by choosing with fzf
fzf-open-file-or-dir() {
	local cmd="command find -L . \
	\\( -path '*/\\.*' -o -fstype 'dev' -o -fstype 'proc' \\) -prune \
	-o -type f -print \
	-o -type d -print \
	-o -type l -print 2> /dev/null | sed 1d | cut -b3-"
	local out=$(eval $cmd | fzf --exit-0)
	if [ -f "$out" ]; then
		$EDITOR "$out" < /dev/tty
	elif [ -d "$out" ]; then
		cd "$out"
		zle reset-prompt
	fi
}
zle -N fzf-open-file-or-dir

fzf-cd-to-project() {
	local cmd="command find ~/code/src -type d -mindepth 2 -maxdepth 3"
  local out=$(eval $cmd | fzf --exit-0)
  cd "$out"
  zle reset-prompt
}
zle -N fzf-cd-to-project


bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[^N' newtab
bindkey '^?' backward-delete-char
bindkey '^R' history-incremental-search-backward
bindkey '^P' fzf-open-file-or-dir
bindkey '^J' fzf-cd-to-project
