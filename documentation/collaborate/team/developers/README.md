# IAAC this template


* Là :

```bash
export COLLABORATION_MGMT_BRANCH=develop

# ---
# Where to download the setup script;

export SSH_URI_TO_GIT_REPO=git@github.com:pokusio/opensuzie-oci-library.git

git clone $SSH_URI_TO_GIT_REPO

export PATH="${PATH}:$(pwd)/documentation/collaborate/team/developers/develop.sh"

$(pwd)/documentation/collaborate/team/developers/develop.sh

```

* or :

```bash
# export GIT_SSH_COMMAND='ssh -i ~/.ssh/id_rsa'
export THIS_GIT_URI=git@github.com:pokusio/opensuzie-oci-library.git
export WORK_DIR=$(mktemp -d ~/pegasus.git.templates.library.dev.XXXXXXXX)

export FEATURE_ALIAS="mafonctionnalite"

git clone $THIS_GIT_URI $WORK_DIR
cd $WORK_DIR
git flow init --defaults


export COMMIT_MESSAGE_PS1='Resuming'

git checkout $FEATURE_ALIAS || export COMMIT_MESSAGE_PS1='Starting' && git flow init start $FEATURE_ALIAS

git push -u origin HEAD
git pull -u origin --all


export GFLOW_FEATURE_BRANCH_PREFIX=$(git flow config|grep Feature|awk '{print $NF}')
export CURRENT_FEATURE_BRANCH=$(git branch -a | grep -v 'remotes' | grep $GFLOW_FEATURE_BRANCH_PREFIX |awk '{print $2}')

export COMMIT_MESSAGE=""
export COMMIT_MESSAGE="$COMMIT_MESSAGE ${COMMIT_MESSAGE_PS1} work on [$CURRENT_FEATURE_BRANCH]"

# git add --all && git commit -m "$COMMIT_MESSAGE" && git push -u origin HEAD
```


Below there an example content for the root `README.md`

---

# The developer guide

You must use the `git-flow`, `AVH Edition`, to contribute :
* Any pull request not following the git-flow will be discarded
* I will support any developer documentation, as long as it does use strict git work-flow. For example, Iwill not discuss how to do or fix anything related to git workflow, if it is not `git-flow` based.

To contribute, open a shell session, and allin that same shell session :
* 1./ [ ] fork this repository (`Fork` button on top right corner) : this will create a git repo to host your pull request proposal, without affecting this one.
* 2./ [ ] prepare your environement :
  * install the `git-flow` package, and check it is the `AVH Edition`, which is the case by default on most todays Linux Distribution
* 3./ [ ] open and keep in your pocket http://danielkummer.github.io/git-flow-cheatsheet/
* 4./ [ ] run this :


```bash

DWNLD_LINK=https://github.com/pokusio/opensuzie-oci-library
epxort DWNLD_LINK=https://raw.githubusercontent.com/pokusio/opensuzie-oci-library/develop/documentation/collaborate/contribute/contribute.sh

curl ${DWNLD_LINK} | tee -a ./contribute.sh | sh -
./contribute.sh

export FEATURE_ALIAS=''

# starting work on first feature
git flow feature start $FEATURE_ALIAS
# creating feature branch on remote
git push -u origin HEAD


export COMMIT_MESSAGE=""
export COMMIT_MESSAGE="$COMMIT_MESSAGE add here more to your commit message explaining details about [${FEATURE_ALIAS}]"
# git add --all && git commit -m "$COMMIT_MESSAGE" && git push -u origin HEAD


```
* 5./ [ ] Edit the source code, hit the arrow key on your keyoard three times,
* 6./ [ ] Then commit to your feature branch, running :

```bash

# now start commit
export COMMIT_MESSAGE=""
export COMMIT_MESSAGE="$COMMIT_MESSAGE add here more to yourcommit message [${FEATURE_ALIAS}]"
# export COMMIT_MESSAGE="or reset the commit message to zero"
git add --all && git commit -m "$COMMIT_MESSAGE" && git push -u origin HEAD

```
* 7./ [ ] Repeat 5./ and 6./ as many times as needed : Edit and commit on your feature branch until you're finished implementing or fixing,
* 8./ [ ] and when finished, run :

