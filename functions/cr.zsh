function cr() {
	if [[ $# -lt 1 ]]; then
		echo "Usage: cr <release branch>" && return 1
	fi

	cabdoc $1 > .cab.txt && \
		nvim .cab.txt && \
		awk '{ printf "%s\\\\n", $0 }' < .cab.txt | sed 's/"/\\"/g' > .cab.nonl.txt && \
		sf --org=vscit run --raw makeChangeRequest "{\"body\":\"$(cat .cab.nonl.txt)\" }" && \
		rm .cab.txt .cab.nonl.txt
}