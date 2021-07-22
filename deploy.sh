#!/bin/bash
###############################################################
# This file is the only file that will not update automatically
# on deployment. If this file is updated, a manual `git pull`
# must be run on the server.
##############################################################
dir_path="$(dirname $(realpath $0))"

echo "-----------------------"
echo "Updating deploy-scripts"
echo "-----------------------"
cd $dir_path
git pull

/bin/bash $dir_path/deploy-step-2.sh $1
