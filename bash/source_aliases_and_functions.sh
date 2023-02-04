#shopy allows bash to call aliases as functions
#shopt -s expand_aliases

#import (source) aliases
for f in $BASH_INCLUDES/aliases/*.sh; do
   source "$f" -H
done


##import (source) cli-etc
#for f in $BASH_INCLUDES/cli-etc/*.sh; do
#   source "$f" -H
#done

#print aliases
.aliases.contexts.list


