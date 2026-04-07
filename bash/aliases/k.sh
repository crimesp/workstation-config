# =============================================================================
# kubectl helper aliases & functions
# =============================================================================

# --- ENV var setters ---
# Usage: .k.set.pod my-pod-name
alias .k.set.pod='export KPOD'
alias .k.set.srv='export KSRV'
alias .k.set.lport='export KLPORT'
alias .k.set.sport='export KSPORT'
alias .k.unset='unset KPOD KSRV KLPORT KSPORT'
alias .k.env='echo "KPOD=${KPOD}  KSRV=${KSRV}  KLPORT=${KLPORT}  KSPORT=${KSPORT}"'

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
  # usage: .k.pod.get.yaml [pod-name]  (falls back to $KPOD)
  local pod; pod=$(_k_resolve "$1" KPOD "pod name") || return 1
  kubectl get pods "$pod" -oyaml
}
alias .k.pod.get.yaml='_k_pod_get_yaml'

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
  # usage: .k.pod.portforward [pod-name] [local-port] [pod-port]
  #        falls back to $KPOD, $KLPORT, $KSPORT
  local pod; pod=$(_k_resolve "$1" KPOD "pod name") || return 1
  local lport; lport=$(_k_resolve "$2" KLPORT "local port") || return 1
  local sport; sport=$(_k_resolve "$3" KSPORT "pod/service port") || return 1
  kubectl port-forward "$pod" "${lport}:${sport}"
}
alias .k.pod.portforward='_k_pod_portforward'

_k_pod_delete() {
  # usage: .k.pod.delete [pod-name]  (falls back to $KPOD)
  local pod; pod=$(_k_resolve "$1" KPOD "pod name") || return 1
  kubectl delete pod "$pod"
}
alias .k.pod.delete='_k_pod_delete'

# --- kubectl pods aliases (no argument needed) ---
alias .k.pods.get='kubectl get pods'
alias .k.pods.get.ns='kubectl get pods -n'
alias .k.pod.yaml='kubectl get pods'

# --- kubectl services functions ---
_k_svc_yaml() {
  # usage: .k.svc.yaml [svc-name]  (falls back to $KSRV)
  local srv; srv=$(_k_resolve "$1" KSRV "service name") || return 1
  kubectl get svc "$srv" -oyaml
}
alias .k.svc.yaml='_k_svc_yaml'

_k_svc_portforward() {
  # usage: .k.svc.portforward [svc-name] [local-port] [svc-port]
  #        falls back to $KSRV, $KLPORT, $KSPORT
  local srv; srv=$(_k_resolve "$1" KSRV "service name") || return 1
  local lport; lport=$(_k_resolve "$2" KLPORT "local port") || return 1
  local sport; sport=$(_k_resolve "$3" KSPORT "service port") || return 1
  kubectl port-forward svc/"$srv" "${lport}:${sport}"
}
alias .k.svc.portforward='_k_svc_portforward'

# --- kubectl services aliases (no argument needed) ---
alias .k.services.get='kubectl get services'
alias .k.svc.get='kubectl get svc'
alias .k.svc.get.ns='kubectl get svc -n'

# --- kubectl ingress aliases ---
alias .k.ingress.get='kubectl get ingress'

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
alias .k.netpol.get='kubectl get networkpolicies'

