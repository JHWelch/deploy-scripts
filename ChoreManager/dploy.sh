export PATH="/home/dploy/.nvm/versions/node/v14.16.0/bin/:$PATH"
BASE_DIR="/var/www/ChoreManager/"

echo "-------------------------------------"
echo "Pulling repository into new directory"
echo "-------------------------------------"
dir_path="$(dirname $(realpath $0))"
deploy_path="$(source $dir_path/../common/atomic-git-pull.sh $BASE_DIR git@github.com:JHWelch/ChoreManager.git)"
cd $deploy_path

echo "-------------------------"
echo "Link .env"
echo "-------------------------"
ln -sf $BASE_DIR/.env .

echo "-------------------------"
echo "Link storage folder"
echo "-------------------------"
rm -rf ./storage
ln -sfn $BASE_DIR/storage ./storage

echo "---------------------------------"
echo "Installing composer dependencies."
echo "---------------------------------"
composer install --no-dev

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
source $dir_path/../common/atomic-link-current.sh $deploy_path