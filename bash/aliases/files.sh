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

alias .files.dart.big.lib='.files.find.by.pattern.and.linecount lib "*.dart" 300 "*.gr.dart"'

function .files._print_if_lines_gt() {
  file="$1"
  min_lines="$2"
  lines=$(wc -l < "$file")
  if [ "$lines" -gt "$min_lines" ]; then
    echo "$lines $file"
  fi
}

function .files.find.by.pattern.and.linecount() {
  if [ -z "$1" ]; then
    echo "Supply a directory path"
    return 1
  fi
  if [ -z "$2" ]; then
    echo "Supply and include pattern"
    return 1
  fi
  if [ -z "$3" ]; then
    echo "Supply a minimum line count"
    return 1
  fi

    #4 exclude pattern (optional)

  export -f .files._print_if_lines_gt

  if [ -n "$4" ]; then
    find "$1" -name "$2" -not -name "$4" -exec bash -c '.files._print_if_lines_gt "$0" "$1"' {} "$3" \; | sort -nr
  else
    find "$1" -name "$2" -exec bash -c '.files._print_if_lines_gt "$0" "$1"' {} "$3" \; | sort -nr
  fi
}