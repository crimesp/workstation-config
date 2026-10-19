# =============================================================================
# kubectl helper aliases & functions
# =============================================================================

source <(kubectl completion bash) # set up autocomplete in bash into the current shell, bash-completion package should be installed first.
alias k=kubectl
complete -o default -F __start_kubectl k

alias .k.report.deployment-status='_k_report_deployment_status'
function _k_report_deployment_status() {
printf "%-45s %-50s %-20s %-15s\n" "NAMESPACE" "APP" "VERSION" "STATUS"
printf "%-45s %-50s %-20s %-15s\n" "---------" "---" "-------" "------"
for ns in tenant-asas-returns-dev tenant-asas-calculations-dev tenant-asas-returns-test tenant-asas-calculations-test tenant-asas-returns-sit tenant-asas-calculations-sit; do
  kubectl get pods -n $ns \
    -l 'app.kubernetes.io/name in (individual-returns-service, govrules-tls, calculation-govrules-adapter-service, validation-govrules-adapter-service, govrules-tls)' \
    -o jsonpath='{range .items[*]}{.metadata.namespace}{"\t"}{.metadata.labels.app.kubernetes.io/name}{"\t"}{.metadata.labels.version}{"\t"}{.status.phase}{"\n"}{end}' 2>/dev/null
done | awk '{printf "%-45s %-50s %-20s %-15s\n", $1, $2, $3, $4}'
}

alias .k.rollout.restart.govrules-tls='k rollout restart deployment govrules-tls'
alias .k.rollout.restart.govrules-tls.dev='.k.rollout.restart.govrules-tls -n tenant-asas-calculations-dev'
alias .k.rollout.restart.govrules-tls.test='.k.rollout.restart.govrules-tls -n tenant-asas-calculations-test'

alias .k.rollout.delete-pods.govrules-tls='k delete pods -l app=govrules-tls'
alias .k.rollout.delete-pods.govrules-tls.dev='.k.rollout.delete-pods.govrules-tls -n tenant-asas-calculations-dev'
alias .k.rollout.delete-pods.govrules-tls.test='.k.rollout.delete-pods.govrules-tls -n tenant-asas-calculations-test'

alias .k.port-forward.returns='.k.portforward.svc individual-returns-service 50051 50051'
alias .k.port-forward.returns.dev='kubectl port-forward svc/individual-returns-service 50051:50051 -n tenant-asas-returns-dev'
alias .k.port-forward.returns.test='kubectl port-forward svc/individual-returns-service 50051:50051 -n tenant-asas-returns-test'



alias .k.port-forward.adapter='.k.portforward.svc validation-govrules-adapter-service 50051 50051'
alias .k.port-forward.adapter.dev='kubectl port-forward svc/validation-govrules-adapter-service 50051:50051 -n tenant-asas-calculations-dev'
alias .k.port-forward.adapter.test='kubectl port-forward svc/validation-govrules-adapter-service 50051:50051 -n tenant-asas-calculations-test'

alias .k.port-forward.govrules='.k.portforward.svc svc/govrules-tls 8443 443'
alias .k.port-forward.govrules.dev='kubectl port-forward svc/govrules-tls 8443:443 -n tenant-asas-calculations-dev'
alias .k.port-forward.govrules.test='kubectl port-forward svc/govrules-tls 8443:443 -n tenant-asas-calculations-test'

alias .l.ssh-tunnel.govrules='echo "port forward to 8443 - press Ctrl+C to exit"; ssh -L 8443:localhost:8443 d4d'
alias .l.ssh-tunnel.govrules.8083='echo "port forward to 8083 - press Ctrl+C to exit"; ssh -L 8083:localhost:8080 d4d'

#scale



alias .k.scale.deployment='k_scale_deployment'
alias .k.scale.deployment.govrules-tls='k_scale_deployment govrules-tls'
k_scale_deployment() {
  if [[ -z "$1" || -z "$2" ]]; then
    echo "ERROR: deployment name and replica count must be provided." >&2
    return 1
  fi
  kubectl scale deployment "$1" --replicas="$2"
}

