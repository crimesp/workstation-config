alias .idea='nohup idea . > /dev/null 2>&1&'


function .idea.subdirs () {
    for d in ./*/ ;
    do (
        cd "$d" ;
        .idea
     ); done


}
