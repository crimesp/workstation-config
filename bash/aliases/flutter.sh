#!/usr/bin/env bash



##ruby (for building on mac)

alias .r.pod.update='cd ios && pod repo update'
alias .r.pod.install='sudo gem install cocoapods'




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


###DCM

alias ..dcm.with.license='fvm  flutter pub run dart_code_metrics:metrics  --ci-key=xxxxxxx --email=innocent.crimes@gmail.com'

alias .d.dcm.add.to.pubspec='fvm       flutter pub add --dev dart_code_metrics'
alias .d.dcm.add.defaults.to.pubspec='fvm flutter pub add --dev dart_code_metrics_presets'
alias .d.dcm.unusedcode='fvm  flutter pub run dart_code_metrics:metrics check-unused-files lib'

alias .dcm.analze='dcm analyze --ci-key=xxxx --email=innocent.crimes@gmail.com lib'
alias .dcm.unused.code='fvm  flutter pub run dart_code_metrics:metrics check-unused-files lib'


### FLUTTER

# Fast track to get a project running on linux
# 1) pin project to appropriate version of flutter (might not be latest!!)
# 2) create a linux configu
# 3) run it
#
# .v.use.3.3.2
# .f.create.linux
# .f.run.linux



#shows packages with later versions than current
alias .f.pub.outdate='fvm flutter pub outdated'
#upgrades to latest possible versions without breaking dependencies
alias .f.pub.upgrade.major.versions='fvm flutter pub upgrade --major-versions'

#upgraded to first avaialble null safe versions
alias .f.pub.upgrade.mode.nullsafety='fvm flutter pub upgrade --null-safety'



#list available emulators & device ids
alias .f.emulators='fvm flutter emulators'


#hard clean of dart, useful when switching between flutter/dart versions
alias .f.clean='fvm flutter clean && rm -rf .dart.tool && rm -rf build && rm -rf ~/.pub-cache && .f.pub.get'
#alias .f.clean='fvm flutter clean && rm -rf .dart.tool && rm -rf build && rm -rf $USER_HOME/.pub-cache && .f.pub.get'


#create linux config for projects not yet configured for linux
alias .f.create=".f.create.${myOS}"
alias .f.create.android='.f.create.with.safe.name android'
alias .f.create.ios='.f.create.with.safe.name ios'
alias .f.create.linux='.f.create.with.safe.name linux'
alias .f.create.web='.f.create.with.safe.name web'
alias .f.create.macos='.f.create.with.safe.name macos'



function .f.create.with.safe.name() {
  CURRENT=`pwd`
  BASENAME=`basename "$CURRENT"`

  SAFENAME="${BASENAME//-/_}"
  echo "Creating $1 project $SAFENAME"
  echo "fvm flutter create --template=app --platforms $1 --project-name $SAFENAME ."
  fvm flutter create --template=app --platforms $1 --project-name $SAFENAME .
}




#Build Modes - https://docs.flutter.dev/testing/build-modes
#Note - Hot reload works only in debug mode.

#Launch with URL from base path
#ie .f.launch home    or .f.launch.web home?p=1
alias .f.launch='.f.run.linux -a '
alias .f.launch.web='.f.run.chrome --web-launch-url '


alias .f.xcode.props='fvm flutter clean && rm ios/Podfile.lock pubspec.lock && rm -rf ios/Pods ios/Runner.xcworkspace && open ios/Runner.xcworkspace'






#VGV flavored builds:
#alias .f.build.apk.dev.debug='fvm flutter build apk --target-platform android-arm --flavor flavour_development --debug  --target lib/main_development.dart'
#alias .f.build.apk.dev.release='fvm flutter build apk --target-platform android-arm --flavor flavour_development --release  --target lib/main_development.dart'
#alias .f.build.apk.prod.release='fvm flutter build apk --target-platform android-arm --flavor flavour_production --release  --target lib/main_production.dart'
#alias .f.build.apk.dev.debug='fvm flutter build apk --target-platform android-arm --debug  --target lib/main_development.dart'
#alias .f.build.apk.prod.release='fvm flutter build apk --target-platform android-arm --release  --target lib/main_production.dart'
alias .f.build.apk.dev.debug='fvm flutter build apk --debug  --target lib/main_development.dart'
alias .f.build.apk.prod.release='fvm flutter build apk --release  --target lib/main_production.dart'



