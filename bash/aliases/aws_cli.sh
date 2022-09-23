########################################################
# aws functions
########################################################





function aws.asg.describe.instances.tags () {
    pattern=$1

    aws ec2 describe-instances --output ${3:-table} --region eu-west-2 \
    --query 'Reservations[*].Instances[*].[Tags]' \
    --filters "Name=tag:aws:autoscaling:groupName,Values=${NON_PROD_ENVIRONMENT_PREFIX}*${pattern}*"

}


function .aws.asg.describe.instances.ip () {
    pattern=$1

    aws ec2 describe-instances --output text --region eu-west-2 \
    --query 'Reservations[*].Instances[*].[PrivateIpAddress]' \
    --filters "Name=tag:aws:autoscaling:groupName,Values=${NON_PROD_ENVIRONMENT_PREFIX}*${pattern}*"
}

function .aws.asg.describe.instances.summary () {
    pattern=$1

    cmd="aws ec2 describe-instances --output ${3:-table} --region eu-west-2 \
    --query 'Reservations[*].Instances[*].[Tags[?Key==\`Name\`  ]|[0].Value,PrivateIpAddress,KeyName,InstanceType,State.Name,LaunchTime]' \
    --filters 'Name=tag:aws:autoscaling:groupName,Values=${NON_PROD_ENVIRONMENT_PREFIX}*${pattern}*'"

    echo ${cmd}
    eval $cmd
}



function .aws.asg.describe () {
    pattern=$1

    cmd="aws ec2 describe-instances --output ${3:-table} --region eu-west-2 \
    --query 'Reservations[*].Instances[*].[Tags[?Key==\`Name\`  ]|[0].Value,PrivateIpAddress,KeyName,InstanceType,State.Name,LaunchTime]' \
    --filters 'Name=tag:aws:autoscaling:groupName,Values=${NON_PROD_ENVIRONMENT_PREFIX}*${pattern}*'"

    echo ${cmd}
    eval $cmd
}

function .aws.sg.describe.summary () {
    pattern=$1
    aws ec2 describe-security-groups --output json --region eu-west-2 \
    --query "SecurityGroups[*].[GroupName,GroupId,IpPermissions,IpPermissionsEgress]" \
    --filters "Name=group-name,Values=${NON_PROD_ENVIRONMENT_PREFIX}*${pattern}*"
}



alias .aws.ec2.private.ip="aws ec2 describe-instances --output text --region eu-west-2 --query 'Reservations[*].Instances[*].[PrivateIpAddress]' --filters 'Name=tag:aws:autoscaling:groupName,Values=*$1*'"

