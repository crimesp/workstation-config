#########
#GIT
#########

alias .git.reset.head='git reset HEAD .'


alias .git.commit.undo_last_commit='git reset --soft HEAD~1'

#show files in staging
alias .git.stage._show_staging_files_detail='git diff'

#show files in staging (name only)
alias .git.stage.show_staging_files_summary='git diff --name-status'

#files added, but not committed
alias .git.stage.show_uncommited_files='git diff --staged --name-only'

#compare current branch to master
alias .git.compare.compare_current_branch_to_master='git diff --stat --cached origin/master'


#show summary of commits
alias .git.commit.show_commits_summary='git cherry -v'

#shows branches not pushed
alias .git.branches.show_unpushed='git log --branches --not --remotes=origin --no-walk --decorate --oneline'

alias .gitk='gitk --all'


######################
#NOTE I'M NOT 100% sure if these commands truly work as expected!!!

#####
# pull the local master branch with latest changes when on another branch
# will fail with "fatal: Refusing to fetch into current branch refs/heads/master of non-bare repository" if you are on master branch

alias .git.master.pull='git fetch origin master:master'
#####

#####
# pull the latest master branch and merge onto the current branch
# will fail with "fatal: Refusing to fetch into current branch refs/heads/master of non-bare repository" if you are on master branch

alias .git.merge.from_master='.git.master.pull; git merge master'
#####

#####
# rebase the current branch against the latest master branch
# will fail with "fatal: Refusing to fetch into current branch refs/heads/master of non-bare repository" if you are on master branch

alias .git_rebase_from_master='.git.master.pull; git rebase master'
######


#useful for tidying up branches that are no longer required
alias .git_prune_with_delete_helper=".git_prune;git branch -v | grep gone; echo git branch -d BRANCH NAME "
alias .git_prune='git remote prune origin'



########################################################
# git functions
########################################################


#git operations for all git projects in subdirectories
alias .git.subdirs.status='for d in ./*/ ; do (cd "$d" && echo '';pwd;git status); done'
alias .git.subdirs.branch='for d in ./*/ ; do (cd "$d" && echo '';pwd;git branch); done'
alias .git.subdirs.branchall='for d in ./*/ ; do (cd "$d" && echo '';pwd;git branch -a); done'
alias .git.subdirs.pull='for d in ./*/ ; do (cd "$d" && echo '';pwd;git pull); done'
alias .git.subdirs.fetch='for d in ./*/ ; do (cd "$d" && echo '';pwd;git fetch); done'
alias .git.subdirs.master_checkoutandpull='for d in ./*/ ; do (cd "$d" && echo '';pwd;git checkout master; git pull); done'

alias .git.master.checkout='git checkout master'

alias .git.branch.delete='git checkout master; git branch -d '
alias .git.branch.deletehard='git branch -D '
#but untracked files present
alias .git.report.generate="rc;.git_foreachbranch_pull_and_show_status > .git_report.log; cat .git_report.log"
alias .git.report.grep.but="grep 'but' .git_report.log | uniq"
alias .git.report.grep.no_origins="grep 'but the upstream is gone' .git_report.log | uniq"

alias .git.grep.yourbranch=$'sed "s/Your branch is based on \'origin\//.git.branch.delete /g"'
alias .git.grep.theupstreamgone=$'sed "s/\', but the upstream is gone.//g"'

alias .git.execute.branch_delete='.git.report.grep.no_origins | .git.grep.yourbranch | .git.grep.theupstreamgone'




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

.extract_JIRA_Ticket_Number() {
    regex='(.*-?[0-9]+)-.+'
    if [[ "${BRANCH_NAME}" =~ $regex ]]; then
         echo "matched jira ticket number ${BASH_REMATCH[1]}"
         JIRA_TICKET="${BASH_REMATCH[1]}"
    else
         echo "${BRANCH_NAME} does not match JIRA Ticket Number matcher"
         JIRA_TICKET="${BRANCH_NAME}"
    fi
}

function .git_foreachbranch_pull_and_show_status() {

for branchtocheck in $(git branch);
do (
    git checkout $branchtocheck
    git pull
    git st
);done

git checkout master


}

function .git.subdirs.create_new_branch() {
    BRANCH_NAME=$1
    for d in ./*/ ;
    do (
        cd "$d" ;
        git branch "$BRANCH_NAME"
     ); done

}


function .git.subdirs.checkout_branch() {
    BRANCH_NAME=$1
    for d in ./*/ ;
    do (
        cd "$d" ;
        git checkout "$BRANCH_NAME"
     ); done

}

function .git.subdirs.diff_master_count() {
echo "Master Diffs for Branch / Feature Dirs"
for d in ./*/ ;
    do (
        #echo "dir is $filebasename"
        cd "$d" ;
    	printf "$d :"
        git diff master | grep "diff --git" -c
     	); done


echo "****"

printf "\n\n\nMaster Diffs for Reference dirs"
    cd symlinks
    for d in ./*/ ;
    do (
        cd "$d" ;
        printf "$d :"
        git diff master | grep "diff --git" -c | grep ":[d]"
     ); done
    cd ../

}


function .git.subdirs.diff_master_summary() {
    for d in ./*/ ;
    do (
        cd "$d" ;
        echo "**** Diff of $d :"
        git diff master | grep "diff --git"
     ); done

}

function .git.subdirs.diff_master_full() {
    for d in ./*/ ;
    do (
        cd "$d" ;
        echo "**** Diff of $d :"
        git diff master
     ); done

}





function .git.subdirs.master_pull() {
    for d in ./*/ ;
    do (
        cd "$d" ;
        .git.master.pull
     ); done

}

function .git.subdirs.merge_from_master() {
    for d in ./*/ ;
    do (
        cd "$d" ;
        .git.merge.from_master
     ); done

}



alias .git.commit='_git.commit'
function _git.commit() {
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


alias .git.push='.git.push.with_commit_message'
function .git.push.with_commit_message() {
    _git.commit "$@"
    git push
}


function .git.index.remove() {
   if [ -z "$1" ]
    then
        echo "Supply a path to the file or folder you wish to remove from git index."
	echo "Typically this would be when you have ignored a file or folder that has been committed in the past"
    return 1
   fi
    git rm -r --cached $1
}

function .git.checkout.new_branch() {
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



function .git.branch.rename_current() {
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


