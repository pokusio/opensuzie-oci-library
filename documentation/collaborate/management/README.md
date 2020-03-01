# Collaboration Management on this repo (not fully tested yet, planned for release `0.0.3`)


## Initializing the repo

The rpocess consist of making a first commit, then initalizing the git flow, to head for first release.

* Automated process :

```bash
export SUZIE_OCI_LIBRARY_GIT_URI=git@github.com:pokusio/opensuzie-oci-library.git
export INITIAL_COMMIT_MSG=${INITIAL_COMMIT_MSG:-'Initializing OpenSUZIE OCI library repo'}
export FIRST_FEATURE_ALIAS="portus-2.5-fix"

git init
git remote add origin $SUZIE_OCI_LIBRARY_GIT_URI


git add --all && git commit -m "$INITIAL_COMMIT_MSG" && git push -u origin master


# ---
# note : on most linux distribs, as of today, installing
# package git-flow installs the correct version to use, that
# is 'Git Flow AVH Edition' From [Peter Vanderdoes] awesome
# work on top of [Vincent Driessen's]
# ---

git flow init --defaults

# pushing newly created develop branch to remote
git push -u origin all

# starting work on first feature
git flow feature start $FIRST_FEATURE_ALIAS

export COMMIT_MESSAGE=""
export COMMIT_MESSAGE="$COMMIT_MESSAGE Starting work on [${FIRST_FEATURE_ALIAS}]"

git add --all && git commit -m "$COMMIT_MESSAGE" && git push -u origin HEAD


# # finishing, merging to develop
# git flow feature finish $FIRST_FEATURE_ALIAS
# # pushing merge to remote, remote feature branch deleted
# git push -u origin HEAD


#

```

## `Pokus` Teams Members

### Maintainers (they validate code)

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

### Developers

see full [developer guide here](documentation/collaborate/team/developers)

# Issue / PR templates

* Modified existing community templates, All credits go to https://github.com/stevemao/github-issue-templates
