#kubectl scale deployment em-hrs-ingestor-java --replicas 0
#you need to login if your subscription access changes
alias .az.acr.login='az acr login --name hmctspublic && az acr login --name hmctsprivate'

alias .az.credentials.aat.00='az aks get-credentials --resource-group cft-aat-00-rg --name cft-aat-00-aks --subscription DCD-CFTAPPS-STG --overwrite'
alias .az.credentials.aat.01='az aks get-credentials --resource-group cft-aat-01-rg --name cft-aat-01-aks --subscription DCD-CFTAPPS-STG --overwrite'

alias .az.credentials.demo.01='az aks get-credentials --resource-group demo-01-rg --name demo-01-aks --subscription DCD-CFTAPPS-DEMO --overwrite'	


alias .az.credentials.perftest.00='az aks get-credentials --resource-group cft-perftest-00-rg --name cft-perftest-00-aks --subscription DCD-CFTAPPS-TEST --overwrite'
alias .az.credentials.perftest.01='az aks get-credentials --resource-group cft-perftest-01-rg --name cft-perftest-01-aks --subscription DCD-CFTAPPS-TEST --overwrite'
alias .az.credentials.preview.00='az aks get-credentials --resource-group preview-00-rg --name preview-00-aks --subscription DCD-CFTAPPS-DEV --overwrite'
alias .az.credentials.preview='az aks get-credentials --resource-group preview-01-rg --name preview-01-aks --subscription DCD-CFTAPPS-DEV --overwrite'

alias .az.credentials.prod.00='az aks get-credentials --resource-group prod-00-rg --name prod-00-aks --subscription DCD-CFTAPPS-PROD --overwrite'
alias .az.credentials.prod.01='az aks get-credentials --resource-group prod-01-rg --name prod-01-aks --subscription DCD-CFTAPPS-PROD --overwrite'


alias .az.login.acr='.az.acr.login'
alias .az.login='az login'

