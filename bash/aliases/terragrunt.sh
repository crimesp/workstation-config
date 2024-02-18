alias .terraform.bash='docker run -ti --rm -e TERM=xterm-256color -e BASH_INCLUDES=$BASH_INCLUDES -v $BASH_INCLUDES:$BASH_INCLUDES   -v $HOME/.aws:/root/.aws -v ${HOME}/.ssh:/root/.ssh -v `pwd`:/apps alpine/terragrunt:latest bash -c "cat $BASH_INCLUDES/source_aliases_and_functions.sh >> $USER_HOME/.bashrc; bash"'

function ..terragrunt() {
  #runs apline image with terragrunt, terraform - and ssh and aws dirs mapped
  echo "$*" > .command
  docker run -ti --rm -e TERM=xterm-256color -e BASH_INCLUDES=$BASH_INCLUDES -v $BASH_INCLUDES:$BASH_INCLUDES -v $HOME/.aws:/root/.aws -v ${HOME}/.ssh:/root/.ssh -v $(pwd):/apps alpine/terragrunt:latest bash -c 'cat $BASH_INCLUDES/source_aliases_and_functions.sh >> $USER_HOME/.bashrc; echo runnning .command;cat .command; sh .command'
  rm .command
}

alias .terragrunt.apply='..terragrunt terragrunt apply tf.plan'
alias .terragrunt.force.unlock='..terragrunt terragrunt force-unlock'
alias .terragrunt.format='..terragrunt terraform fmt'
alias .terragrunt.init='..terragrunt terragrunt init'
alias .terragrunt.plan='..terragrunt terragrunt plan -out tf.plan'
alias .terragrunt.show='..terragrunt terragrunt show'

alias .terraform.apply='..terragrunt terraform apply tf.plan'
alias .terraform.force.unlock='..terragrunt terraform force-unlock'
alias .terraform.format='..terragrunt terraform fmt'
alias .terraform.init='..terragrunt terraform init'
alias .terraform.plan='..terragrunt terraform plan -out tf.plan'
alias .terraform.show='..terragrunt terraform show'





function .terragrunt.debug.template() {
  if [ -z "$1" ]; then
    echo "Supply a template name"
    return 1
  fi
  terragrunt refresh
  terragrunt state show data.template_file.$1
}

