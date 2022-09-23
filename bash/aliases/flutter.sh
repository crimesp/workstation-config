### DART

alias .d.pub.get='fvm dart pub get'
alias .d.pub.outdated.mode.nullsafety='fvm dart pub outdated --mode=null-safety'

alias .d.pub.upgrade='fvm dart pub upgrade'
alias .d.pub.upgrade.major.versions='fvm dart pub upgrade --major-versions'
alias .d.pub.upgrade.mode.nullsafety='fvm dart pub upgrade --null-safety'


alias .d.analyze='fvm dart analyze'

alias .d.migrate='fvm dart migrate'

alias .d.fix.dryrun='fvm dart fix --dry-run'
alias .d.fix.apply='fvm dart fix --apply'





### FLUTTER

# Fast track to get a project running on linux
# 1) pin project to appropriate version of flutter (might not be latest!!)
# 2) create a linux configu
# 3) run it
#
# .v.use.3.3.2
# .f.create.linux
# .f.run.linux



#list available emulators & device ids
alias .f.emulators='fvm flutter emulators'


#hard clean of dart, useful when switching between flutter/dart versions
alias .f.clean='rm -rf .dart.tool && rm -rf build'



#create linux config for projects not yet configured for linux
alias .f.create='.f.create.linux'
alias .f.create.linux='fvm flutter create --platforms linux .'
alias .f.create.web='fvm flutter create --platforms web .'



#Build Modes - https://docs.flutter.dev/testing/build-modes
#Note - Hot reload works only in debug mode.

#Build in debug mode
alias .f.run='.f.run.linux'
alias .f.run.nonull='.f.run.linux --no-sound-null-safety'

alias .f.run.linux='fvm flutter --version && fvm flutter run -d linux'
alias .f.run.chrome='fvm flutter --version && fvm flutter run -d chrome'


#Build a version of your app specialized for performance profiling.
alias .f.run.profile='.f.run.profile.linux'
alias .f.run.profile.linux='fvm flutter run --profile -d linux'

#Build a release version of your app
alias .f.run.release='.f.run.release.linux'
alias .f.run.release.profile.linux='fvm flutter run --release -d linux'



#run the (default/expected) main dart file
alias .f.run.main.dart='.f.run.linux lib/main.dart'

#run all the apps in the specified directory
alias .f.run.subdirs='find . -name pubspec.yaml -execdir bash -c "pwd && fvm flutter run -d linux &" \;'

#create linux configs for all the apps in the specified directory
alias .f.create.subdirs='find . -name pubspec.yaml -execdir bash -c "pwd && fvm flutter create --platforms linux . &" \;'

alias .f.run.build-runner='fvm flutter packages pub run build_runner build'



alias .f.upgrade='flutter upgrade'

alias .f.pub.get='fvm flutter pub get'

alias .f.pub.update='fvm flutter pub update'

alias .f.pub.dependencies='yq pubspec.yaml .dependencies'

alias .f.pub.dependencies.r='.files.find.and.yq pubspec.yaml ".dependencies"'




alias .f.help='fvm flutter --help --verbose'

alias .f.doctor='fvm flutter doctor'

alias .f.build='fvm flutter build'

alias .f.build.linux='fvm flutter build linux'

alias .f.project.sdk="yq '.environment.sdk' < pubspec.yaml"

alias .f.pub.update-packages='fvm flutter update-packages'





### FLUTTER VERSION MANAGER


alias .v.version='fvm flutter --version'
alias .f.version='.v.version'


alias .v.releases='fvm releases'

alias .v.list='fvm list'

#.v.use.xxxx  - pin project to specific version of flutter
alias .v.use.0.6.0='fvm use v0.6.0'

alias .v.use.2.2.2='fvm use 2.2.2'

alias .v.use.2.8.1='fvm use 2.8.1'

alias .v.use.2.10.5='fvm use 2.10.5'

alias .v.use.3.3.2='fvm use 3.3.2'

alias .v.use.stable='fvm use stable'

alias .v.use.1.11.0='fvm use v1.11.0'

alias .v.use.2.13.0-0.4.pre='fvm use 2.13.0-0.4.pre'

alias .v.use.2.12.0-4.2.pre='fvm use 2.12.0-4.2.pre'












#mason
# https://github.com/felangel/mason/tree/master/packages/mason_cli
# https://brickhub.dev/search?q=riverpod
#
# note - if mason/fvm etc have been installed via brew instead of dart, run
# brew upgrade (it may take a while!)


# mason update
#
# mason search river*
#
# mason init
# mason add riverpod_clean_architecture
# mason make riverpod_clean_architecture
#
#

alias .m.init='mason init'
alias .m.add='mason add '
alias .m.add.globally='mason add -g '
alias .m.make='mason make '

function .m.create() {



  BRICKNAME=$1;


     if [ -z "$BRICKNAME" ]
      then
          echo "Supply the brick name to build"
      return 1
      fi


   mkdir $BRICKNAME;
   cd $BRICKNAME;
   .m.init
   .m.add $BRICKNAME
   .m.make $BRICKNAME

}
