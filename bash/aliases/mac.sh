alias .transitiontimer.fix.install='xattr -cr /Applications/Transition\ Timer.app'
alias .transitiontimer.fix.dmg='  xattr -d com.apple.quarantine TransitionTimer.dmg'
alias .transitiontimer.fix.dmg.hard='  xattr -cr TransitionTimer.dmg'


alias .transitiontimer.log="log stream --style compact --predicate 'process == \"Transition Timer\"'"
alias .transitiontimer.runcli='OS_ACTIVITY_MODE=disable /Applications/Transition\ Timer.app/Contents/MacOS/Transition\ Timer'
