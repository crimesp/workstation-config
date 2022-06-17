alias .d.pub.get='fvm dart pub get'
alias .d.pub.outdated.mode_nullsafety='fvm dart pub outdated --mode=null-safety'

alias .d.pub.upgrade='fvm dart pub upgrade'
alias .d.pub.upgrade.major_versions='fvm dart pub upgrade --major-versions'
alias .d.pub.upgrade.mode_nullsafety='fvm dart pub upgrade --null-safety'


alias .d.analyze='fvm dart analyze'

alias .d.migrate='fvm dart migrate'

alias .d.fix.dryrun='fvm dart fix --dry-run'
alias .d.fix.apply='fvm dart fix --apply'


alias .f.emulators='fvm flutter emulators'



alias .f.create='.f.create.linux'
alias .f.create.linux='fvm flutter create --platforms linux .'


alias .f.clean='rm -rf .dart_tool && rm -rf build'


alias .f.run='.f.run.linux'
alias .f.run.nonull='.f.run.linux --no-sound-null-safety'
alias .f.run.linux='fvm flutter --version && fvm flutter run -d linux'
alias .f.run.chrome='fvm flutter --version && fvm flutter run -d chrome'

alias .f.run.profile='.f.run.profile.linux'
alias .f.run.profile.linux='fvm flutter run --profile -d linux'

alias .f.run.release='.f.run.profile.linux'
alias .f.run.release.profile.linux='fvm flutter run --profile -d linux'

alias .f.run.lib='.f.run.linux lib/'




alias .f.pub.get='fvm flutter pub get'

alias .f.pub.update='fvm flutter pub update'


alias .f.help='fvm flutter --help --verbose'

alias .f.doctor='fvm flutter doctor'

alias .f.build='fvm flutter build'

alias .f.build.linux='fvm flutter build linux'

alias .f.project.sdk="yq '.environment.sdk' < pubspec.yaml"

alias .v.releases='fvm releases'

alias .v.list='fvm list'

alias .v.use.0.6.0='fvm use v0.6.0'

alias .v.use.2.2.2='fvm use 2.2.2'

alias .v.use.2.8.1='fvm use 2.8.1'

alias .v.use.2.10.5='fvm use 2.10.5'

alias .v.use.stable='fvm use stable'

alias .v.use.1.11.0='fvm use v1.11.0'

alias .v.use.2.13.0-0.4.pre='fvm use 2.13.0-0.4.pre'

alias .v.use.2.12.0-4.2.pre='fvm use 2.12.0-4.2.pre'
