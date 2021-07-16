export PATH="/home/dploy/.nvm/versions/node/v14.16.0/bin/:$PATH"
BASE_DIR="/var/www/ChoreManager/"
echo "Pulling repository into new directory"
dir_path="$(dirname $(realpath $0))"
deploy_path="$(source $dir_path/../common/atomic-git-pull.sh $BASE_DIR git@github.com:JHWelch/ChoreManager.git)"
cd $deploy_path
echo "Copying .env from current"
cp ../../current/.env .
echo "Installing composer dependencies."
composer install --no-dev
echo "Migrating database."
php artisan migrate --force
echo "Installing yarn dependencies."
yarn install
echo "Building yarn production."
yarn run production
source $dir_path/../common/atomic-link-current.sh $deploy_path