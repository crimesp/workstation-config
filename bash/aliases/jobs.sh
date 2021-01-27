function .launch.background () {
COMMAND=$1
LOGFILE=$2


if [[ -z "$LOGFILE" ]]; then
	echo "no logfile. Specifying STDOUT and STDERR to /dev/null"
	LOGFILE="/dev/null"
fi

STATEMENT="${COMMAND} &> ${LOGFILE} &"

echo "Running statement: $STATEMENT"

"$COMMAND" &> ${LOGFILE} &
}

