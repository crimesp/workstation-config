alias .alias.source='source ~/.bash_aliases'
alias .alias.contexts.list='echo "Alias Contexts:";alias | egrep -o "^alias \.([a-z]*)\." | sort -u | egrep -o "\.([a-z]*)\."'
alias .alias.edit.new='vi $BASH_INCLUDES/aliases/_new_aliases.sh; .alias.source'
alias .alias.add='_alias.add'

function _alias.add () {

   if [ $# -ne 2 ]
    then
        echo "Supply an alias name and the command"
    return 1
    fi

alias=$1
command=$2

echo "alias $alias='$command'" >> $BASH_INCLUDES/aliases/_new_aliases.sh

.alias.source
}