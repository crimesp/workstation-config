#placeholder for new aliases, to be organised later

alias .net.dns.dig='dig '

alias .kubernetes.context.aat.00='kubectl config use-context aat-00-aks'
alias .kubernetes.context.aat.01='kubectl config use-context aat-01-aks'

alias .kubernetes.context.perftest.00='kubectl config use-context perftest-00-aks'
alias .kubernetes.context.perftest.01='kubectl config use-context perftest-01-aks'


alias .kubernetes.context.preview.00='kubectl config use-context preview-00-aks'
alias .kubernetes.context.preview.01='kubectl config use-context preview-01-aks'

alias .kubernetes.events.get.by.time='kubectl get events --sort-by lastTimestamp'
alias .kubernetes.events.get.by.name='kubectl get events --sort-by involvedObject.name'


alias .az.credentials.preview.00='az aks get-credentials --resource-group preview-00-rg --name preview-00-aks --subscription DCD-CFTAPPS-DEV --overwrite'


alias .az.credentials.perf.00='az aks get-credentials --resource-group perftest-00-rg --name perftest-00-aks --subscription DCD-CFTAPPS-TEST --overwrite'
alias .az.credentials.perf.01='az aks get-credentials --resource-group perftest-01-rg --name perftest-01-aks --subscription DCD-CFTAPPS-TEST --overwrite'


alias .kubernetes.namespace.em='kubectl config set-context --current --namespace=em'
alias .kubernetes.delete='kubectl delete pods'
