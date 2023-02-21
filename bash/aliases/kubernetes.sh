#kubectl scale deployment your-batchrunner-job --replicas 0

alias .helm.list='helm list -a'
alias .helm.uninstall.batchrunner='helm uninstall batchrunner-job'

alias .kubectl.hr.delete='kubectl delete hr'
alias .kubectl.hr.delete.api='kubectl delete hr your-api'
alias .kubectl.hr.delete.batchrunner='kubectl delete hr your-batchrunner'

alias .kubectl.flux.imagerepositories.batchrunner='kubectl get imagerepositories -n flux-system your-batchrunner'
alias .kubectl.flux.imagerepositories.api='kubectl get imagerepositories -n flux-system your-api'

alias .kubectl.flux.reflector.logs='kubectl logs -n flux-system -l app=image-reflector-controller'

alias .kubectl.flux.latestimage.api='kubectl get imagepolicies -n flux-system your-api'
alias .kubectl.flux.latestimage.batchrunner='kubectl get imagepolicies -n flux-system your-batchrunner'

alias .kubectl.flux.imageautomation='kubectl logs -n flux-system -l --tail=-1 app=image-automation-controller'





alias .kubectl.context.prod.pods='rc;date;.kubectl.context.prod.00;.kubectl.pods.list;echo;.kubectl.context.prod.01;.kubectl.pods.list;echo;echo '


alias .kubectl.describe.hr.batchrunner='kubectl describe hr -n em your-batchrunner'
alias .kubectl.describe.hr.api='kubectl describe hr -n em your-api'



alias .kubectl.describe.images.your-apps.batchrunner.context.all.perftest='...kubectl.describe.images.your-apps.batchrunner.context.all.perftest'

function ...kubectl.describe.images.your-apps.batchrunner.context.all.perftest() {
  .kubectl.context.perftest.00
  kubectl describe pod -l app.kubernetes.io/name=your-batchrunner-job | egrep "mage|Start|State|^Name:"
  .kubectl.context.perftest.01
  kubectl describe pod -l app.kubernetes.io/name=your-batchrunner-job | egrep "mage|Start|State|^Name:"
}












alias .kubectl.describe.images.your-apps.api.context.all.perftest='...kubectl.describe.images.your-apps.api.context.all.perftest'

function ...kubectl.describe.images.your-apps.api.context.all.perftest() {
  .kubectl.context.perftest.00
  kubectl describe pod -l app.kubernetes.io/name=your-api-java | egrep "mage|Start|State|^Name:"
  .kubectl.context.perftest.01
  kubectl describe pod -l app.kubernetes.io/name=your-api-java | egrep "mage|Start|State|^Name:"
}



alias .kubectl.cluster-info='kubectl cluster-info'

alias .kubectl.context.aat.00='kubectl config use-context aat-00-aks'
alias .kubectl.context.aat.01='kubectl config use-context aat-01-aks'


alias .kubectl.context.ithc.00='kubectl config use-context ithc-00-aks'
alias .kubectl.context.ithc.01='kubectl config use-context ithc-01-aks'


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
alias .kubectl.context.namespace.fluxsystem='kubectl config set-context --current --namespace=flux-system'

alias .kubectl.context.intsvc='kubectl config use-context ptl-intsvc-00-aks'



alias .kubectl.delete.api.perf='.kubectl.context.perftest.00 && kubectl delete pods -l app.kubernetes.io/name=your-api-java && .kubectl.context.perftest.01 && kubectl delete pods -l app.kubernetes.io/name=your-api-java '
alias .kubectl.delete.api='kubectl delete pods -l app.kubernetes.io/name=your-api-java'
alias .kubectl.delete.all='kubectl delete pods -l in (your-api-java,your-batchrunner-job)'
alias .kubectl.delete.batchrunner='kubectl delete pods -l app.kubernetes.io/name=your-api-java'
alias .kubectl.delete='kubectl delete pods'

alias .kubectl.deployment.describe='kubectl describe deployment'
alias .kubectl.deployments.get.all='kubectl get all'
alias .kubectl.deployments.get='kubectl get deployments'

