#!/bin/bash
AVAILABLE_SITES="choremanager, jordanwelch.com"
site=$1
dir_path="$(dirname $(realpath $0))"

case $site in 
    "choremanager") 
        echo "Deploying ChoreManager"
        source $dir_path/ChoreManager/dploy.sh
        ;;
    "jordanwelch.com") 
        echo "Deploying jordanwelch.com"
        source $dir_path/jordanwelch.com/dploy.sh
        ;;
    *)
        echo "usage: dploy.sh site"
        echo "Available sites: $AVAILABLE_SITES"
esac
