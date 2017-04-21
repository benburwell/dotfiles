function sv() {
	if [[ $# -lt 1 ]]; then
		echo "Usage: sv <file> [ <org name ]" && return 1
	fi
	if [[ $# -lt 2 ]]; then
		sf --color coverage $1 | less -R
		return 0
	fi
	sf --color coverage $1 | less -R
}
