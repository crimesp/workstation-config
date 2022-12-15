#kubectl scale deployment your-batchrunner-java --replicas 0
#you need to login if your subscription access changes
alias .az.acr.login='az acr login --name clientpublic && az acr login --name clientprivate'


alias .az.credentials.aat.00='az aks get-credentials --resource-group aat-00-rg --name aat-00-aks --subscription APPS-STG --overwrite'
alias .az.credentials.aat.01='az aks get-credentials --resource-group aat-01-rg --name aat-01-aks --subscription APPS-STG --overwrite'

alias .az.credentials.ithc.00='az aks get-credentials --resource-group ithc-00-rg --name ithc-00-aks --subscription APPS-ITHC --overwrite'
alias .az.credentials.ithc.01='az aks get-credentials --resource-group ithc-01-rg --name ithc-01-aks --subscription APPS-ITHC --overwrite'


alias .az.credentials.ithc.00='az aks get-credentials --resource-group ithc-00-rg --name ithc-00-aks --subscription APPS-ITHC --overwrite'
alias .az.credentials.ithc.01='az aks get-credentials --resource-group ithc-01-rg --name ithc-01-aks --subscription APPS-ITHC --overwrite'





alias .az.credentials.demo.01='az aks get-credentials --resource-group demo-01-rg --name demo-01-aks --subscription APPS-DEMO --overwrite'


alias .az.credentials.perftest.00='az aks get-credentials --resource-group perftest-00-rg --name perftest-00-aks --subscription APPS-TEST --overwrite'
alias .az.credentials.perftest.01='az aks get-credentials --resource-group perftest-01-rg --name perftest-01-aks --subscription APPS-TEST --overwrite'


alias .az.credentials.preview.00='az aks get-credentials --resource-group preview-00-rg --name preview-00-aks --subscription APPS-DEV --overwrite'
alias .az.credentials.preview.01='az aks get-credentials --resource-group preview-01-rg --name preview-01-aks --subscription APPS-DEV --overwrite'

alias .az.credentials.prod.00='az aks get-credentials --resource-group prod-00-rg --name prod-00-aks --subscription APPS-PROD --overwrite'
alias .az.credentials.prod.01='az aks get-credentials --resource-group prod-01-rg --name prod-01-aks --subscription APPS-PROD --overwrite'


alias .az.credentials.intsrv-00='az aks get-credentials --resource-group ptl-intsvc-00-rg --name ptl-intsvc-00-aks --subscription DTSPTL-INTSVC'

alias .az.login.acr='.az.acr.login'
alias .az.login='az login'

