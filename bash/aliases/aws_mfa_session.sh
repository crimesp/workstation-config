#!/bin/bash


.aws.mfa.login.scalable() {
if [ -z "$1" ]
  then
    echo "No argument supplied, please provide MFA code"
    return
fi
.aws.mfa.login scalable "$*"
}


.aws.mfa.login() {


# TAKES ARGUMENT OF profile name and MFA TOKEN
# usage: .aws.mfa.login %profile% %token%



# REQUIREMENTS

# Requires aws cli and jq for processing json

# TO INSTALL AWS CLI: one of these...
#  ubuntu:    apt-get install awscli, jq
#
# OR    pip install awscli --upgrade --user
#

# backup your ~/.aws folder (if you have one)
# then copy contents of aws_template_files to ~/.aws
#


PROFILE=$1

MFA_CODE=$2

CREDS_FILE="${HOME}/.aws/${PROFILE}_environment_vars"

echo "PROFILE=$PROFILE"
echo "CREDS_FILE=$CREDS_FILE"

if [ -z "$2" ]
  then
    echo "No argument supplied, please provide profile and MFA code"
    return
fi

if [ ! -f ${CREDS_FILE} ]; then
    echo "Creds File not found! Searching for $CREDS_FILE"
    return
else
    . ${CREDS_FILE}
fi

SESSION=$(aws sts get-session-token --serial-number ${AWS_ARN} --token-code ${MFA_CODE} --profile $PROFILE)

AWS_ACCESS_KEY=$(echo $SESSION | jq -r '.[]| .AccessKeyId')

AWS_SECRET_KEY=$(echo $SESSION | jq -r '.[]| .SecretAccessKey')

AWS_SESSION_TOKEN=$(echo $SESSION | jq -r '.[]| .SessionToken')




aws configure set --profile ${AWS_PROFILE} aws_access_key_id ${AccessKeyId}
aws configure set --profile ${AWS_PROFILE} aws_secret_access_key ${SecretAccessKey}
aws configure set --profile ${AWS_PROFILE} region ${AWS_REGION}
aws configure set --profile ${AWS_PROFILE} output ${AWS_OUTPUT}

aws configure set aws_access_key_id ${AWS_ACCESS_KEY} --profile "${AWS_PROFILE}-token"
aws configure set aws_secret_access_key ${AWS_SECRET_KEY} --profile "${AWS_PROFILE}-token"
aws configure set aws_session_token ${AWS_SESSION_TOKEN} --profile "${AWS_PROFILE}-token"

aws configure set --profile ${AWS_PROFILE}-token region ${AWS_REGION}
aws configure set --profile ${AWS_PROFILE}-token output json
#
#
export AWS_PROFILE="${AWS_PROFILE}-token"
export AWS_SESSION_NAME="${AWS_SESSION_NAME}"
echo "validating session"
echo "PROFILE IS $AWS_PROFILE"
echo "SESSION NAME is $AWS_SESSION_NAME"
aws sts get-caller-identity
#should produce
#{
#    "UserId": "AIDAIESRBHIBJOFXS5B2M",
#    "Account": "570551521311",
#    "Arn": "arn:aws:iam::570551521311:user/PaulCrimes"
#}

}
