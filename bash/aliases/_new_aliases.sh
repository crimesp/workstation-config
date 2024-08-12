#placeholder for new aliases, to be organised later
alias .screens.ultrawide.only='xrandr --output eDP-1 --off --output DP-1 --auto'

alias .grub.edit='sudo cp /etc/default/grub /etc/default/grub.bak && sudo vim /etc/default/grub && sudo update-grub'

#alias .system.show-login-session='loginctl show-session $(awk \'/tty/ {print $1}\' <(loginctl)) -p Type | awk -F= \'{print $2}\''

alias .ffmpeg='ffmpeg -i simvegas-circuitoverload.wav -acodec mp3 simonvegas-circuitoverload.mp3'
#ffmpeg -i input_video.mp4 -vn -acodec copy output_audio.m4a   #extract audio from video no re-encoding
#alias .i3.bindings='grep -e '^[^#]*bind' ~/.config/i3/config'
alias .x.window.class.show='xprop WM_CLASS'
alias .x.window.class.show='xprop WM_CLASS'
alias .x.window.class.show='xprop WM_CLASS'
alias .net.list.devices='lspci'
alias .net.listhardware='lshw -C network'
alias .net.network.list='lshw -C network'
alias .network.reinstall='uname -a &&  apt reinstall linux-modules-extra-'


#git remote -v
#git remote add fork git@github.com:DashingDevelopers/talon-gaze-ocr.git
#git push -u fork linux_tweaks

#pull all
#find ~/.talon/user -name .git -print -execdir git pull --ff-only \;


#ffmpeg -i charlie\ and\ the\ chimp\ -\ sunnies\ promo.mp4 -b:a 320K -vn music.mp3
# ffmpeg -i music.mp3 -ss 00:00:07 -c:v copy -c:a copy musictrimmed.mp3

alias .talon.log='tail -f ~/.talon/talon.log'
