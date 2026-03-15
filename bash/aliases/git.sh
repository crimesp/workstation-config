#########
#GIT
#########

#git@github.com:UdaraWanasinghe/flutter-carousel-slider.git
#https://github.com/UdaraWanasinghe/flutter-carousel-slider
#
#git remote add upstream https://github.com/original-owner/original-repo.git
#
#
##if i have forked
#git remote add upstream git@github.com:UdaraWanasinghe/flutter-carousel-slider.git
#
#
#if i need to fork
#git remote add myfork git@github.com:DashingDevelopers/flutter-carousel-slider.git
#git push --set-upstream myfork for-upstream
#
#



alias .git.cherry.changes-from.master='git cherry -v master'
alias .git.cherry.changes-from.main='git cherry -v main'
alias .git.cherry.changes-from.develop='git cherry -v develop'


function .git.remote.update-remote-to-dashy-dev() {

    if [ -z "$1" ]
    then
        echo "Supply a project name"
        echo 'result will be git remote set-url origin git@github.com:DashingDevelopers/$1.git'
    return 1
    fi


git remote set-url origin git@github.com:DashingDevelopers/$1.git



}

alias .git.reset.head='git reset HEAD .'

alias .git.restore.staged='git restore --staged'

alias .git.commit.undo.last.commit='git reset --soft HEAD~1'

#show files in staging
alias .git.stage..show.staging.files.detail='git diff'

#show files in staging (name only)
alias .git.stage.show.staging.files.summary='git diff --name-status'

#files added, but not committed
alias .git.stage.show.uncommited.files='git diff --staged --name-only'

#compare current branch to master
alias .git.compare.compare.current.branch.to.master='git diff --stat --cached origin/master'

#compare current branch to main
alias .git.compare.compare.current.branch.to.main='git diff --stat --cached origin/main'


#show summary of commits
alias .git.commit.show.commits.summary='git cherry -v'

#shows branches not pushed
alias .git.branches.show.unpushed='git log --branches --not --remotes=origin --no-walk --decorate --oneline'

alias .gitk='gitk --all'


######################
#NOTE I'M NOT 100% sure if these commands truly work as expected!!!

#####
# pull the local main branch with latest changes when on another branch
# will fail with "fatal: Refusing to fetch into current branch refs/heads/main of non-bare repository" if you are on main branch

alias .git.master.pull='git fetch origin master:master'
#####

#####
# pull the latest master branch and merge onto the current branch
# will fail with "fatal: Refusing to fetch into current branch refs/heads/master of non-bare repository" if you are on master branch

alias .git.merge.from.master='.git.master.pull; git merge master'
#####

#####
# rebase the current branch against the latest master branch
# will fail with "fatal: Refusing to fetch into current branch refs/heads/master of non-bare repository" if you are on master branch

alias .git.rebase.from.master='.git.master.pull; git rebase master'
######


alias .git.main.pull='git fetch origin main:main'
#####

#####
# pull the latest main branch and merge onto the current branch
# will fail with "fatal: Refusing to fetch into current branch refs/heads/main of non-bare repository" if you are on main branch

alias .git.merge.from.main='.git.main.pull; git merge main'
#####

#####
# rebase the current branch against the latest main branch
# will fail with "fatal: Refusing to fetch into current branch refs/heads/main of non-bare repository" if you are on main branch

alias .git.rebase.from.main='.git.main.pull; git rebase main'
######


#useful for tidying up branches that are no longer required
alias .git.prune.with.delete.helper=".git.prune;git branch -v | grep gone; echo git branch -d BRANCH NAME "
alias .git.prune='git remote prune origin'



########################################################
# git functions
########################################################


#git operations for all git projects in subdirectories
alias .git.subdirs.status='for d in ./*/ ; do (cd "$d" && echo '';pwd;git status); done'
alias .git.subdirs.branch='for d in ./*/ ; do (cd "$d" && echo '';pwd;git branch); done'
alias .git.subdirs.branchall='for d in ./*/ ; do (cd "$d" && echo '';pwd;git branch -a); done'
alias .git.subdirs.pull='for d in ./*/ ; do (cd "$d" && echo '';pwd;git pull); done'
alias .git.subdirs.fetch='for d in ./*/ ; do (cd "$d" && echo '';pwd;git fetch); done'
alias .git.subdirs.main.checkoutandpull='for d in ./*/ ; do (cd "$d" && echo '';pwd;git checkout main; git pull); done'

alias .git.main.checkout='git checkout main'

