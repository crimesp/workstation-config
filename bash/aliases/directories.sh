
#exec something in each subdirectory
function .subdirs.exec () {
   for d in ./*/ ;
   do (
       cd "$d" ;
       exec $@
    ); done


}
