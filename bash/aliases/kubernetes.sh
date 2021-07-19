#kubectl scale deployment em-hrs-ingestor-java --replicas 0

alias .helm.list='helm list -a'
















alias .kubectl.describe.hr.ingestor='kubectl describe hr -n em em-hrs-ingestor'
alias .kubectl.describe.hr.api='kubectl describe hr -n em em-hrs-api'



alias .kubectl.describe.images.hrs.ingestor.context.all.perftest='...kubectl.describe.images.hrs.ingestor.context.all.perftest'

function ...kubectl.describe.images.hrs.ingestor.context.all.perftest() {
  .kubectl.context.perftest.00
  kubectl describe pod -l app.kubernetes.io/name=em-hrs-ingestor-job | egrep "mage|Start|State|^Name:"
  .kubectl.context.perftest.01
  kubectl describe pod -l app.kubernetes.io/name=em-hrs-ingestor-job | egrep "mage|Start|State|^Name:"
}












alias .kubectl.describe.images.hrs.api.context.all.perftest='...kubectl.describe.images.hrs.api.context.all.perftest'

function ...kubectl.describe.images.hrs.api.context.all.perftest() {
  .kubectl.context.perftest.00
  kubectl describe pod -l app.kubernetes.io/name=em-hrs-api-java | egrep "mage|Start|State|^Name:"
  .kubectl.context.perftest.01
  kubectl describe pod -l app.kubernetes.io/name=em-hrs-api-java | egrep "mage|Start|State|^Name:"
}



alias .kubectl.cluster-info='kubectl cluster-info'

alias .kubectl.context.aat.00='kubectl config use-context aat-00-aks'
alias .kubectl.context.aat.01='kubectl config use-context aat-01-aks'
alias .kubectl.context.demo.01='kubectl config use-context demo-01-aks'
alias .kubectl.context.k3d='kubectl config use-context k3d-k3s-default'
alias .kubectl.context.perftest.00='kubectl config use-context perftest-00-aks'
alias .kubectl.context.perftest.01='kubectl config use-context perftest-01-aks'
alias .kubectl.context.preview.00='kubectl config use-context preview-00-aks'
alias .kubectl.context.preview.01='kubectl config use-context preview-01-aks'
alias .kubectl.context.prod.00='kubectl config use-context prod-00-aks'
alias .kubectl.context.prod.01='kubectl config use-context prod-01-aks'
alias .kubectl.context.show='kubectl config get-contexts'
alias .kubectl.context.namespace.em='kubectl config set-context --current --namespace=em'


alias .kubectl.delete.api.perf='.kubectl.context.perftest.00 && kubectl delete pods -l app.kubernetes.io/name=em-hrs-api-java && .kubectl.context.perftest.01 && kubectl delete pods -l app.kubernetes.io/name=em-hrs-api-java '
alias .kubectl.delete.api='kubectl delete pods -l app.kubernetes.io/name=em-hrs-api-java'
alias .kubectl.delete.hrs-all='kubectl delete pods -l in (em-hrs-api-java,em-hrs-ingestor-java)'
alias .kubectl.delete.ingestor='kubectl delete pods -l app.kubernetes.io/name=em-hrs-api-java'
alias .kubectl.delete='kubectl delete pods'

alias .kubectl.deployment.describe='kubectl describe deployment'
alias .kubectl.deployments.get.all='kubectl get all'
alias .kubectl.deployments.get='kubectl get deployments'

alias .kubectl.describe.images.hrs.api.context.all.perftest='...kubectl.describe.images.hrs.api.context.all.perftest'
alias .kubectl.describe.job='kubectl describe job'
alias .kubectl.describe.pod='kubectl describe pod'

alias .kubectl.events.get.by.name='kubectl get events --sort-by involvedObject.name'
alias .kubectl.events.get.by.time='kubectl get events --sort-by lastTimestamp'

