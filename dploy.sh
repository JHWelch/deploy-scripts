#!/bin/bash
AVAILABLE_SITES="choremanager, jordanwelch.com"
site=$1
dir_oath="$(dirname $(realpath $0))"

case $site in 
    "choremanager") 
        echo "Deploying ChoreManager"
        source $dir_oath/ChoreManager/dploy.sh
        ;;
    "jordanwelch.com") 
        echo "Deploying jordanwelch.com"
        source $dir_oath/jordanwelch.com/dploy.sh
        ;;
    *)
        echo "usage: dploy.sh site"
        echo "Available sites: $AVAILABLE_SITES"
esac
