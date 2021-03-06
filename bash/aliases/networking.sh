#inspect the tables of IPv4 and IPv6 packet filter rules in the Linux kernel
alias .net.iptables_nat="sudo iptables -t nat -L -n"

alias .net.routing='netstat -rn'
alias .net.iprule_show=' ip rule show'

#endpoint monitor. Run `.listen 8081` and then test with `curl localhost:8081/test` to see packets sent
alias .net.listen_on_port='rc;echo 'listening...';nc -l -p '

alias .net.dns.dig='dig'