alias .kubectl.flux.logs.em='kubectl logs -n admin -f deployment.apps/flux-helm-operator | grep targetNamespace=em'
alias .kubectl.flux.logs.hrs='kubectl logs -n admin -f deployment.apps/flux-helm-operator | grep release=em-hrs'

alias .kubectl.hostnames='kubectl get ingress'

alias .kubectl.cronjob.watch='kubectl get cronjobs --watch'
alias .kubectl.cronjob='kubectl get cronjobs'

alias .kubectl.jobs.list='kubectl get jobs'


alias .kubectl.log.all="kubectl logs -f --tail 500 -l 'app.kubernetes.io/name in (em-hrs-api-java,em-hrs-ingestor-java,em-hrs-api-java-78dcfd6f49-9d48r,em-hrs-api-java-78dcfd6f49-cpq8t,em-hrs-api-java-78dcfd6f49-7c7tp,em-hrs-api-java-78dcfd6f49-rh7jq)'"
alias .kubectl.log.api='kubectl logs -f --tail 500 -l app.kubernetes.io/name=em-hrs-api-java'
alias .kubectl.log.ingestor='kubectl logs -f --tail 500 -l app.kubernetes.io/name=em-hrs-ingestor-java'
alias .kubectl.log.nofollow='kubectl logs'
alias .kubectl.log='kubectl logs -f --tail 500'

alias .kubectl.pods.list='kubectl get pods'
alias .kubectl.traefic.admin='kubectl get service traefik -n admin -o json'





function ...kubectl.describe.images.hrs.api.context.all.perftest() {
  .kubectl.context.perftest.00
  kubectl describe pod -l app.kubernetes.io/name=em-hrs-api-java | egrep "mage|Start|State|^Name:"
  .kubectl.context.perftest.01
  kubectl describe pod -l app.kubernetes.io/name=em-hrs-api-java | egrep "mage|Start|State|^Name:"
}



alias .kubectl.describe.images.hrs.api.context.all.prod='...kubectl.describe.images.hrs.api.context.all.prod'
function ...kubectl.describe.images.hrs.api.context.all.prod() {
  .kubectl.context.prod.00
  kubectl describe pod -l app.kubernetes.io/name=em-hrs-api-java | egrep "mage|Start|State|^Name:"
  .kubectl.context.prod.01
  kubectl describe pod -l app.kubernetes.io/name=em-hrs-api-java | egrep "mage|Start|State|^Name:"
}




alias .kubectl.log.all.contexts.aat='...kubectl.log.all.contexts.aat'

function ...kubectl.log.all.contexts.aat() {
  .kubectl.context.aat.00
  .kubectl.log.all &
  .kubectl.context.aat.01
  .kubectl.log.all &
  echo "logging all"
}

alias .kubectl.log.all.contexts.perftest='...kubectl.log.all.contexts.perftest'
function ...kubectl.log.all.contexts.perftest() {
  .kubectl.context.perftest.00
  .kubectl.log.all &
  .kubectl.context.perftest.01
  .kubectl.log.all &
  echo "logging all"
}

alias .kubectl.log.all.contexts.perftest.tofiles='...kubectl.log.all.contexts.perftest.tofiles'
function ...kubectl.log.all.contexts.perftest.tofiles() {
  .kubectl.context.perftest.00
  kubectl logs -l 'app.kubernetes.io/name in (em-hrs-api-java,em-hrs-ingestor-java)' --tail=-1 > perf.00.log.txt
  .kubectl.context.perftest.01
  kubectl logs -l 'app.kubernetes.io/name in (em-hrs-api-java,em-hrs-ingestor-java)' --tail=-1 > perf.01.log.txt
  cat perf.00.log.txt perf.01.log.txt | sort > perf.txt
  echo "logging all"
}


alias .kubectl.log.all.contexts.prod='...kubectl.log.all.contexts.prod'
function ...kubectl.log.all.contexts.prod() {
  .kubectl.context.prod.00
  .kubectl.log.all &
  .kubectl.context.prod.01
  .kubectl.log.all &
  echo "logging all"
}


