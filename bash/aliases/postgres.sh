function .postgres.tunnel.create.aat() {
# you can get this from the portal, or determine it via the inputs your pass to this module in your code

POSTGRES_DB_SUBDOMAIN=em-hrs-api-postgres-v11-db
POSTRGRES_DB_ENV=aat

POSTGRES_HOST="${POSTGRES_DB_SUBDOMAIN}-${POSTRGRES_DB_ENV}.postgres.database.azure.com"
echo "TUNNELLING TO ${POSTGRES_HOST} - open a new terminal to connect"
ssh -N bastion-nonprod.platform.hmcts.net -L 5440:${POSTGRES_HOST}:5432
# expect no more output in this terminal you won't get an interactive prompt
}

function .postgres.connect.aat() {

# in a separate terminal run:
export PGPASSWORD=$(az account get-access-token --resource-type oss-rdbms --query accessToken -o tsv)
# this matches the `database_name` parameter you pass in the module
DB_NAME=emhrs

POSTGRES_DB_SUBDOMAIN=em-hrs-api-postgres-v11-db
POSTRGRES_DB_ENV=aat


# Update the suffix after the @ to the server name
DB_USER="DTS\ CFT\ DB\ Access\ Reader@${POSTGRES_DB_SUBDOMAIN}-${POSTRGRES_DB_ENV}" # read access
#DB_USER="DTS\ Platform\ Operations@rpe-draft-store-aat" # operations team administrative access

psql "sslmode=require host=localhost port=5440 dbname=${DB_NAME} user=${DB_USER}"
}