#get events
alias .k.get.events='kubectl get events --sort-by=.lastTimestamp | tail -n 30'
alias .k.get.events.calculations.test='kubectl get events -n tenant-asas-calculations-test --sort-by=.lastTimestamp | tail -n 30'
alias .k.get.events.calculations.dev='kubectl get events -n tenant-asas-calculations-dev --sort-by=.lastTimestamp | tail -n 30'







#show windows nodes in the cluster
alias .k.nodes.calculations.test.win='kubectl get nodes -n tenant-asas-calculations-test --show-labels | grep win'
alias .k.nodes.calculations.dev.win='kubectl get nodes -n tenant-asas-calculations-dev --show-labels | grep win'

#show cpu usage
alias .k.nodes.usage.cpu.win='kubectl get nodes -l kubernetes.io/os=windows -o custom-columns=NODE:.metadata.name,CAPACITY_CPU:.status.capacity.cpu,ALLOCATABLE_CPU:.status.allocatable.cpu'



#show top nodes
alias .k.nodes.top='kubectl top nodes'
alias .k.nodes.top.win='kubectl top nodes -l kubernetes.io/os=windows'


alias .k.node.describe.resources-and-events="kubectl describe node <node-name> | sed -n '/Allocated resources:/,/Events:/p"


# --- ENV var setters ---
alias .k.env='echo "KPOD=${KPOD}  KSRV=${KSRV}  KNS=${KNS}  KLPORT=${KLPORT}  KSPORT=${KSPORT}"'

# --- namespace helpers ---
# .k.ns.set [namespace]  — sets $KNS AND switches the current context's default namespace
_k_ns_set() {
  local ns; ns=$(_k_resolve "$1" KNS "namespace") || return 1
  export KNS="$ns"
  kubectl config set-context --current --namespace="$ns"
}

alias .k.set.ns='_k_ns_set'
alias .k.set.ns.tenant-asas-calculations-dev='.k.set.ns tenant-asas-calculations-dev'
alias .k.set.ns.tenant-asas-calculations-test='.k.set.ns tenant-asas-calculations-test'
alias .k.set.ns.tenant-asas-returns-dev='.k.set.ns tenant-asas-returns-dev'
alias .k.set.ns.tenant-asas-returns-test='.k.set.ns tenant-asas-returns-test'



# .k.get.ns  — show the current context's default namespace
alias .k.get.ns='kubectl config view --minify --output "jsonpath={.contexts[0].context.namespace}"'

# .k.ns.list — list all namespaces in the cluster
alias .k.ns.list='kubectl get namespaces'

# --- common resolver ---
# Usage: _k_resolve <value-from-arg> <env-var-name> <description>
# Prints the resolved value to stdout; returns 1 if neither arg nor env var is set.
_k_resolve() {
  local val="$1"
  local env_name="$2"
  local description="$3"
  if [[ -n "$val" ]]; then
    echo "$val"
    return 0
  fi
  local env_val="${!env_name}"
  if [[ -n "$env_val" ]]; then
    echo "$env_val"
    return 0
  fi
  echo "ERROR: $description not provided. Pass as argument or set \$$env_name" >&2
  return 1
}

# --- kubectl pods functions ---
_k_pod_get_yaml() {
  # usage: .k.get.pod.yaml [pod-name]  (falls back to $KPOD)
  local pod; pod=$(_k_resolve "$1" KPOD "pod name") || return 1
  kubectl get pods "$pod" -oyaml
}
alias .k.get.pod.yaml='_k_pod_get_yaml'

_k_pod_inspect() {
  # usage: .k.pod.inspect [pod-name]  (falls back to $KPOD)
  local pod; pod=$(_k_resolve "$1" KPOD "pod name") || return 1
  kubectl get pod "$pod" -n tenant-asas-calculations-test -o jsonpath='{.metadata.annotations}{"\n"}{.metadata.labels}{"\n"}{range .spec.initContainers[*]}init:{.name}{" "}{end}{range .spec.containers[*]}ctr:{.name}{" "}{end}{"\n"}'
}
alias .k.pod.inspect='_k_pod_inspect'

