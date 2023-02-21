#install dart sdk
https://dart.dev/get-dart

#dont use brew as sudo
#brew install fvm
brew tap leoafarias/fvm
brew install fvm

fvm install stable
  fvm global stable

echo 'export PATH="$PATH:/home/paul/fvm/default/bin"' >> ~/.profile

#add flutter bash completiond
fvm flutter bash-completion > "$BASH_INCLUDES/cli-etc/flutter-bash-completion.sh"



#dart based cli helpers
dart pub global activate mason_cli
dart pub global activate riverpod_cli
dart pub global activate very_good_cli




