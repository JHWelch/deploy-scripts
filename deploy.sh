#!/bin/bash
AVAILABLE_SITES="choremanager, jordanwelch.com"
site=$1
dir_path="$(dirname $(realpath $0))"

echo "Updating deploy-scripts"
cd $dir_path
git pull

case $site in
    "choremanager")
        echo "Deploying ChoreManager"
        /bin/bash $dir_path/ChoreManager/deploy.sh
        ;;
    "jordanwelch.com")
        echo "Deploying jordanwelch.com"
        /bin/bash $dir_path/jordanwelch.com/deploy.sh
        ;;
    *)
        echo "usage: deploy.sh site"
        echo "Available sites: $AVAILABLE_SITES"
esac
