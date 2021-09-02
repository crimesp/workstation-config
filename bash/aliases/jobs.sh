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


#graceful shutdown of apt during stuck unattended upgrades
function .systemctl.stop-unattended-upgrades () {
systemctl list-units --type=service | grep upgr;
sudo systemctl stop unattended-upgrades;
systemctl list-units --type=service | grep upgr;



}
