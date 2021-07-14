#!/bin/bash
AVAILABLE_SITES="choremanager, jordanwelch.com"
SITE=$1

echo $SITE

case $SITE in 
    "choremanager") 
        echo "Deploying ChoreManager"
        source ./ChoreManager/dploy.sh
        ;;
    "jordanwelch.com") 
        echo "Deploying jordanwelch.com"
        source ./jordanwelch.com/dploy.sh
        ;;
    *)
        echo "usage: dploy.sh site"
        echo "Available sites: $AVAILABLE_SITES"
esac
