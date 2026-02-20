#placeholder for new aliases, to be organised later
alias .screens.ultrawide.only='xrandr --output eDP-1 --off --output DP-1 --auto'

alias .grub.edit='sudo cp /etc/default/grub /etc/default/grub.bak && sudo vim /etc/default/grub && sudo update-grub'

#alias .system.show-login-session='loginctl show-session $(awk \'/tty/ {print $1}\' <(loginctl)) -p Type | awk -F= \'{print $2}\''


#aac not working on maccos
#function .ffmpeg.mp3-to-caf.aac.64() {
#  #AAC (preferred): Better sound quality at lower bitrates, iOS optimized.
#    if [ -z "$1" ]
#    then
#        echo "Supply a file name with no exetension"
#    return 1
#    fi
#
#    ffmpeg -i $1.mp3 -c:a aac -b:a 64k -ar 22050 -ac 1 $1.aac.caf
#
#}


function .ffmpeg.mp3-to-caf.adpcm.64() {
  #IMA ADPCM: Lower quality, but no need for runtime decoding on iOS (faster playback with low CPU usage).
    if [ -z "$1" ]
    then
        echo "Supply a file name with no exetension"
    return 1
    fi

ffmpeg -i $1.mp3 -c:a adpcm_ima_qt -ar 22050 -ac 1 $1.adpcm.caf

}

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

alias .cd.libraries_used='cd ~/git/flutter/libraries_used'
#git remote -v
#git remote add fork git@github.com:DashingDevelopers/talon-gaze-ocr.git
#git push -u fork linux_tweaks

#pull all
#find ~/.talon/user -name .git -print -execdir git pull --ff-only \;


#ffmpeg -i charlie\ and\ the\ chimp\ -\ sunnies\ promo.mp4 -b:a 320K -vn music.mp3
# ffmpeg -i music.mp3 -ss 00:00:07 -c:v copy -c:a copy musictrimmed.mp3
alias .workbreaktimer='/home/paul/git/flutter/wbt-vgv/work_break_timer/build/linux/x64/debug/bundle/work_break_timer'
alias .talon.log='tail -f ~/.talon/talon.log'
alias .git.tag='git tag -a '
alias .git.tag.push='git push origin --tags'
alias .mvn.deptree='mvn dependency:tree'
