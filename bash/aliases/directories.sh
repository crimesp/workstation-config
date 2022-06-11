
#exec something in each subdirectory
function .subdirs.exec () {
   for d in ./*/ ;
   do (
       cd "$d" ;
       echo "About to excute in directory $d"
       exec $@
       echo "Completed excution in directory $d"
    ); done


}

function .subdirs.exec.bg () {
   for d in ./*/ ;
   do (
       cd "$d" ;
       echo "About to excute in directory $d"
       exec $@ &
       echo "Completed excution in directory $d"
    ); done


}
