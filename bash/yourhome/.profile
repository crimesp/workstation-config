#append this running the following from this directory
#cat .profile >> ~/.profile

export WORKSTATION_CONFIG=~/git/workstation-config
export BASH_INCLUDES=~/git/workstation-config/bash




eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export PATH="$PATH:/home/paul/fvm/default/bin"
export PATH="$PATH:/usr/lib/dart/bin"

#share sshagent through the same pipe
#rm ~/.ssh/ssh-agent.$HOSTNAME.sock
rm -rf ~/.ssh/ssh-agent.$HOSTNAME.sock
export SSH_AUTH_SOCK=~/.ssh/ssh-agent.$HOSTNAME.sock
ssh-add -l 2>/dev/null >/dev/null
if [ $? -ge 2 ]; then
  ssh-agent -a "$SSH_AUTH_SOCK" >/dev/null
fi
source ~/.app_environment_settings

