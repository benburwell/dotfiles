function cabdoc() {
	git log --reverse --no-merges --author="Ben Burwell" master..$1 --pretty=format:'%w(80,0,8)%B'
}