#adb  android debugger - (Need to build the apk first) -  you can attach to the device
# in profile and debug mode

alias adb='~/Android/Sdk/platform-tools/adb'

alias .adb.devices='adb devices -l'

alias .adb.release.s21='adb -s RF8N90L632Y install build/app/outputs/flutter-apk/app-release.apk'
alias .adb.profile.s21='adb -s RF8N90L632Y install build/app/outputs/flutter-apk/app-profile.apk'

alias .adb.release.kindle='adb -s G0W0MA078384F6ND install build/app/outputs/flutter-apk/app-release.apk'
alias .adb.profile.kindle='adb -s G0W0MA078384F6ND install build/app/outputs/flutter-apk/app-rprofile.apk'
#alias .adb.profile.kindle='adb -s G0W0MA078384F6ND install build/app/outputs/flutter-apk/app-profile.apk'
alias .adb.debug.kindle='adb -s G0W0MA078384F6ND install build/app/outputs/flutter-apk/app-debug.apk'


alias .adb.uninstall.kindle='adb -s G0W0MA078384F6ND uninstall com.workbreaktimer'
alias .adb.uninstall.kindle.keep_data='.adb.uninstall.kindle -k'

alias .adb.uninstall.s21='adb -s RF8N90L632Y uninstall com.workbreaktimer'
alias .adb.uninstall.s21.keep_data='.adb.uninstall.s21 -k'








#VGV flavored runs:

alias .f.run.development='.f.run --flavor development --target lib/main_development.dart'
alias .f.run.staging='.f.run --flavor staging --target lib/main_staging.dart'
alias .f.run.production='.f.run --flavor production --target lib/main_production.dart'





alias .f.devices='fvm flutter devices'

#Build in debug mode
alias .f.run=".f.run.$myOS"
alias .f.run.nonull='.f.run --no-sound-null-safety'

alias .f.run.linux='fvm flutter --version && fvm flutter run -d linux'
alias .f.run.macos='fvm flutter --version && fvm flutter run -d macos'
alias .f.run.android.samsung.a21s='fvm flutter --version && fvm flutter run -d RF8N90L632Y'
alias .f.run.ios.iphone.6s='fvm flutter --version && fvm flutter run -d 00008030-001005EA0E83802E'



alias .f.run.chrome='fvm flutter --version && fvm flutter run -d chrome'
alias .f.run.chrome.5000='.f.run.chrome --web-port 5000'
alias .f.run.chrome.5000.release='.f.run.chrome.5000 --release'
alias .f.run.chrome.5000.profile='.f.run.chrome.5000 --profile'
alias .f.run.chrome.app.widgetbook='fvm flutter --version && fvm flutter run -d chrome lib/app.widgetbook.dart'


#Build a version of your app specialized for performance profiling.
alias .f.run.profile='.f.run.profile.linux'
alias .f.run.profile.linux='fvm flutter run --profile -d linux'

#Build a release version of your app
alias .f.run.release='.f.run.release.linux'
alias .f.run.release.linux='fvm flutter run --release -d linux'



#run the (default/expected) main dart file
alias .f.run.main.dart='.f.run.linux lib/main.dart'
alias .f.run.app.widgetbook.dart='.f.run.linux lib/app.widgetbook.dart'
alias .f.run.main.widgetbook.dart='.f.run.linux lib/main.widgetbook.dart'

