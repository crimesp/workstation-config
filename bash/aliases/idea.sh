alias .idea.19='/home/paul/apps/idea-IC-203.5981.155/bin/idea.sh . > /dev/null 2>&1&'
alias .idea.20='nohup idea . > /dev/null 2>&1&'

alias .idea='.idea.20'


function .idea.subdirs () {
    for d in ./*/ ;
    do (
        cd "$d" ;
        .idea
     ); done


}
