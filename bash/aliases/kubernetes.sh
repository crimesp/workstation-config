#kubectl scale deployment em-hrs-ingestor-java --replicas 0

alias .kubernetes.cluster-info='kubectl cluster-info'

alias .kubernetes.context.aat.00='kubectl config use-context aat-00-aks'
alias .kubernetes.context.aat.01='kubectl config use-context aat-01-aks'
alias .kubernetes.context.k3d='kubectl config use-context k3d-k3s-default'
alias .kubernetes.context.perftest.00='kubectl config use-context perftest-00-aks'
alias .kubernetes.context.perftest.01='kubectl config use-context perftest-01-aks'
alias .kubernetes.context.preview.00='kubectl config use-context preview-00-aks'
alias .kubernetes.context.preview.01='kubectl config use-context preview-01-aks'
alias .kubernetes.context.show='kubectl config get-contexts'

alias .kubernetes.jobs.list='kubectl get cronjob'
alias .kubernetes.jobs.list.watch='kubectl get cronjob --watch'


alias .kubernetes.delete='kubectl delete pods'

alias .kubernetes.deployment.describe='kubectl describe deployment'
alias .kubernetes.deployments.get='kubectl get deployments'
alias .kubernetes.describe='kubectl describe pod'

alias .kubernetes.events.get.by.name='kubectl get events --sort-by involvedObject.name'
alias .kubernetes.events.get.by.time='kubectl get events --sort-by lastTimestamp'

alias .kubernetes.log='kubectl logs -f'
alias .kubernetes.log.hrs='kubectl logs -f -l app.kubernetes.io/name=em-hrs-api-java'
alias .kubernetes.log.ingestor='kubectl logs -f -l app.kubernetes.io/name=em-hrs-ingestor-java'
alias .kubernetes.log.all="kubectl logs -f -l 'app.kubernetes.io/name in (em-hrs-api-java,em-hrs-ingestor-java)'"

alias .kubernetes.log.all.contexts.aat='...kubernetes.log.all.contexts.aat'

function ...kubernetes.log.all.contexts.aat() {
  .kubernetes.context.aat.00
  .kubernetes.log.all &
  .kubernetes.context.aat.01
  .kubernetes.log.all &
  echo "logging all"
}


#job logs, to be refined once we see a job running, hopefully a different
# Replace "hello-4111706356" with the job name in your system
#jobpods=$(kubectl get pods --selector=job-name=hello-4111706356 --output=jsonpath={.items[*].metadata.name})
#Show jobpods log:
#kubectl logs $jobpods


alias .kubernetes.namespace.em='kubectl config set-context --current --namespace=em'

alias .kubernetes.pods.list='kubectl get pods'

alias .kubernetes.traefic.admin='kubectl get service traefik -n admin -o json'
