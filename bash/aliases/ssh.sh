alias .bastion.proxy='ssh -D 1800 -f -C -q -N bastion-dev'
alias .bastion.proxy.prod='ssh -D 1801 -f -C -q -N bastion-prod'

alias .bastion.proxy.cleanup='rm -rf ~/.ssh/controlpath*'

alias .ssh.add_bastion_keys='ssh-add ~/.ssh/id_rsa16k;'

########################################################
# ssh functions
########################################################

#ssh local port forward
#to port forward on port 8181 to 8181:
#.ssh_local_tunnel_on_port_to_host_same_port 8181 10.161.123.456

function .ssh_local_tunnel_on_port_to_host_same_port() {
    echo 'ssh -L $1:localhost:$1 $2'
    echo 'ssh -L %local-port%:localhost:%local-port% %ssh-host%'
    ssh -L $1:localhost:$1 $2
}

#for .ssh_local_tunnel_on_prefixport_to_host_same_port 443 jenkins.server
#use https://localhost:1443/
function .ssh_local_tunnel_on_specified_port_to_host_different_port() {
    echo 'running ssh -L $1:localhost:$3 $2'
    echo 'usage:  .ssh_local_tunnel_on_specified_port_to_host_different_port 8000 10.160.34.241 8181'
	echo "ssh -L $1:localhost:$3 $2"
    ssh -L $1:localhost:$3 $2
}

function .ssh_local_tunnel_on_specified_port_from_named_host_to_named_target_specified_port() {
    echo 'usage:  .ssh_local_tunnel_on_specified_port_to_host_different_port 8000 myproxy.com google.com 8181'
    echo 'ssh -L $1:$2:$4 $3'
    ssh -L $1:$2:$4 $3
}





function .ssh_tunnel_via_bastion_prod() {
    echo 'usage: .ssh_tunnel_via_bastion_prod localport targetserver targetport'
    echo 'eg: .ssh_tunnel_via_bastion_prod TARGETSERVER 8162'
    echo 'running ssh -L $1:bastion-prod:$3 $2'
    ssh -L $1:bastion-prod:$3 $2
}


function .ssh_tunnel_via_host() {
    echo 'usage: .ssh_tunnel_via_host localport hostserver targetport targetserver'
    echo 'eg: .ssh_tunnel_via_host 8000 JUMPSERVER 8162 TARGETSERVER'
    echo 'running ssh -L $1:$2:$3 $4'
    echo "running ssh -L $1:$2:$3 $4"
    ssh -L $1:$2:$3 $4;
}
