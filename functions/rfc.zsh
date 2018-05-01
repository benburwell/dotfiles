function rfc () {
	rfc_dir="/usr/local/share/doc/rfc"

	if [[ "$#" -eq "0" ]]; then
		cd "$rfc_dir"
		return
	fi

	if [[ "$1" -eq "search" ]]; then
		grep -irL "$2" "$rfc_dir" | xargs basename | less
		return
	fi

	if [[ "$#" -eq "1" && -f "$rfc_dir/rfc${1}.txt" ]]; then
		"$EDITOR" "$rfc_dir/rfc${1}.txt"
		return
	fi

	echo "Usage: $0"
	echo
	echo "    $0 search html"
	echo "        Search for 'html' in RFCs"
	echo
	echo "    $0 3966"
	echo "        open RFC 3966 in \$EDITOR ($EDITOR)"
	return 1
}