alias .kubectl.describe.images.your-apps.api.context.all.perftest='...kubectl.describe.images.your-apps.api.context.all.perftest'
alias .kubectl.describe.job='kubectl describe job'
alias .kubectl.describe.pod='kubectl describe pod'

alias .kubectl.events.get.by.name='kubectl get events --sort-by involvedObject.name'
alias .kubectl.events.get.by.time='kubectl get events --sort-by lastTimestamp'

alias .kubectl.flux.logs.em='kubectl logs -n admin -f deployment.apps/flux-helm-operator | grep targetNamespace=em'
alias .kubectl.flux.logs.your-apps='kubectl logs -n admin -f deployment.apps/flux-helm-operator | grep release=your-'

alias .kubectl.hostnames='kubectl get ingress'

alias .kubectl.cronjob.watch='kubectl get cronjobs --watch'
alias .kubectl.cronjob='kubectl get cronjobs'

alias .kubectl.jobs.list='kubectl get jobs'


alias .kubectl.log.all="kubectl logs -f --tail 500 -l 'app.kubernetes.io/name in (your-api-java,your-batchrunner-job,your-api-java-78dcfd6f49-9d48r,your-api-java-78dcfd6f49-cpq8t,your-api-java-78dcfd6f49-7c7tp,your-api-java-78dcfd6f49-rh7jq)'"
alias .kubectl.log.api='kubectl logs -f --tail 500 -l app.kubernetes.io/name=your-api-java'
alias .kubectl.log.batchrunner='kubectl logs -f --tail 500 -l app.kubernetes.io/name=your-batchrunner-job'
alias .kubectl.log.nofollow='kubectl logs'
alias .kubectl.log='kubectl logs -f --tail 500'

alias .kubectl.pods.list='kubectl get pods'
alias .kubectl.traefic.admin='kubectl get service traefik -n admin -o json'





function ...kubectl.describe.images.your-apps.api.context.all.perftest() {
  .kubectl.context.perftest.00
  kubectl describe pod -l app.kubernetes.io/name=your-api-java | egrep "mage|Start|State|^Name:"
  .kubectl.context.perftest.01
  kubectl describe pod -l app.kubernetes.io/name=your-api-java | egrep "mage|Start|State|^Name:"
}



alias .kubectl.describe.images.your-apps.api.context.all.prod='...kubectl.describe.images.your-apps.api.context.all.prod'
function ...kubectl.describe.images.your-apps.api.context.all.prod() {
  .kubectl.context.prod.00
  kubectl describe pod -l app.kubernetes.io/name=your-api-java | egrep "mage|Start|State|^Name:"
  .kubectl.context.prod.01
  kubectl describe pod -l app.kubernetes.io/name=your-api-java | egrep "mage|Start|State|^Name:"
}




alias .kubectl.log.all.contexts.aat='...kubectl.log.all.contexts.aat'

function ...kubectl.log.all.contexts.aat() {
  .kubectl.context.aat.00
  .kubectl.log.all &
  .kubectl.context.aat.01
  .kubectl.log.all &
  echo "logging all"
}


