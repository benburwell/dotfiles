function sl() {
	if [[ $# -lt 1 ]]; then
		echo "Usage: sl <log id> [ <org name ]" && return 1
	fi
	if [[ $# -lt 2 ]]; then
		sf log $1 | nvim -c "set syntax=apexlog" -
		return 0
	fi
	sf log $1 | nvim -c "set syntax=apexlog" -
}