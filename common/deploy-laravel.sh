#!/bin/bash
export PATH="/home/dploy/.nvm/versions/node/v14.16.0/bin/:$PATH"
base_dir=$1
repo=$2

echo "-------------------------------------"
echo "Pulling repository into new directory"
echo "-------------------------------------"
dir_path="$(dirname $(realpath $0))"
deploy_path="$(/bin/bash $dir_path/atomic-git-pull.sh $base_dir $repo)"
cd $deploy_path

echo "-------------------------"
echo "Link .env"
echo "-------------------------"
ln -sf $base_dir/.env .

echo "---------------------------------"
echo "Installing composer dependencies."
echo "---------------------------------"
composer install --no-dev

echo "-------------------------"
echo "Link storage folder"
echo "-------------------------"
rm -rf ./storage
ln -sfn $base_dir/storage ./storage
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
