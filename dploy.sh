#!/bin/bash
AVAILABLE_SITES="choremanager, jordanwelch.com"
site=$1
dir_path="$(dirname $(realpath $0))"

echo "Updating dploy-scripts"
cd $dir_path
git pull

case $site in 
    "choremanager") 
        echo "Deploying ChoreManager"
        /bin/bash $dir_path/ChoreManager/dploy.sh
        ;;
    "jordanwelch.com") 
        echo "Deploying jordanwelch.com"
        /bin/bash $dir_path/jordanwelch.com/dploy.sh
        ;;
    *)
        echo "usage: dploy.sh site"
        echo "Available sites: $AVAILABLE_SITES"
esac
