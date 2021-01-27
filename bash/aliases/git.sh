#########
#GIT
#########
alias .git_undo_last_commit='git reset --soft HEAD~1'

#show files in staging
alias .git_show_staging_files_detail='git diff'

#show files in staging (name only)
alias .git_show_staging_files_summary='git diff --name-status'

#files added, but not committed
alias .git_show_uncommited_files='git diff --staged --name-only'

#compare current branch to master
alias .git_compare_current_branch_to_master='git diff --stat --cached origin/master'


#show summary of commits
alias .git_show_commits_summary='git cherry -v'

#shows branches not pushed
alias .git.branches.show_unpushed='git log --branches --not --remotes=origin --no-walk --decorate --oneline'



######################
#NOTE I'M NOT 100% sure if these commands truly work as expected!!!

#####
# pull the local master branch with latest changes when on another branch
# will fail with "fatal: Refusing to fetch into current branch refs/heads/master of non-bare repository" if you are on master branch

alias .git_master_pull='git fetch origin master:master'
#####

#####
# pull the latest master branch and merge onto the current branch
# will fail with "fatal: Refusing to fetch into current branch refs/heads/master of non-bare repository" if you are on master branch

alias .git_merge_from_master='.git_master_pull; git merge master'
#####

#####
# rebase the current branch against the latest master branch
# will fail with "fatal: Refusing to fetch into current branch refs/heads/master of non-bare repository" if you are on master branch

alias .git_rebase_from_master='.git_master_pull; git rebase master'
######


#useful for tidying up branches that are no longer required
alias .git_prune_with_delete_helper=".git_prune;git branch -v | grep gone; echo git branch -d BRANCH NAME "
alias .git_prune='git remote prune origin'



########################################################
# git functions
########################################################


#git operations for all git projects in subdirectories
alias .git_foreachdir__status='for d in ./*/ ; do (cd "$d" && echo '';pwd;git status); done'
alias .git_foreachdir__branch='for d in ./*/ ; do (cd "$d" && echo '';pwd;git branch); done'
alias .git_foreachdir__branchall='for d in ./*/ ; do (cd "$d" && echo '';pwd;git branch -a); done'
alias .git_foreachdir__pull='for d in ./*/ ; do (cd "$d" && echo '';pwd;git pull); done'
alias .git_foreachdir__fetch='for d in ./*/ ; do (cd "$d" && echo '';pwd;git fetch); done'
alias .git_foreachdir__master_checkoutandpull='for d in ./*/ ; do (cd "$d" && echo '';pwd;git checkout master; git pull); done'

alias .git_master_checkout='git checkout master'

alias .git_branch_delete='git branch -d '
alias .git_branch_deletehard='git branch -D '


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

function .git_foreachbranch_pull() {

for branchtocheck in $(git branch);
do (
    git checkout $branchtocheck
    git pull
    git st
);done

git checkout master


}

function .git_foreachdir__create_new_branch() {
    BRANCH_NAME=$1
    for d in ./*/ ;
    do (
        cd "$d" ;
        git branch "$BRANCH_NAME"
     ); done

}


function .git_foreachdir__checkout_branch() {
    BRANCH_NAME=$1
    for d in ./*/ ;
    do (
        cd "$d" ;
        git checkout "$BRANCH_NAME"
     ); done

}

function .git_foreachdir__diff_master_count() {
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


function .git_foreachdir__diff_master_summary() {
    for d in ./*/ ;
    do (
        cd "$d" ;
        echo "**** Diff of $d :"
        git diff master | grep "diff --git"
     ); done

}

function .git_foreachdir__diff_master_full() {
    for d in ./*/ ;
    do (
        cd "$d" ;
        echo "**** Diff of $d :"
        git diff master
     ); done

}





function .git_foreachdir__master_pull() {
    for d in ./*/ ;
    do (
        cd "$d" ;
        .git_master_pull
     ); done

}

function .git_foreachdir__merge_from_master() {
    for d in ./*/ ;
    do (
        cd "$d" ;
        .git_merge_from_master
     ); done

}





alias .git.push_with_commit_message='.git_commit_and_push_with_message'
function .git_commit_and_push_with_message() {
    if [ -z "$1" ]
    then
        echo "Supply a commit message!"
    return 1
    fi

    local MESSAGE="$@"

    echo "commiting with message: $MESSAGE"

    git add .
    git commit -a -m "$MESSAGE"
    git push
}


function .git.index.remove() {
   if [ -z "$1" ]
    then
        echo "Supply a path to the file or folder you wish to remove from git index."
	echo "Typically this would be when you have ignored a file that has been committed in the past"
    return 1
   fi
    git rm -r --cached package $1
}

function .git_checkout_new_branch() {
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



function .git_branch_rename_current() {
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


