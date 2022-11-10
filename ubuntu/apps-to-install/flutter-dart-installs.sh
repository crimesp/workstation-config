#dont use brew as sudo
#brew install fvm
brew tap leoafarias/fvm
brew install fvm

#brew install mason
brew tap felangel/mason
brew install mason



dart pub global activate riverpod_cli

#add flutter bash completiond


flutter bash-completion > "$BASH_INCLUDES/cli-etc/flutter-bash-completion.sh"