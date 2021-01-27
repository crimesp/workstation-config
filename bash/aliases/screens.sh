#NOTE the labels, ie HDMI-1-1 will vary between devices
alias .screens.right='xrandr --output HDMI-1-1 --auto --output eDP-1-1 --off'
alias .screens.left='xrandr --output HDMI-1-1 --off --output eDP-1-1 --auto'
alias .screens.both='xrandr --output HDMI-1-1 --primary --output eDP-1-1 --auto --left-of HDMI-1-1'