alias .git.subdirs.master.checkoutandpull='for d in ./*/ ; do (cd "$d" && echo '';pwd;git checkout master; git pull); done'

alias .git.master.checkout='git checkout master'

alias .git.branch.delete='git branch -d '
alias .git.branch.deletehard='git branch -D '
#but untracked files present
alias .git.report.generate="rc;.git.foreachbranch.pull.and.show.status > .git_report.log; cat .git_report.log"
alias .git.report.grep.but="grep 'but' .git_report.log | uniq"
alias .git.report.grep.no.origins="grep 'but the upstream is gone' .git_report.log | uniq"

alias .git.grep.yourbranch=$'sed "s/Your branch is based on \'origin\//.git.branch.delete /g"'
alias .git.grep.theupstreamgone=$'sed "s/\', but the upstream is gone.//g"'

alias .git.execute.branch.delete='.git.report.grep.no.origins | .git.grep.yourbranch | .git.grep.theupstreamgone'




function .git.push.revert.origin.to.commit.hard() {

    if [ -z "$1" ]
    then
        echo "Supply a commit hash to revert to"
    return 1
    fi


git reset --hard $1
git clean -f -d
git push -f



}



#sed "s/Your branch is based on '/origin\//"

.extract.JIRA.Ticket.Number() {
    regex='(.*-?[0-9]+)-.+'
    if [[ "${BRANCH_NAME}" =~ $regex ]]; then
         echo "matched jira ticket number ${BASH_REMATCH[1]}"
         JIRA_TICKET="${BASH_REMATCH[1]}"
    else
         echo "${BRANCH_NAME} does not match JIRA Ticket Number matcher"
         JIRA_TICKET="${BRANCH_NAME}"
    fi
}

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

alias .git.commit='.git.commit'
function .git.commit() {
    if [ -z "$1" ]
    then
        echo "Supply a commit message!"
    return 1
    fi

    local MESSAGE="$@"

    echo "commiting with message: $MESSAGE"

    git add .
    git commit -a -m "$MESSAGE"
}


alias .git.push='.git.push.with.commit.message'
function .git.push.with.commit.message() {
    .git.commit "$@"
    git push
}

alias .fix='.git.push.with.commit.message fix: '
alias .feat='.git.push.with.commit.message feat: '
alias .chore='.git.push.with.commit.message chore: '


function .git.index.remove() {
   if [ -z "$1" ]
    then
        echo "Supply a path to the file or folder you wish to remove from git index."
	echo "Typically this would be when you have ignored a file or folder that has been committed in the past"
    return 1
   fi
    git rm -r --cached $1
}

function .git.checkout.new.branch() {
    if [ -z "$1" ]
    then
        echo "Supply a branch name (spaces are ok)"
    return 1
    fi

    local BRANCH="$@"
    local BRANCH_CLEAN="${BRANCH// /-}"
    echo "Checking out new branch: $BRANCH_CLEAN"
    git checkout -b "$BRANCH_CLEAN"
}

function .git.checkout.new.branch.feat() {
    if [ -z "$1" ]
    then
        echo "Supply a branch name (spaces are ok)"
    return 1
    fi

    local BRANCH="$@"
    local BRANCH_CLEAN="feat/${BRANCH// /-}"
    echo "Checking out new branch: $BRANCH_CLEAN"
    git checkout -b "$BRANCH_CLEAN"
}

alias .branch.feat='.git.checkout.new.branch.feat'
alias .branch.fix='.git.checkout.new.branch.fix'

function .git.checkout.new.branch.fix() {
    if [ -z "$1" ]
    then
        echo "Supply a branch name (spaces are ok)"
    return 1
    fi

    local BRANCH="$@"
    local BRANCH_CLEAN="fix/${BRANCH// /-}"
    echo "Checking out new branch: $BRANCH_CLEAN"
    git checkout -b "$BRANCH_CLEAN"
}


function .git.branch.rename.current() {
   if [ -z "$1" ]
    then
        echo "Supply a new branch name (spaces are ok)"
    return 1
    fi

    local BRANCH="$@"
    local NEW_BRANCH_CLEAN="${BRANCH// /-}"

    git branch -m $NEW_BRANCH_CLEAN

    echo "Delete the old-name remote branch and push the new-name local branch with this command:"
    echo "git push origin :old-name $NEW_BRANCH_CLEAN"

#3. Reset the upstream branch for the new-name local branch.
#Switch to the branch and then:
    git push origin -u $NEW_BRANCH_CLEAN

}


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
