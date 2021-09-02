# note: some users have experienced caching issues with their AAD token:
# psql: error: FATAL:  Azure AD access token not valid for role DTS JIT Access send-letter DB Reader SC (does not contain group ID c9e865ee-bc88-40d9-a5c1-23831f0ce255)
# the fix is to clear the cache and login again: rm -rf ~/.azure && az login



################################################################
#HRS
################################################################

#aat

function .postgres.tunnel.create.hrs.aat() {
# you can get this from the portal, or determine it via the inputs your pass to this module in your code

POSTGRES_DB_SUBDOMAIN=em-hrs-api-postgres-v11-db
POSTRGRES_DB_ENV=aat

POSTGRES_HOST="${POSTGRES_DB_SUBDOMAIN}-${POSTRGRES_DB_ENV}.postgres.database.azure.com"
echo "TUNNELLING TO ${POSTGRES_HOST} - PLEASE LEAVE THIS TERMINAL OPEN, and open a new terminal to connect using .postgres.connect.hrs.aat"
ssh -N bastion-prod.platform.hmcts.net -L 5440:${POSTGRES_HOST}:5432
# expect no more output in this terminal you won't get an interactive prompt
}


function .postgres.connect.hrs.aat() {

# in a separate terminal run:
export PGPASSWORD=$(az account get-access-token --resource-type oss-rdbms --query accessToken -o tsv)

DB_NAME=emhrs

POSTGRES_DB_SUBDOMAIN=em-hrs-api-postgres-v11-db
POSTRGRES_DB_ENV=aat


DB_USER="DTS\ CFT\ DB\ Access\ Reader@${POSTGRES_DB_SUBDOMAIN}-${POSTRGRES_DB_ENV}" # read access
#DB_USER="DTS\ Platform\ Operations@${POSTGRES_DB_SUBDOMAIN}-${POSTRGRES_DB_ENV}" # operations team administrative access

psql "sslmode=require host=localhost port=5440 dbname=${DB_NAME} user=${DB_USER}"
}




#prod

function .postgres.tunnel.create.hrs.prod() {
# you can get this from the portal, or determine it via the inputs your pass to this module in your code

POSTGRES_DB_SUBDOMAIN=em-hrs-api-postgres-v11-db
POSTRGRES_DB_ENV=prod

POSTGRES_HOST="${POSTGRES_DB_SUBDOMAIN}-${POSTRGRES_DB_ENV}.postgres.database.azure.com"
echo "TUNNELLING TO ${POSTGRES_HOST} - PLEASE LEAVE THIS TERMINAL OPEN, and open a new terminal to connect using .postgres.connect.hrs.prod"
ssh -N bastion-prod.platform.hmcts.net -L 5440:${POSTGRES_HOST}:5432
# expect no more output in this terminal you won't get an interactive prompt
}



function .postgres.connect.hrs.prod() {

export PGPASSWORD=$(az account get-access-token --resource-type oss-rdbms --query accessToken -o tsv)
DB_NAME=emhrs
PRODUCT_NAME=hrs-api
POSTGRES_DB_SUBDOMAIN=em-hrs-api-postgres-v11-db
POSTRGRES_DB_ENV=prod

DB_USER="DTS\ JIT\ Access\ ${PRODUCT_NAME}\ DB\ Reader\ SC@${POSTGRES_DB_SUBDOMAIN}-${POSTRGRES_DB_ENV}" # read access
#DB_USER="DTS\ Platform\ Operations\ SC@${POSTGRES_DB_SUBDOMAIN}-${POSTRGRES_DB_ENV}" # operations team administrative access

psql "sslmode=require host=localhost port=5440 dbname=${DB_NAME} user=${DB_USER}"
}















################################################################
#STITCHING
################################################################

#aat
function .postgres.tunnel.create.stitching.aat() {
# you can get this from the portal, or determine it via the inputs your pass to this module in your code

POSTGRES_DB_SUBDOMAIN=em-stitching-postgres-db
POSTRGRES_DB_ENV=aat

POSTGRES_HOST="${POSTGRES_DB_SUBDOMAIN}-${POSTRGRES_DB_ENV}.postgres.database.azure.com"
echo "TUNNELLING TO ${POSTGRES_HOST} - PLEASE LEAVE THIS TERMINAL OPEN, and open a new terminal to connect using .postgres.connect.stitching.aat"
ssh -N bastion-prod.platform.hmcts.net -L 5440:${POSTGRES_HOST}:5432
# expect no more output in this terminal you won't get an interactive prompt
}

#you will need postgres client
#psql "sslmode=require host=localhost port=5440 dbname=${DB_NAME} user=${DB_USER}"
function .postgres.connect.stitching.aat() {

# in a separate terminal run:
export PGPASSWORD=$(az account get-access-token --resource-type oss-rdbms --query accessToken -o tsv)
# this matches the `database_name` parameter you pass in the module
DB_NAME=emstitch

POSTGRES_DB_SUBDOMAIN=em-stitching-postgres-db
POSTRGRES_DB_ENV=aat


# Update the suffix after the @ to the server name
DB_USER="DTS\ CFT\ DB\ Access\ Reader@${POSTGRES_DB_SUBDOMAIN}-${POSTRGRES_DB_ENV}" # read access
#DB_USER="DTS\ Platform\ Operations@rpe-draft-store-aat" # operations team administrative access

psql "sslmode=require host=localhost port=5440 dbname=${DB_NAME} user=${DB_USER}"
}




#prod
function .postgres.tunnel.create.stitching.prod() {

POSTGRES_DB_SUBDOMAIN=em-stitching-postgres-db
POSTRGRES_DB_ENV=prod

POSTGRES_HOST="${POSTGRES_DB_SUBDOMAIN}-${POSTRGRES_DB_ENV}.postgres.database.azure.com"
echo "TUNNELLING TO ${POSTGRES_HOST} - PLEASE LEAVE THIS TERMINAL OPEN, and open a new terminal to connect using .postgres.connect.stitching.prod"
ssh -N bastion-prod.platform.hmcts.net -L 5440:${POSTGRES_HOST}:5432
# expect no more output in this terminal you won't get an interactive prompt
}

function .postgres.connect.stitching.prod() {

# in a separate terminal run:
export PGPASSWORD=$(az account get-access-token --resource-type oss-rdbms --query accessToken -o tsv)
DB_NAME=emstitch

POSTGRES_DB_SUBDOMAIN=em-stitching-postgres-db
POSTRGRES_DB_ENV=prod


DB_USER="DTS\ JIT\ Access\ ${DB_NAME}\ DB\ Reader\ SC@${POSTGRES_DB_SUBDOMAIN}-${POSTRGRES_DB_ENV}" # read access
#DB_USER="DTS\ Platform\ Operations\ SC@${POSTGRES_DB_SUBDOMAIN}-${POSTRGRES_DB_ENV}" # operations team administrative access

psql "sslmode=require host=localhost port=5440 dbname=${DB_NAME} user=${DB_USER}"
}


