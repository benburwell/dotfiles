function cabdoc() {
	git log --reverse --no-merges --author=ben.burwell@trifecta.com master..$1 --pretty=format:'%w(80,0,8)%B'
}