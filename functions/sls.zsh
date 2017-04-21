function sls() {
	ls -1 ~/.sf/scripts/ | sed 's/.ejs$//' | sort
}
