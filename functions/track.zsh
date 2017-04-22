local function datediff() {
	local d0=$(date -d"$1" +%s)
	local d1=$(date -d"$2" +%s)
	echo "$(($d1 - $d0))"
}

function track() {
	if [[ $# -lt 2 ]]; then
		echo "Usage: track <start|stop|hours> <task>" && return 1
	fi

	local cmd=$1
	local task=$2
	local trackdir

	if [[ $TRACK_ROOT ]]; then
		trackdir=$TRACK_ROOT
	else
		trackdir=~/.track
	fi
	local logfile="$trackdir/log"
	local taskdir="$trackdir/task/$task"
	local startfile="$taskdir/started"

	mkdir -p "$taskdir"

	if [[ $cmd == "start" ]]; then
		if [[ -f $startfile ]]; then
			echo "Task $task was already started at $(cat $startfile)"
			return 1
		fi
		date --iso-8601=seconds > "$startfile"
		return 0
	fi

	if [[ $cmd == "stop" ]]; then
		if [[ ! -f $startfile ]]; then
			echo "Task $task has not been started"
			return 1
		fi
		local started=$(cat "$startfile")
		local ended=$(date --iso-8601=seconds)
		echo "$task\t$started\t$ended" >> "$logfile"
		rm "$startfile"
		return 0
	fi

	if [[ $cmd == "hours" ]]; then
		local lines=("${(@f)$(grep "^$task" < "$logfile" | cut -f2,3)}")
		local sum=0
		for line in $lines; do
			local t0=$(echo "$line" | cut -f1)
			local t1=$(echo "$line" | cut -f2)
			diff=$(datediff "$t0" "$t1")
			sum=$((sum + diff))
		done
		echo "$(($sum / 3600.0))"
		return 0
	fi

	echo "Unrecognized command $cmd"
	return 1
}
