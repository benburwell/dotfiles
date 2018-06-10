function ghclone() {
	local username
	local repo
	local target_dir

	if [[ $# -lt 1 ]]; then
		echo "Usage: ghclone <username/repo>"
		return 1
	fi

	username=$(echo "$1" | cut -d'/' -f1)
	repo=$(echo "$1" | cut -d'/' -f2)
	target_dir="$PROJECTS/src/github.com/$username"
	mkdir -p "$target_dir"
	url="git@github.com:$username/$repo.git"
	echo "Cloning $url into $target_dir..."
	git clone "$url" "$target_dir/$repo"
	cd "$target_dir/$repo" || return
}
