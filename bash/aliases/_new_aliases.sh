#placeholder for new aliases, to be organised later

alias .git.reset.head='git reset HEAD .'

alias .clam.scan.full='clamscan / -v -r --exclude-dir .*ecryptfs.*"'


alias .cpu.monitor='cpufreq-info  | grep current; .cpu.governor.show'

alias .cpu.governor.show='cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'