_k_pod_describe() {
  # usage: .k.pod.describe [pod-name]  (falls back to $KPOD)
  local pod; pod=$(_k_resolve "$1" KPOD "pod name") || return 1
  kubectl describe pod "$pod" -n tenant-asas-calculations-test
}
alias .k.pod.describe='_k_pod_describe'

_k_pod_logs() {
  # usage: .k.pod.logs [pod-name]  (falls back to $KPOD)
  local pod; pod=$(_k_resolve "$1" KPOD "pod name") || return 1
  kubectl logs "$pod"
}
alias .k.pod.logs='_k_pod_logs'

_k_pod_logs_follow() {
  # usage: .k.pod.logs.follow [pod-name]  (falls back to $KPOD)
  local pod; pod=$(_k_resolve "$1" KPOD "pod name") || return 1
  kubectl logs "$pod" -f
}
alias .k.pod.logs.follow='_k_pod_logs_follow'

_k_pod_exec() {
  # usage: .k.pod.exec [pod-name]  (falls back to $KPOD)
  local pod; pod=$(_k_resolve "$1" KPOD "pod name") || return 1
  kubectl exec "$pod" -it -- sh
}
alias .k.pod.exec='_k_pod_exec'

_k_pod_portforward() {
  # usage: .k.portforward.pod [pod-name] [local-port] [pod-port]
  #        falls back to $KPOD, $KLPORT, $KSPORT
  local pod; pod=$(_k_resolve "$1" KPOD "pod name") || return 1
  local lport; lport=$(_k_resolve "$2" KLPORT "local port") || return 1
  local sport; sport=$(_k_resolve "$3" KSPORT "pod/service port") || return 1
  kubectl port-forward "$pod" "${lport}:${sport}"
}
alias .k.portforward.pod='_k_pod_portforward'

_k_pod_delete() {
  # usage: .k.delete.pod [pod-name]  (falls back to $KPOD)
  local pod; pod=$(_k_resolve "$1" KPOD "pod name") || return 1
  kubectl delete pod "$pod"
}
alias .k.delete.pod='_k_pod_delete'

# --- kubectl pods aliases (no argument needed) ---
alias .k.get.pods='kubectl get pods -L version'
alias .k.get.pods.ns='kubectl get pods -L version -n'
alias .k.pod.yaml='kubectl get pods'
alias .k.get.pods.kns='kubectl get pods -n "${KNS}"'

# --- kubectl services functions ---
_k_svc_yaml() {
  # usage: .k.svc.yaml [svc-name]  (falls back to $KSRV)
  local srv; srv=$(_k_resolve "$1" KSRV "service name") || return 1
  kubectl get svc "$srv" -oyaml
}
alias .k.svc.yaml='_k_svc_yaml'

_k_svc_portforward() {
  # usage: .k.portforward.svc [svc-name] [local-port] [svc-port]
  #        falls back to $KSRV, $KLPORT, $KSPORT
  local srv; srv=$(_k_resolve "$1" KSRV "service name") || return 1
  local lport; lport=$(_k_resolve "$2" KLPORT "local port") || return 1
  local sport; sport=$(_k_resolve "$3" KSPORT "service port") || return 1
  kubectl port-forward svc/"$srv" "${lport}:${sport}"
}
alias .k.portforward.svc='_k_svc_portforward'

# --- kubectl services aliases (no argument needed) ---
alias .k.get.services='kubectl get services'
alias .k.get.svc='kubectl get svc'
alias .k.get.svc.ns='kubectl get svc -n'
alias .k.get.svc.kns='kubectl get svc -n "${KNS}"'

# --- kubectl ingress aliases ---
alias .k.get.ingress='kubectl get ingress'
alias .k.get.ingress.kns='kubectl get ingress -n "${KNS}"'

# --- kubectl networkpolicies functions ---
_k_netpol_yaml() {
  # usage: .k.netpol.yaml <netpol-name>  (no ENV var fallback for netpol)
  if [[ -z "$1" ]]; then
    echo "ERROR: network policy name not provided." >&2
    return 1
  fi
  kubectl get networkpolicies "$1" -oyaml
}
alias .k.netpol.yaml='_k_netpol_yaml'

# --- kubectl networkpolicies aliases (no argument needed) ---
alias .k.get.netpol='kubectl get networkpolicies'
