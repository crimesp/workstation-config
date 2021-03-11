#you need to login if your subscription access changes
alias .az.login='az login'

alias .az.credentials.preview='az aks get-credentials --resource-group preview-01-rg --name preview-01-aks --subscription DCD-CFTAPPS-DEV --overwrite'

alias .az.credentials.aat.00='az aks get-credentials --resource-group aat-00-rg --name aat-00-aks --subscription DCD-CFTAPPS-STG --overwrite'
alias .az.credentials.aat.01='az aks get-credentials --resource-group aat-01-rg --name aat-01-aks --subscription DCD-CFTAPPS-STG --overwrite'


alias .kubernetes.pods.list='kubectl get pods -n em'

alias .kubernetes.desribe='kubectl describe pod -n em'

alias .kubernetes.log='kubectl logs -n em '

alias .kubernetes.traefic.admin='kubectl get service traefik -n admin -o json'

alias .kubernetes.context.k3d='kubectl config use-context k3d-k3s-default'

alias .kubernets.context.show='kubectl config get-contexts'

alias .kubernetes.context.k3d='kubectl config use-context k3d-k3s-default'
alias .kubernetes.context.k3d='kubectl config use-context preview-01-aks'
alias .kubernetes.context.k3d='kubectl config use-context aat-00-aks'
alias .kubernetes.context.k3d='kubectl config use-context aat-01-aks'

