# note: some users have experienced caching issues with their AAD token:
# psql: error: FATAL:  Azure AD access token not valid for role DTS JIT Access send-letter DB Reader SC (does not contain group ID c9e865ee-bc88-40d9-a5c1-23831f0ce255)
# the fix is to clear the cache and login again: rm -rf $USER_HOME/.azure && az login


.postgres.azlogin() {
  rm -rf $USER_HOME/.azure
  az login
  az ssh config --ip \*.platform.client.dotcom --file $USER_HOME/.ssh/config
}

################################################################
#your-apps
################################################################

#aat

function .postgres.tunnel.create.your-apps.aat() {
  # you can get this from the portal, or determine it via the inputs your pass to this module in your code

  POSTGRES_DB_SUBDOMAIN=your-api-postgres-v11-db
  POSTRGRES_DB_ENV=aat

  POSTGRES_HOST="${POSTGRES_DB_SUBDOMAIN}-${POSTRGRES_DB_ENV}.postgres.database.azure.com"
  echo "TUNNELLING TO ${POSTGRES_HOST} - PLEASE LEAVE THIS TERMINAL OPEN, and open a new terminal to connect using .postgres.connect.your-apps.aat"
  ssh -N bastion-nonprod.platform.client.dotcom -L 5440:${POSTGRES_HOST}:5432
  # expect no more output in this terminal you won't get an interactive prompt
}


function .postgres.connect.your-apps.aat() {

  # in a separate terminal run:
  export PGPASSWORD=$(az account get-access-token --resource-type oss-rdbms --query accessToken -o tsv)

  DB_NAME=emyour-apps

  POSTGRES_DB_SUBDOMAIN=your-api-postgres-v11-db
  POSTRGRES_DB_ENV=aat


  DB_USER="DTS\ \ DB\ Access\ Reader@${POSTGRES_DB_SUBDOMAIN}-${POSTRGRES_DB_ENV}" # read access
  #DB_USER="DTS\ Platform\ Operations@${POSTGRES_DB_SUBDOMAIN}-${POSTRGRES_DB_ENV}" # operations team administrative access

  psql "sslmode=require host=localhost port=5440 dbname=${DB_NAME} user=${DB_USER}"
}


function .postgres.tunnel.create.your-apps.demo() {
  # you can get this from the portal, or determine it via the inputs your pass to this module in your code

  POSTGRES_DB_SUBDOMAIN=your-api-postgres-v11-db
  POSTRGRES_DB_ENV=demo

  POSTGRES_HOST="${POSTGRES_DB_SUBDOMAIN}-${POSTRGRES_DB_ENV}.postgres.database.azure.com"
  echo "TUNNELLING TO ${POSTGRES_HOST} - PLEASE LEAVE THIS TERMINAL OPEN, and open a new terminal to connect using .postgres.connect.your-apps.demo"
  ssh -N bastion-nonprod.platform.client.dotcom -L 5440:${POSTGRES_HOST}:5432
  # expect no more output in this terminal you won't get an interactive prompt
}


function .postgres.connect.your-apps.demo() {

  # in a separate terminal run:
  export PGPASSWORD=$(az account get-access-token --resource-type oss-rdbms --query accessToken -o tsv)

  DB_NAME=emyour-apps

  POSTGRES_DB_SUBDOMAIN=your-api-postgres-v11-db
  POSTRGRES_DB_ENV=demo


  DB_USER="DTS\ \ DB\ Access\ Reader@${POSTGRES_DB_SUBDOMAIN}-${POSTRGRES_DB_ENV}" # read access
  #DB_USER="DTS\ Platform\ Operations@${POSTGRES_DB_SUBDOMAIN}-${POSTRGRES_DB_ENV}" # operations team administrative access

  psql "sslmode=require host=localhost port=5440 dbname=${DB_NAME} user=${DB_USER}"
}


function .postgres.connect.your-apps.demo.sysaccount() {


export DB_USER=$(az keyvault secret show --id https://your-api-demo.vault.azure.net/secrets/api-POSTGRES-USER | yq  eval '.value' -)
export PGPASSWORD=$(az keyvault secret show --id https://your-api-demo.vault.azure.net/secrets/api-POSTGRES-PASS | yq  eval '.value' -)


  DB_NAME=emyour-apps

  POSTGRES_DB_SUBDOMAIN=your-api-postgres-v11-db
  POSTRGRES_DB_ENV=demo

  psql "sslmode=require host=localhost port=5440 dbname=${DB_NAME} user=${DB_USER}"
}




#prod

function .postgres.tunnel.create.your-apps.prod() {
  # you can get this from the portal, or determine it via the inputs your pass to this module in your code

  POSTGRES_DB_SUBDOMAIN=your-api-postgres-v11-db
  POSTRGRES_DB_ENV=prod

  POSTGRES_HOST="${POSTGRES_DB_SUBDOMAIN}-${POSTRGRES_DB_ENV}.postgres.database.azure.com"
  echo "TUNNELLING TO ${POSTGRES_HOST} - PLEASE LEAVE THIS TERMINAL OPEN, and open a new terminal to connect using .postgres.connect.your-apps.prod"
  ssh -N bastion-prod.platform.client.dotcom -L 5440:${POSTGRES_HOST}:5432
  # expect no more output in this terminal you won't get an interactive prompt
}



function .postgres.connect.your-apps.prod() {

  export PGPASSWORD=$(az account get-access-token --resource-type oss-rdbms --query accessToken -o tsv)
  DB_NAME=emyour-apps
  #productname=  app_full_name = "${var.product}-${var.component}" = your-api
  #PRODUCT_NAME=your-api
  PRODUCT_NAME=em
  POSTGRES_DB_SUBDOMAIN=your-api-postgres-v11-db
  POSTRGRES_DB_ENV=prod

  DB_USER="DTS\ JIT\ Access\ ${PRODUCT_NAME}\ DB\ Reader\ SC@${POSTGRES_DB_SUBDOMAIN}-${POSTRGRES_DB_ENV}" # read access
  #DB_USER="DTS\ Platform\ Operations\ SC@${POSTGRES_DB_SUBDOMAIN}-${POSTRGRES_DB_ENV}" # operations team administrative access

  psql "sslmode=require host=localhost port=5440 dbname=${DB_NAME} user=${DB_USER}"
}








