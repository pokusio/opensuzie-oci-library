#!/bin/sh

set +x
# --
# default git repo to work on, for the pokus team
export SUZIE_OCI_LIBRARY_GIT_URI=git@github.com:pokusio/opensuzie-oci-library.git


# This one, you must set : It must be a name basically reflecting what feature you want to work on contribute for.
# export FEATURE_ALIAS="portus-2.5-fix"
export FEATURE_ALIAS=${FEATURE_ALIAS:-''}

export DEFAULT_WORK_DIRECTORY=$(mktemp -d /tmp/suzie.oci.library.dev.XXXXXXXX)


usage () {
  set -x
  echo ''
  echo "-------------------------------------------------"
  echo "-------------------------------------------------"
  echo "---------            [$0]               ---------"
  echo "-------------------------------------------------"
  echo "-------------------------------------------------"
  echo "---------            Usage  :"
  echo "-------------------------------------------------"
  echo "export FEATURE_ALIAS=<what is is you want to work on, shortname, no space no special char> && ./$O"
  echo "-------------------------------------------------"
  echo "You must set : "
  echo "    => \$FEATURE_ALIAS : this is used by"
  echo "       the git flow, to set the feature branch   "
  echo "       name to '<someprefix>-${FEATURE_ALIAS}'"
  echo "-------------------------------------------------"
  echo "You may optionnally set :"
  echo "-------------------------------------------------"
  echo " \$WORK_DIR : to set the folder path where you "
  echo "              want to work on your machine "
  echo "              defaults to [${DEFAULT_WORK_DIRECTORY}]"
  echo "-------------------------------------------------"
  echo " You must set \$FORK_GIT_URI"
  echo " \$FORK_GIT_URI (required) :  the URI (ssh or https) of the git repo "
  echo "             you work on, to submit your pull request "
  echo "             defaults to [${SUZIE_OCI_LIBRARY_GIT_URI}]"
  echo "-------------------------------------------------"
  echo ''


}

gitFlowInstallationTips () {
  set -x
  echo ''
  echo "-------------------------------------------------"
  echo "-------------------------------------------------"
  echo "---------     [Git Flow Install Tips]   ---------"
  echo "-------------------------------------------------"
  echo "-------------------------------------------------"
  echo "---------  [Installing git flow AVH Edition]  "
  echo "-------------------------------------------------"
  echo "---------  [Is achieved differently on different]"
  echo "---------  [Linux distros. Here are a few tips ] "
  echo "-------------------------------------------------"
  echo "--------+ CentOS / RHEL : "
  echo "          yum install -y git-flow"
  echo "-------------------------------------------------"
  echo "--------+ Debian / Ubuntu: "
  echo "          apt-get install -y git-flow"
  echo "-------------------------------------------------"
  echo "--------+ Alpine and other general linux : "
  echo "          wget --no-check-certificate -q https://raw.github.com/petervanderdoes/gitflow/develop/contrib/gitflow-installer.sh"
  echo "          chmod +x gitflow-installer.sh"
  echo "          sudo ./gitflow-installer.sh install stable"
  echo "-------------------------------------------------"
  echo "--------+ OpenSUSE Leap 15.x (run as root ): "
  echo "          export FIFTEEN_POINT_X=1"
  echo "          zypper addrepo https://download.opensuse.org/repositories/devel:tools:scm/openSUSE_Leap_15.${FIFTEEN_POINT_X}/devel:tools:scm.repo"
  echo "          zypper refresh"
  echo "          zypper install git-flow"
  echo "-------------------------------------------------"
  echo "-------++ To check your git flow version, run : "
  echo "-------------------------------------------------"
  echo "                     git flow version    "
  echo "-------------------------------------------------"
  echo ''
}
requirements () {
  set -x
  echo ''
  echo "-------------------------------------------------"
  echo "-------------------------------------------------"
  echo "---------            [$0]               ---------"
  echo "-------------------------------------------------"
  echo "-------------------------------------------------"
  echo "---------            Requires  :"
  echo "-------------------------------------------------"
  echo " [-] git flow AVH Edition, version >= 1.10.2"
  echo ''
  git flow version || (echo "please install the git flow AVH Edition" && gitFlowInstallationTips && exit 1)
}


# ---+---
# ---+---
# Required env. vars
if [ "x$FEATURE_ALIAS" == "x" ]; then
  echo "The \$FEATURE_ALIAS env. var. is not set"
  usage
  exit 1
fi;

# optional env. vars
if [ "x$WORK_DIR" == "x" ]; then
  echo "The \$WORK_DIR env. var. is not set, it is optional and so defaults to [${DEFAULT_WORK_DIRECTORY}] "
  usage
fi;
export WORK_DIR=${WORK_DIR:-"$DEFAULT_WORK_DIRECTORY"}

if [ "x$FORK_GIT_URI" == "x" ]; then
  echo "The \$FORK_GIT_URI env. var. is not set, it is optional and so defaults to [${SUZIE_OCI_LIBRARY_GIT_URI}] "
  usage
  exit 1
fi;

# required dependencies
requirements

# --
# now starting the git workflow

git clone $FORK_GIT_URI $WORK_DIR

git flow init --defaults

# this will either resume work, on existing feature branch, or start a new feature contribution cycle. 
git checkout $FEATURE_ALIAS || git flow init start $FEATURE_ALIAS

git push -u origin HEAD
