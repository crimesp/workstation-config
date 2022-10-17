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
alias .f.create.linux='.f.create.with.safe.name linux'
alias .f.create.web='.f.create.with.safe.name web'

function .f.create.with.safe.name() {
  CURRENT=`pwd`
  BASENAME=`basename "$CURRENT"`

  SAFENAME="${BASENAME//-/_}"
  echo "Creating $1 project $SAFENAME"
  fvm flutter create --platforms $1 --project-name $SAFENAME .
}


#Build Modes - https://docs.flutter.dev/testing/build-modes
#Note - Hot reload works only in debug mode.

#Launch with URL from base path
#ie .f.launch home    or .f.launch.web home?p=1
alias .f.launch='.f.run.linux -a '
alias .f.launch.web='.f.run.chrome --web-launch-url '



#VGV flavored runs:

alias .f.run.development='.f.run --flavor development --target lib/main_development.dart'
alias .f.run.staging='.f.run --flavor staging --target lib/main_staging.dart'
alias .f.run.production='.f.run --flavor production --target lib/main_production.dart'



#Build in debug mode
alias .f.run='.f.run.linux'
alias .f.run.nonull='.f.run.linux --no-sound-null-safety'

alias .f.run.linux='fvm flutter --version && fvm flutter run -d linux'
alias .f.run.chrome='fvm flutter --version && fvm flutter run -d chrome'
alias .f.run.chrome.app.widgetbook='fvm flutter --version && fvm flutter run -d chrome lib/app.widgetbook.dart'


#Build a version of your app specialized for performance profiling.
alias .f.run.profile='.f.run.profile.linux'
alias .f.run.profile.linux='fvm flutter run --profile -d linux'

#Build a release version of your app
alias .f.run.release='.f.run.release.linux'
alias .f.run.release.profile.linux='fvm flutter run --release -d linux'



#run the (default/expected) main dart file
alias .f.run.main.dart='.f.run.linux lib/main.dart'
alias .f.run.app.widgetbook.dart='.f.run.linux lib/app.widgetbook.dart'
alias .f.run.main.widgetbook.dart='.f.run.linux lib/main.widgetbook.dart'

#run all the apps in the specified directory
alias .f.run.subdirs='find . -name pubspec.yaml -execdir bash -c "pwd && fvm flutter run -d linux &" \;'

#run all widget and unit tests
alias .f.test='fvm flutter test --coverage --test-randomize-ordering-seed random'

#required lcov
#sudo apt install lcov
#requies aliasing of xdg-open to open on linux
#sudo ln -s /usr/bin/xdg-open /usr/bin/open
alias .f.coverage='genhtml coverage/lcov.info -o coverage/ && open coverage/index.html'



#create linux configs for all the apps in the specified directory
alias .f.create.subdirs='find . -name pubspec.yaml -execdir bash -c "pwd && fvm flutter create --platforms linux . &" \;'


alias .f.upgrade='flutter upgrade'




alias .f.pub.get='fvm flutter pub get'

alias .f.pub.update='fvm flutter pub update'

alias .f.pub.dependencies='yq pubspec.yaml .dependencies'

alias .f.pub.dependencies.r='.files.find.and.yq pubspec.yaml ".dependencies"'

alias .f.pub.generate.licenses='fvm flutter pub run flutter_oss_licenses:generate.dart'
alias .f.pub.generate.intl='fvm flutter pub run intl_utils:generate'

alias .f.pub.add='fvm flutter pub add'


alias .f.help='fvm flutter --help --verbose'

alias .f.doctor='fvm flutter doctor'


#build package
alias .f.build='fvm flutter build'
alias .f.build.linux='fvm flutter build linux'

#use build_runner (for autogen code)
alias .f.build.runner.build='fvm flutter packages pub run build_runner build'
alias .f.build.runner.watch='fvm flutter packages pub run build_runner watch'





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

alias .m.upgrade='echo "upgrading via brew" && brew upgrade'

alias .m.verygood.init.and.create.core.in.root='mason init; mason add very_good_core; mason make very_good_core'

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