#run all the apps in the specified directory
alias .f.run.subdirs.linux='find . -name pubspec.yaml -execdir bash -c "pwd && fvm flutter run -d linux &" \;'
alias .f.run.subdirs.chrome='find . -name pubspec.yaml -execdir bash -c "pwd && fvm flutter run -d chrome &" \;'

#run all widget and unit tests
alias .f.test='fvm flutter test --coverage --test-randomize-ordering-seed random'

#required lcov
#sudo apt install lcov
#requies aliasing of xdg-open to open on linux
#sudo ln -s /usr/bin/xdg-open /usr/bin/open
alias .f.coverage='genhtml coverage/lcov.info -o coverage/ && open coverage/index.html'



#create linux configs for all the apps in the specified directory
alias .f.create.subdirs='find . -name pubspec.yaml -execdir bash -c "pwd && fvm flutter create --platforms linux . &" \;'

#doesnt make sense when using fvm
#alias .f.upgrade='flutter upgrade'




alias .f.pub.get='fvm flutter pub get'

alias .f.pub.dependencies='yq pubspec.yaml .dependencies'

alias .f.pub.dependencies.r='.files.find.and.yq pubspec.yaml ".dependencies"'

alias .f.pub.generate.licenses='fvm flutter pub run flutter_oss_licenses:generate.dart'
alias .f.pub.generate.intl='fvm flutter pub run intl_utils:generate'

alias .f.pub.add='fvm flutter pub add'

alias .f.pub.generate.splashscreen='fvm flutter pub run flutter_native_splash:create --path flutter_native_splash.yaml'

alias .f.help='fvm flutter --help --verbose'

alias .f.doctor='fvm flutter doctor'


#build package
alias .f.build=".f.build.${myOS}"
alias .f.build.linux='fvm flutter build linux --release'
alias .f.build.macos='fvm flutter build macos --release'
alias .f.build.web='fvm flutter build web --release'
alias .f.build.apk='fvm flutter build apk --release'
alias .f.build.ios='fvm flutter build ios --release'

#use build_runner (for autogen code)
alias .f.runner.clean='fvm flutter packages pub run build_runner clean'
alias .f.runner.build='fvm flutter packages pub run build_runner build --delete-conflicting-outputs'
alias .f.runner.watch='fvm flutter packages pub run build_runner watch --delete-conflicting-outputs'


alias .f.localization.generate.watch='watch fvm flutter gen-l10n'







alias .f.project.sdk="yq '.environment.sdk' < pubspec.yaml"

alias .f.pub.update-packages='fvm flutter update-packages'




alias .f.format.and.fix.all='dart format * --fix --line-length 160'





alias .f.firebase.login='firebase login'
alias .f.firebase.projects='firebase projects:list'
alias .f.firebase.init='firebase init'







### FLUTTER VERSION MANAGER


alias .v.version='fvm flutter --version'
alias .f.version='.v.version'


alias .v.releases='fvm releases'

alias .v.list='fvm list'

#.v.use.xxxx  - pin project to specific version of flutter
#alias .v.use.0.6.0='fvm use v0.6.0'
#
#alias .v.use.2.2.2='fvm use 2.2.2'
#
#alias .v.use.2.8.1='fvm use 2.8.1'
#
#alias .v.use.2.10.5='fvm use 2.10.5'
#
#alias .v.use.3.3.2='fvm use 3.3.2'
#
#alias .v.use.3.3.7='fvm use 3.3.7'
#
#alias .v.use.3.3.8='fvm use 3.3.8'
#
#alias .v.use.3.3.9='fvm use 3.3.9'
#
#alias .v.use.3.3.10='fvm use 3.3.10'

alias .v.use='fvm use'
alias .v.global='fvm global'

alias .v.use.stable='fvm use stable'
#
#alias .v.use.1.11.0='fvm use v1.11.0'
#
#alias .v.use.2.13.0-0.4.pre='fvm use 2.13.0-0.4.pre'
#
#alias .v.use.2.12.0-4.2.pre='fvm use 2.12.0-4.2.pre'












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
