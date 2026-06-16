# =============================================================================
# kubectl helper aliases & functions
# =============================================================================

#scale
alias .k.scale.deployment.govrules-tls='kubectl scale deployment govrules-tls --replicas='

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
alias .k.get.pods='kubectl get pods'
alias .k.get.pods.ns='kubectl get pods -n'
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

