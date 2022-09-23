alias .aliases.source='source $BASH_INCLUDES/source.aliases.and.functions.sh'
alias .aliases.contexts.list='echo "Alias Contexts:";alias | egrep -o "^alias \.([a-z]*)\." | sort -u | egrep -o "\.([a-z]*)\."'
alias .aliases.add.new='vi $BASH_INCLUDES/aliases/_new_aliases.sh; .aliases.source'
