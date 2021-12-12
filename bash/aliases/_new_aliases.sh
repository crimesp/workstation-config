#placeholder for new aliases, to be organised later

alias .cd.legacy='cd ~/git/legacyapps/'

alias .git.reset.head='git reset HEAD .'

alias .clam.scan.full='clamscan / -v -r --exclude-dir .*ecryptfs.*"'


alias .cpu.monitor='cpufreq-info  | grep current; .cpu.governor.show'

alias .cpu.governor.show='cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'

alias .chrome.reset.hard='rm -rf ~/.config/google-chrome && rm -rf ~/.cache/google-chrome'

alias .net.stat.local='sudo netstat -plnt'
