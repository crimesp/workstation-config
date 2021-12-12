#shopy allows bash to call aliases as functions
#shopt -s expand_aliases

#import (source) aliases
for f in $BASH_INCLUDES/aliases/*.sh; do
   source "$f" -H
done

#print aliases
.aliases.contexts.list
