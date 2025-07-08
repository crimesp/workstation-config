#update the user home to be where your main home / git repo is
#then run the following
#cp .profile  ~/.profile

export USER_HOME=/home/paul

export WORKSTATION_CONFIG=$USER_HOME/git/workstation-config
export BASH_INCLUDES=$USER_HOME/git/workstation-config/bash




eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export PATH="$PATH:$USER_HOME/fvm/default/bin"
export PATH="$PATH:/usr/lib/dart/bin"
export PATH="$PATH:$USER_HOME/android-studio/bin"

export PATH="$PATH:/home/paul/.local/bin"
export PATH="$PATH:/usr/local/bin"

#share sshagent through the same pipe
#rm $USER_HOME/.ssh/ssh-agent.$HOSTNAME.sock
rm -rf $USER_HOME/.ssh/ssh-agent.$HOSTNAME.sock
export SSH_AUTH_SOCK=$USER_HOME/.ssh/ssh-agent.$HOSTNAME.sock
ssh-add -l 2>/dev/null >/dev/null
if [ $? -ge 2 ]; then
  ssh-agent -a "$SSH_AUTH_SOCK" >/dev/null
fi

source $USER_HOME/.app_environment_settings
