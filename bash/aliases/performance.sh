alias .cpu.monitor='cpufreq-info  | grep current; .cpu.governor.show'

alias .cpu.governor.show='cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'
