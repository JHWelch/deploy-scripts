#!/bin/bash
PROD_DIR="/var/www/choremanager"
DEMO_DIR="/var/www/cm-demo"

echo "---------------------------"
echo "Deploying to Production app"
echo "---------------------------"
dir_path="$(dirname $(realpath $0))"
/bin/bash $dir_path/../common/deploy-laravel.sh $PROD_DIR git@github.com:JHWelch/ChoreManager.git

echo "---------------------"
echo "Deploying to Demo app"
echo "---------------------"
dir_path="$(dirname $(realpath $0))"
/bin/bash $dir_path/../common/deploy-laravel.sh $DEMO_DIR git@github.com:JHWelch/ChoreManager.git
