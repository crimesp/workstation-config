#########
#GIT
#########
alias .git.main.checkout='git checkout main'
alias .git.master.checkout='git checkout master'

alias .git.branch.delete='git branch -d '
alias .git.branch.deletehard='git branch -D '

alias .git.update.from.main='.git.main.pull && .git.merge.from.main'

alias .fix='.git.push.with.commit.message fix: '
alias .feat='.git.push.with.commit.message feat: '
alias .chore='.git.push.with.commit.message chore: '
alias .chore.merge.from.main='.chore merge from main'


alias .git.main.pull='git fetch origin main:main'
alias .git.master.pull='git fetch origin master:master'

alias .git.merge.from.main='.git.main.pull; git merge main -m"chore: merge from main branch"'
alias .git.merge.from.master='.git.master.pull; git merge master -m"chore: merge from master branch"'

alias .git.rebase.from.main='.git.main.pull; git rebase main -m"chore: rebase from main branch"'
alias .git.rebase.from.master='.git.master.pull; git rebase master -m"chore: rebase from master branch"'






alias .git.reset.head='git reset HEAD .'
alias .git.restore.staged='git restore --staged'
alias .git.commit.undo.last.commit='git reset --soft HEAD~1'
alias .git.commit.reset-all='git reset --soft $(git merge-base HEAD main)'


alias .git.branch.squash.push.force-with-lease='git.commit.reset-all;git commit -m "chore: force squash commits";git push --force-with-lease';

alias .git.cherry.changes-from.master='git cherry -v master'
alias .git.cherry.changes-from.main='git cherry -v main'
alias .git.cherry.changes-from.develop='git cherry -v develop'




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



#useful for tidying up branches that are no longer required
alias .git.prune.with.delete.helper=".git.prune;git branch -v | grep gone; echo git branch -d BRANCH NAME "
alias .git.prune='git remote prune origin'



########################################################
# git functions
########################################################







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

