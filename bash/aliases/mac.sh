#needed for after copying file to applications
alias .transitiontimer.fix.install='xattr -cr /Applications/Transition\ Timer*.app'

#not sure these are needed
alias .transitiontimer.fix.dmg='  xattr -d com.apple.quarantine TransitionTimer.dmg'
alias .transitiontimer.fix.dmg.hard='  xattr -cr TransitionTimer.dmg'