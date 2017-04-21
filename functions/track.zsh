function track() {
	if [[ $# -lt 2 ]]; then
		echo "Usage: track <start|stop|stats> <task> [range]" && return 1
	fi

	cmd=$1
	task=$2

	if [[ $TRACK_ROOT ]]; then
		trackdir=$TRACK_ROOT
	else
		trackdir=~/.track
	fi
	logfile="$trackdir/log"
	taskdir="$trackdir/task/$task"
	startfile="$taskdir/started"

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
		started=$(cat "$startfile")
		ended=$(date --iso-8601=seconds)
		echo "$task\t$started\t$ended" >> $logfile
		rm "$startfile"
		return 0
	fi

	echo "Unrecognized command $cmd"
	return 1
}
