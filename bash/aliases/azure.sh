#you need to login if your subscription access changes
alias .az.login='az login'

alias .az.acr.login='az acr login --name hmctspublic && az acr login --name hmctsprivate'
alias .az.login.acr='.az.acr.login'

alias .az.credentials.preview='az aks get-credentials --resource-group preview-01-rg --name preview-01-aks --subscription DCD-CFTAPPS-DEV --overwrite'

alias .az.credentials.aat.00='az aks get-credentials --resource-group aat-00-rg --name aat-00-aks --subscription DCD-CFTAPPS-STG --overwrite'
alias .az.credentials.aat.01='az aks get-credentials --resource-group aat-01-rg --name aat-01-aks --subscription DCD-CFTAPPS-STG --overwrite'


alias .kubernetes.deployments.get='kubectl get deployments'
alias .kubernetes.deployment.describe='kubectl describe deployment'
alias .kubernetes.namespace.set='kubectl config set-context --current --namespace='
alias .kubernetes.cluster-info='kubectl cluster-info'

#kubectl scale deployment em-hrs-ingestor-java --replicas 0


alias .kubernetes.pods.list='kubectl get pods -n em'
alias .kubernetes.list='kubectl get pods'

alias .kubernetes.desribe='kubectl describe pod -n em'

alias .kubernetes.log='kubectl logs -n em '

alias .kubernetes.traefic.admin='kubectl get service traefik -n admin -o json'

alias .kubernetes.context.k3d='kubectl config use-context k3d-k3s-default'

alias .kubernetes.context.show='kubectl config get-contexts'

alias .kubernetes.context.k3d='kubectl config use-context k3d-k3s-default'
alias .kubernetes.context.k3d='kubectl config use-context preview-01-aks'
alias .kubernetes.context.k3d='kubectl config use-context aat-00-aks'
alias .kubernetes.context.k3d='kubectl config use-context aat-01-aks'

