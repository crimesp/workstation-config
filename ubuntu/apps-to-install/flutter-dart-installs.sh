#dont use brew as sudo
#brew install fvm
brew tap leoafarias/fvm
brew install fvm

dart pub global activate mason_cli

dart pub global activate riverpod_cli

#add flutter bash completiond


fvm install stable
fvm global stable

flutter bash-completion > "$BASH_INCLUDES/cli-etc/flutter-bash-completion.sh"



#deps for audioplayers
sudo apt-get install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
