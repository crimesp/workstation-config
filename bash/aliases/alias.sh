alias .alias.source='source ~/.bash_aliases'
alias .alias.contexts.list='echo "Alias Contexts:";alias | egrep -o "^alias \.([a-z]*)\." | sort -u | egrep -o "\.([a-z]*)\."'
alias .alias.add.new='vi $BASH_INCLUDES/aliases/_new_aliases.sh; .aliases.source'
