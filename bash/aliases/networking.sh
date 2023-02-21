#inspect the tables of IPv4 and IPv6 packet filter rules in the Linux kernel
alias .net.iptables.nat="sudo iptables -t nat -L -n"


alias .net.stat.local='sudo ss -plnt'
alias .net.routing='ss -rn'
alias .net.iprule.show=' ip rule show'

#endpoint monitor. Run `.listen 8081` and then test with `curl localhost:8081/test` to see packets sent
alias .net.listen.on.port='rc;echo 'listening...';nc -l -p '

alias .net.dns.dig='dig'

alias .net.dns.stats='sudo systemd-resolve --statistics'
alias .net.dns.flush='sudo systemd-resolve --flush-caches'