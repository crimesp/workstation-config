#shopy allows bash to call aliases as functions (perhaps this cant be called from profile?)
shopt -s expand_aliases

#import (source) aliases
for f in $BASH_INCLUDES/aliases/*.sh; do
   source "$f" -H
done


##import (source) cli-etc
#for f in $BASH_INCLUDES/cli-etc/*.sh; do
#   source "$f" -H
#done

##print aliases
#echo "********************************"
#echo "Aliases Available (Top Level:"
#.alias.contexts.list
#echo "********************************"


