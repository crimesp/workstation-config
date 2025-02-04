function .kill.find() {
   if [ -z "$1" ]
    then
        echo "Supply a file pattern (* is wildcard)"
    return 1
    fi



# Get the process ID(s) for the given process description
pids=$(pgrep -f "$1")
pidsA=$(pgrep -f -a "$1")

# Check if any process IDs were found
if [ -z "$pids" ]; then
  echo "No process found for description: $1"
  exit 0
fi

# Print the process ID(s)
echo "Process ID(s) for '$1':"
echo "$pidsA"

  # Ask if the user wants to kill all processes or specify one
    read -p "Do you want to kill all these processes? (y/n): " kill_all

    if [ "$kill_all" == "y" ]; then
        echo "$pids" | xargs kill
        echo "All processes killed."
    else
        read -p "Enter the PID to kill: " pid_to_kill
        kill $pid_to_kill
        echo "Process $pid_to_kill killed."
    fi

}
