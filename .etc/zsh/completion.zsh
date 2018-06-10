# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# gulp task completion
function gulpTasks() {
    compls=$(grep -Eho "gulp\.task[^,]*" [Gg]ulpfile.* 2>/dev/null | sed s/\"/\'/g | cut -d "'" -f 2 | sort)

    completions=(${=compls})
    compadd -- $completions
}

compdef gulpTasks gulp

