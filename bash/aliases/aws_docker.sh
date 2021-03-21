function ..aws() {
  #runs apline image with terragrunt, terraform - and ssh and aws dirs mapped
  echo aws "$*" > .command
  docker run --entrypoint="/usr/bin/bash" -ti --rm -e TERM=xterm-256color \
  -e BASH_INCLUDES=$BASH_INCLUDES -v $BASH_INCLUDES:$BASH_INCLUDES -v $HOME/.aws:/root/.aws -v ${HOME}/.ssh:/root/.ssh -v $(pwd):/apps \
  -e AWS_PROFILE=$AWS_PROFILE \
  -e AWS_SESSION_NAME=$AWS_SESSION_NAME \
  amazon/aws-cli \
  -c 'cat $BASH_INCLUDES/source_aliases_and_functions.sh >> ~/.bashrc; cd /apps/;echo runnning .command;cat .command; sh .command'
  rm .command
}

function ..aws.run() {
  #runs apline image with terragrunt, terraform - and ssh and aws dirs mapped
  echo "$*" > .command
  docker run --entrypoint="/usr/bin/bash" -ti --rm -e TERM=xterm-256color \
  -e BASH_INCLUDES=$BASH_INCLUDES -v $BASH_INCLUDES:$BASH_INCLUDES -v $HOME/.aws:/root/.aws -v ${HOME}/.ssh:/root/.ssh -v $(pwd):/apps \
  -e AWS_PROFILE=$AWS_PROFILE \
  -e AWS_SESSION_NAME=$AWS_SESSION_NAME \
  amazon/aws-cli \
  -c 'cat $BASH_INCLUDES/source_aliases_and_functions.sh >> ~/.bashrc; cd /apps/;echo runnning .command;cat .command; sh .command'
  rm .command
}


function ..aws.bash() {
  #runs apline image with terragrunt, terraform - and ssh and aws dirs mapped
  echo "$*" > .command
  docker run --entrypoint="/usr/bin/bash" -ti --rm -e TERM=xterm-256color \
  -e BASH_INCLUDES=$BASH_INCLUDES -v $BASH_INCLUDES:$BASH_INCLUDES -v $HOME/.aws:/root/.aws -v ${HOME}/.ssh:/root/.ssh -v $(pwd):/apps \
  amazon/aws-cli
  rm .command
}






function ..eksctl() {
  #runs apline image with terragrunt, terraform - and ssh and aws dirs mapped
  docker run --entrypoint="/usr/bin/bash" -ti --rm -e TERM=xterm-256color \
  -e BASH_INCLUDES=$BASH_INCLUDES -v $BASH_INCLUDES:$BASH_INCLUDES -v $HOME/.aws:/root/.aws -v ${HOME}/.ssh:/root/.ssh -v $(pwd):/apps \
  -e AWS_PROFILE=$AWS_PROFILE \
  -e AWS_SESSION_NAME=$AWS_SESSION_NAME \
  weaveworks/eksctl \
  -c 'cat $BASH_INCLUDES/source_aliases_and_functions.sh >> ~/.bashrc; cd /apps/;echo runnning .command;cat .command; sh .command'
  rm .command
}

function ..eksctl.run() {
  #runs apline image with terragrunt, terraform - and ssh and aws dirs mapped
  echo "$*" > .command
  docker run --entrypoint="/usr/bin/bash" -ti --rm -e TERM=xterm-256color \
  -e BASH_INCLUDES=$BASH_INCLUDES -v $BASH_INCLUDES:$BASH_INCLUDES -v $HOME/.aws:/root/.aws -v ${HOME}/.ssh:/root/.ssh -v $(pwd):/apps \
  -e AWS_PROFILE=$AWS_PROFILE \
  -e AWS_SESSION_NAME=$AWS_SESSION_NAME \
  weaveworks/eksctl \
  -c 'cat $BASH_INCLUDES/source_aliases_and_functions.sh >> ~/.bashrc; cd /apps/;echo runnning .command;cat .command; sh .command'
  rm .command
}


function ..eksctl.bash() {
  #runs apline image with terragrunt, terraform - and ssh and aws dirs mapped
  echo "$*" > .command
  docker run --entrypoint="/usr/bash" -ti --rm -e TERM=xterm-256color \
  -e BASH_INCLUDES=$BASH_INCLUDES -v $BASH_INCLUDES:$BASH_INCLUDES -v $HOME/.aws:/root/.aws -v ${HOME}/.ssh:/root/.ssh -v $(pwd):/apps \
  weaveworks/eksctl
rm .command
}
