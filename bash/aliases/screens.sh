#NOTE the labels, ie HDMI-1 will vary between devices
export UNAME_NODE_NAME=`uname -n`
echo "Network Name: $UNAME_NODE_NAME"

if [ "${UNAME_NODE_NAME}" = "paul-XPS-15-9550" ]; then
  RIGHT_SCREEN="HDMI-1"
  LEFT_SCREEN="eDP-1"
  PRIMARY_SCREEN=$RIGHT_SCREEN
  SECONDARY_SCREEN=$LEFT_SCREEN
  SECONDARY_SCREEN_POSITION="--left-of $PRIMARY_SCREEN"
fi

echo "PRIMARY SCREEN = $PRIMARY_SCREEN"




alias .screens.right.only="xrandr --output $RIGHT_SCREEN --auto --output $LEFT_SCREEN --off"
alias .screens.left.only="xrandr --output $RIGHT_SCREEN --off --output $LEFT_SCREEN --auto"
alias .screens.both="xrandr --output $PRIMARY_SCREEN --primary --output $SECONDARY_SCREEN $SECONDARY_SCREEN_POSITION  --auto"

#FOR ULTRAWIDE MONITOR to be tested
#alias .screens.3440="xrandr --output DP-1 --mode 3440x1440"
#alias .screens.1920="xrandr --output DP-1 --mode 1920x1080"
alias .screens.list='xrandr --listmonitors'
alias .screens.current='xrandr --current'