alias .kubectl.log.all.contexts.aat.tofiles='...kubectl.log.all.contexts.aat.tofiles'
function ...kubectl.log.all.contexts.aat.tofiles() {
  .kubectl.context.aat.00
  kubectl logs -l 'app.kubernetes.io/name in (your-api-java,your-batchrunner-job)' --tail=-1 > ~/tmp/aat.00.log.txt
  .kubectl.context.aat.01
  kubectl logs -l 'app.kubernetes.io/name in (your-api-java,your-batchrunner-job)' --tail=-1 > ~/tmp/aat.01.log.txt
  cat ~/tmp/aat.00.log.txt ~/tmp/aat.01.log.txt | sort > ~/tmp/aat.log.txt
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
  kubectl logs -l 'app.kubernetes.io/name in (your-api-java,your-batchrunner-job)' --tail=-1 > ~/tmp/perftest.00.log.txt
  .kubectl.context.perftest.01
  kubectl logs -l 'app.kubernetes.io/name in (your-api-java,your-batchrunner-job)' --tail=-1 > ~/tmp/perftest.01.log.txt
  cat ~/tmp/perftest.00.log.txt ~/tmp/perftest.01.log.txt | sort > ~/tmp/perftest.log.txt
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


alias .kustomize.em.prod.common='kustomize build --load-restrictor LoadRestrictionsNone k8s/prod/common-overlay/em'
alias .kustomize.em.prod.cluster-00='kustomize build --load-restrictor LoadRestrictionsNone k8s/prod/cluster-00-overlay/em'
alias .kustomize.em.prod.cluster-01='kustomize build --load-restrictor LoadRestrictionsNone k8s/prod/cluster-01-overlay/em'


alias .kustomize.em.demo.common='kustomize build --load-restrictor LoadRestrictionsNone k8s/demo/common-overlay/em'
alias .kustomize.em.demo.cluster-00='kustomize build --load-restrictor LoadRestrictionsNone k8s/demo/cluster-00-overlay/em'
alias .kustomize.em.demo.cluster-01='kustomize build --load-restrictor LoadRestrictionsNone k8s/demo/cluster-01-overlay/em'



alias .kustomize.em.aat.common='kustomize build --load-restrictor LoadRestrictionsNone k8s/aat/common-overlay/em'
alias .kustomize.em.aat.cluster-00='kustomize build --load-restrictor LoadRestrictionsNone k8s/aat/cluster-00-overlay/em'
alias .kustomize.em.aat.cluster-01='kustomize build --load-restrictor LoadRestrictionsNone k8s/aat/cluster-01-overlay/em'

function .kustomize.em.app.for.env() {
  #usage: .kustomize.em.app.for.env your-api aat
  appname=$1
  env=$2
  echo "Showing Kustomize Rendering for application: $appname in environment: $env"
  kustomize build --load-restrictor LoadRestrictionsNone k8s/$env/common-overlay/em  | yq eval "select(.kind == \"HelmRelease\" and .metadata.name == \"${appname}\")" -
  kustomize build --load-restrictor LoadRestrictionsNone k8s/$env/cluster-00-overlay/em  | yq eval "select(.kind == \"HelmRelease\" and .metadata.name == \"${appname}\")" -
  kustomize build --load-restrictor LoadRestrictionsNone k8s/$env/cluster-01-overlay/em  | yq eval "select(.kind == \"HelmRelease\" and .metadata.name == \"${appname}\")" -
}

alias .kustomize.em.app.for.env..your-api.aat='.kustomize.em.app.for.env your-api aat'
alias .kustomize.em.app.for.env..your-api.demo='.kustomize.em.app.for.env your-api demo'
alias .kustomize.em.app.for.env..your-api.perftest='.kustomize.em.app.for.env your-api perftest'
alias .kustomize.em.app.for.env..your-api.prod='.kustomize.em.app.for.env your-api prod'
alias .kustomize.em.app.for.env..your-api.all='rc;.kustomize.em.app.for.env..your-api.aat && .kustomize.em.app.for.env..your-api.demo && .kustomize.em.app.for.env..your-api.perftest && .kustomize.em.app.for.env..your-api.prod'


alias .kustomize.em.app.for.env..your-batchrunner.aat='.kustomize.em.app.for.env your-batchrunner aat'
alias .kustomize.em.app.for.env..your-batchrunner.demo='.kustomize.em.app.for.env your-batchrunner demo'
alias .kustomize.em.app.for.env..your-batchrunner.perftest='.kustomize.em.app.for.env your-batchrunner perftest'
alias .kustomize.em.app.for.env..your-batchrunner.prod='.kustomize.em.app.for.env your-batchrunner prod'
alias .kustomize.em.app.for.env..your-batchrunner.all='rc;.kustomize.em.app.for.env..your-batchrunner.aat && .kustomize.em.app.for.env..your-batchrunner.demo && .kustomize.em.app.for.env..your-batchrunner.perftest && .kustomize.em.app.for.env..your-batchrunner.prod'

