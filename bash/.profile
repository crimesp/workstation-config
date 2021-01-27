#share sshagent through the same pipe
#rm ~/.ssh/ssh-agent.$HOSTNAME.sock
export SSH_AUTH_SOCK=~/.ssh/ssh-agent.$HOSTNAME.sock
ssh-add -l 2>/dev/null >/dev/null
if [ $? -ge 2 ]; then
  ssh-agent -a "$SSH_AUTH_SOCK" >/dev/null
fi

# shows timestamp when running 'history'
export HISTTIMEFORMAT="%d/%m/%y %T "

source $BASH_INCLUDES/source_aliases_and_functions.sh
