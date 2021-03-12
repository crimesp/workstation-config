function .files.count () {

  ls -l | wc -l
}


function .files.find() {
   if [ -z "$1" ]
    then
        echo "Supply a file pattern"
    return 1
    fi

    find . -name "$1" 
}

function .files.find_and_delete() {
   if [ -z "$1" ]
    then
        echo "Supply a file pattern"
    return 1
    fi

    find . -name "$1" -exec rm -rf {} \;
}

function .files.find_and_cat() {
   if [ -z "$1" ]
    then
        echo "Supply a file pattern"
    return 1
    fi

    find . -name "$1" -exec cat {} \;
}


function .files.find_and_grep() {
   if [ -z "$1" ]
    then
        echo "Supply a file pattern"
    return 1
    fi

   if [ -z "$2" ]
    then
        echo "Supply grep pattern/arguments"
    return 1
    fi

    grep -R $2 --include=$1

}
