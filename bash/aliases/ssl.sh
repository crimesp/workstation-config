alias .ssl.client..help='openssl s_client -help'

alias .ssl.client.connect.to.host.port.443='openssl s_client -port 443 -host'
alias .ssl.client.connect.to.host.port.8443='openssl s_client -port 8443 -host'
alias .ssl.client.connect='.ssl.client.connect.to.host.port.443'

function .ssl.checkdates() {
     if [ -z "$1" ]
      then
          echo "Supply a host"
      return 1
      fi
  openssl s_client -port 443 -showcerts -host $1 | openssl x509 -noout -dates
}