```bash
export GFLOW_FEATURE_BRANCH_PREFIX=$(git flow config|grep Feature|awk '{print $NF}')
git branch -a | grep $GFLOW_FEATURE_BRANCH_PREFIX
export CURRENT_FEATURE_BRANCH=$(git branch -a | grep -v 'remotes' | grep $GFLOW_FEATURE_BRANCH_PREFIX |awk '{print $2}')
echo "Your feature branch name is [$CURRENT_FEATURE_BRANCH]"

# ----
# On the contributor side, the contributor just
# performs a simple merge, to show how he proposes to
#  resolve merge conflicts, if any.
# ----
export
git checkout develop
git merge $CURRENT_FEATURE_BRANCH

# ---
# And now you resolve merge conflicts
# Edit the merge mesage (a merge is a commit, so
# the merge message is a commit message)
# ---
# When we will inspect your feature branch commits, we will also use your merge, to launch tests and see if we agree with your merge (checking you didn't break anything, even if your feature works)
# ---
# this will be interactive
# ---

exit 0
echo "It's the recipient of the pull request who will git flow feature finish $FEATURE_ALIAS"
echo "because if you [git flow feature finish] this will delete your feature branch"
echo "and we want to have a look at your commits on your feature branch, before validation."
# ---
# What we do only internally to the pokus dev team :
# (because pokus team members, that are developers, have
# permissions to push their feature branch directly into
# pokus owned repos)
# Our developers also send pull requests, and their
# managers, who also have the push permissions, and the
# permissions to push to develop (restricted to managers)
# ---
# finishing, merging to develop
# 'WARNING' : this will be interactive, and
# you may conflict with 'develop' branch, in
# which case you will have to resolve merge
# conflict, and merge.
# git flow AVH Edition will assist you with that.
# ----
git flow feature finish $FEATURE_ALIAS
# pushing merge to remote, remote feature branch deleted
git push -u origin HEAD
```

* 9./ [ ] Now send your pull request :
  * On **this** repository, click the button `new pull request`
  * click the _**`compare across fork`**_ pull request option :

  ![compare across forks](documentation/collaborate/contribute/images/COMPARE_ACROSS_FORKS_PR_OPTION.png)

  * right side, is **your repo**, on which your commits are. Here select the feature branch on your side :

![searching for your repo](documentation/collaborate/contribute/images/AFTER_COMPARE_ACCROSS_FORKS_FIND_YOUR_REPO_2020-03-01 00-15-26.png)

![selecting your feature branch](documentation/collaborate/contribute/images/AFTER_COMPARE_ACCROSS_FORKS_FIND_YOUR_REPO_2020-03-01 00-15-26.png)


  * you can make sure what your feature branch name is, by executing this :

```bash
export GFLOW_FEATURE_BRANCH_PREFIX=$(git flow config|grep Feature|awk '{print $NF}')
git branch -a | grep $GFLOW_FEATURE_BRANCH_PREFIX
export CURRENT_FEATURE_BRANCH=$(git branch -a | grep -v 'remotes' | grep $GFLOW_FEATURE_BRANCH_PREFIX |awk '{print $2}')
echo " your feature branch name is [$CURRENT_FEATURE_BRANCH]"
```

  * left side, is **this repo**, on which your commits are going to be accepted or rejected. There select the `develop` branch, which is the branch to which your feature branch will be merged, if pull requested accepted.
  * Below, you can see an example repo where there is no branch named `develop`, so we select the `test-branch`, to show you how to define the target branch of a pull request (but do bear inmind you must select `develop` to collaborate to submit your pull requestto us, or it's going to be automatically rejected) :

![target branch](documentation/collaborate/contribute/images/PULL_REQUEST_TARGET_BRANCH_ON_TARGET_REPO.png)



In the screenshots above, you see the url of two git repos that actually exist :
* https://github.com/pokusio/Spoon-Knife : An example repo we ceated, that we forked from https://github.com/pokusio/Spoon-Knife
* https://github.com/octocat/Spoon-Knife : a repo made available by gihub to demonstrate git workflow management github features, like pull requests. Anyone can play with it,to test sending pull requests, for example.


# With IDE

I like `Atom` IDE, created years ago by Github's Team.

You may install `Atom` very easily, see :

* https://flight-manual.atom.io/getting-started/sections/installing-atom
* https://flight-manual.atom.io/getting-started/sections/installing-atom/#installing-atom-on-linux
