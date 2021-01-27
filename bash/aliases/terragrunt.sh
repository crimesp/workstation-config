
alias .terragrunt.show='terragrunt show'

alias .terragrunt.init='terragrunt init'
alias .terragrunt.format='terraform fmt'
alias .terragrunt.plan='terragrunt plan -out tf.plan'
alias .terragrunt.apply='terragrunt apply tf.plan'

alias .terragrunt.force_unlock='terragrunt force-unlock'


function .terragrunt.debug_template() {
    if [ -z "$1" ]
    then
        echo "Supply a template name"
    return 1
    fi
    terragrunt refresh
    terragrunt state show data.template_file.$1
}
