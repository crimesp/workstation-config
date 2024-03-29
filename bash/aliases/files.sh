function .files.count () {

  ls -l | wc -l
}

alias .files.grep='grep -R'

alias .files.open='._open'

function ._open() {
  open "$@" >/dev/null 2>&1 &
}


alias .files.run='._run'

function ._run() {
  "$@" >/dev/null 2>&1 &
}


function .files.grep.and.exec() {
   if [ -z "$1" ]
    then
        echo "Supply a grep pattern"
    return 1
    fi
    .files.grep -l $1 | xargs $2

}


function .files.grep.and.cat() {
   if [ -z "$1" ]
    then
        echo "Supply a file pattern"
    return 1
    fi
    .files.grep -l $1 | cat
    #.files.grep.and.exec "$1" "cat $2"

}

function .files.grep.and.yq() {
   if [ -z "$1" ]
    then
        echo "Supply a file pattern"
    return 1
    fi
    .files.grep.and.exec "$1" "yq $2 $3 $4"

}




function .files.find() {
   if [ -z "$1" ]
    then
        echo "Supply a file pattern (* is wildcard)"
    return 1
    fi

    find . -name "$1"
}

function .files.find.and.exec() {
   if [ -z "$1" ]
    then
        echo "Supply a file pattern"
    return 1
    fi

    find . -name "$1" -exec $2 {} \;
}


function .files.find.and.delete() {
   if [ -z "$1" ]
    then
        echo "Supply a file pattern"
    return 1
    fi

    find . -name "$1" -exec rm -rf {} \;
}

function .files.find.and.cat() {
   if [ -z "$1" ]
    then
        echo "Supply a file pattern"
    return 1
    fi

    find . -name "$1" -exec cat {} \;
}


function .files.find.and.grep() {
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

function .files.find.and.yq() {
   if [ -z "$1" ]
    then
        echo "Supply a file pattern"
    return 1
    fi

    find . -name "$1" -exec echo  {} \; -exec yq $2 {} \;
}


function .files.find.and.grep.and.exec() {
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

    grep -R "$2" --include="$1" -l | xargs $3 $4 $5

}


function .files.find.and.grep.and.copy.to.comparison.dir() {
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

    rm -rf .comparison
    mkdir .comparison
    grep -R "$2" --include="$1" -l > .comparison/.filelist.txt

    while read file_name; do
      echo "PROCESSING $file_name"
      CLEANED="${file_name// /-}"
      CLEANED="${CLEANED//\//---}"
      echo "CLEANED FILENAME: $CLEANED"
      cp $file_name ".comparison/$CLEANED"
    done < .comparison/.filelist.txt

    rm .comparison/.filelist.txt

}

