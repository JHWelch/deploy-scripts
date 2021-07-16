#!/bin/bash
export PATH="/home/dploy/.nvm/versions/node/v14.16.0/bin/:$PATH"
BASE_DIR="/var/www/choremanager/"

echo "-------------------------------------"
echo "Pulling repository into new directory"
echo "-------------------------------------"
dir_path="$(dirname $(realpath $0))"
deploy_path="$(/bin/bash $dir_path/../common/atomic-git-pull.sh $BASE_DIR git@github.com:JHWelch/ChoreManager.git)"
cd $deploy_path

echo "-------------------------"
echo "Link .env"
echo "-------------------------"
ln -sf $BASE_DIR/.env .

echo "---------------------------------"
echo "Installing composer dependencies."
echo "---------------------------------"
composer install --no-dev

echo "-------------------------"
echo "Link storage folder"
echo "-------------------------"
rm -rf ./storage
ln -sfn $BASE_DIR/storage ./storage
php artisan storage:link

echo "-------------------"
echo "Migrating database."
echo "-------------------"
php artisan migrate --force

echo "-----------------------------"
echo "Installing yarn dependencies."
echo "-----------------------------"
yarn install

echo "-------------------------"
echo "Building yarn production."
echo "-------------------------"
yarn run production

echo "--------------------------------------"
echo "Linking current folder to new release."
echo "--------------------------------------"
/bin/bash $dir_path/../common/atomic-link-current.sh $deploy_path