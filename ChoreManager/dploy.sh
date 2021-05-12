export PATH="/home/dploy/.nvm/versions/node/v14.16.0/bin/:$PATH"
cd /var/www/ChoreManager/
echo "Pulling repository."
git pull
echo "Installing composer dependencies."
composer install --no-dev
echo "Migrating database."
php artisan migrate --force
echo "Installing yarn dependencies."
yarn install
echo "Building yarn production."
yarn run production