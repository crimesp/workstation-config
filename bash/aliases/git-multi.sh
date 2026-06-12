

#git operations for all git projects in subdirectories
alias .git.subdirs.status='for d in ./*/ ; do (cd "$d" && echo '';pwd;git status); done'
alias .git.subdirs.branch='for d in ./*/ ; do (cd "$d" && echo '';pwd;git branch); done'
alias .git.subdirs.branchall='for d in ./*/ ; do (cd "$d" && echo '';pwd;git branch -a); done'
alias .git.subdirs.pull='for d in ./*/ ; do (cd "$d" && echo '';pwd;git pull); done'
alias .git.subdirs.fetch='for d in ./*/ ; do (cd "$d" && echo '';pwd;git fetch); done'
alias .git.subdirs.main.checkoutandpull='for d in ./*/ ; do (cd "$d" && echo '';pwd;git checkout main; git pull); done'
alias .git.subdirs.master.checkoutandpull='for d in ./*/ ; do (cd "$d" && echo '';pwd;git checkout master; git pull); done'
alias .git.report.generate="rc;.git.foreachbranch.pull.and.show.status > .git_report.log; cat .git_report.log"
alias .git.report.grep.but="grep 'but' .git_report.log | uniq"
alias .git.report.grep.no.origins="grep 'but the upstream is gone' .git_report.log | uniq"
alias .git.execute.branch.delete='.git.report.grep.no.origins | .git.grep.yourbranch | .git.grep.theupstreamgone'


function .git.foreachbranch.pull.and.show.status() {

for branchtocheck in $(git branch);
do (
    git checkout $branchtocheck
    git pull
    git st
);done

git checkout main


}

function .git.subdirs.create.new.branch() {
    BRANCH_NAME=$1
    for d in ./*/ ;
    do (
        cd "$d" ;
        git branch "$BRANCH_NAME"
     ); done

}


function .git.subdirs.checkout.branch() {
    BRANCH_NAME=$1
    for d in ./*/ ;
    do (
        cd "$d" ;
        git checkout "$BRANCH_NAME"
     ); done

}

function .git.subdirs.diff.main.count() {
echo "main Diffs for Branch / Feature Dirs"
for d in ./*/ ;
    do (
        #echo "dir is $filebasename"
        cd "$d" ;
    	printf "$d :"
        git diff main | grep "diff --git" -c
     	); done


echo "****"

printf "\n\n\nmain Diffs for Reference dirs"
    cd symlinks
    for d in ./*/ ;
    do (
        cd "$d" ;
        printf "$d :"
        git diff main | grep "diff --git" -c | grep ":[d]"
     ); done
    cd ../

}


function .git.subdirs.diff.main.summary() {
    for d in ./*/ ;
    do (
        cd "$d" ;
        echo "**** Diff of $d :"
        git diff main | grep "diff --git"
     ); done

}

function .git.subdirs.diff.main.full() {
    for d in ./*/ ;
    do (
        cd "$d" ;
        echo "**** Diff of $d :"
        git diff main
     ); done

}





function .git.subdirs.main.pull() {
    for d in ./*/ ;
    do (
        cd "$d" ;
        .git.main.pull
     ); done

}

function .git.subdirs.merge.from.main() {
    for d in ./*/ ;
    do (
        cd "$d" ;
        .git.merge.from.main
     ); done

}

alias .git.branches.list.by-last-commit="git for-each-ref --sort=-committerdate refs/heads/ --format='%(committerdate:relative)%09%(refname:short)"



function .git.search.for.file.across.branches() {
    if [ -z "$1" ]
    then
        echo "Supply a file name to search for"
    return 1
    fi

    local FILENAME="$@"
    echo "Searching for file using full history: $FILENAME"
    git log --all --full-history -- **/$FILENAME

  echo "Searching for file using lstree: $FILENAME"


for branch in `git for-each-ref --format="%(refname)" refs/heads`; do
  echo $branch :; git ls-tree -r --name-only $branch | grep '<foo>'
done

}

function .git.checkout.all.branches() {
    for branch in $(git branch -a | grep remotes | grep -v HEAD | grep -v main); do
        git branch --track ${branch#remotes/origin/} $branch
    done
}


function .git.find.branches.containing.file.and.diff.between.them.and.this.branch()
{
  if [ $# -ne 1 ]; then
    echo "Usage: $0 <relative file_path>"
    exit 1
  fi

  file_path="$1"

  # Get the current branch name
  current_branch=$(git symbolic-ref --short HEAD)

  # Get a list of branches containing the specified file
  branches_with_file=$(git for-each-ref --format="%(refname:short)" refs/heads/ | while read branch; do
    if git rev-list $branch -- "$file_path" | grep -q .; then
      echo "$branch"
    fi
  done)

  # Iterate through branches and perform a git diff
  for branch in $branches_with_file; do
    echo "Diff between $branch and $current_branch for file $file_path:"
    git diff $current_branch..$branch -- "$file_path"
    echo "-----------------------------------------"
  done
}
