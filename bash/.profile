#note profile only loads when logging in, so changes here
#will not be reflected without a new session


#share sshagent through the same pipe
rm ~/.ssh/ssh-agent.$HOSTNAME.sock
rm -rf ~/.ssh/ssh-agent.$HOSTNAME.sock
export SSH_AUTH_SOCK=~/.ssh/ssh-agent.$HOSTNAME.sock
ssh-add -l 2>/dev/null >/dev/null
if [ $? -ge 2 ]; then
 ssh-agent -a "$SSH_AUTH_SOCK" >/dev/null
fi


#override prompt
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u:\[\033[01;34m\]\W\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u:\W\$ '
fi
#unset color_prompt force_color_prompt



# shows timestamp when running 'history'
export HISTTIMEFORMAT="%d/%m/%y %T "


#include custom aliases and functions
source $BASH_INCLUDES/source_aliases_and_functions.sh

#append paths etc for installed software
source $BASH_INCLUDES/paths.sh

#load environment and application secrets
source ~/.app_environment_settings

