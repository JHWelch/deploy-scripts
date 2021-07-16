#!/bin/bash
export PATH="/home/dploy/.nvm/versions/node/v14.16.0/bin/:$PATH"
cd /var/www/jordanwelch.com/
echo "Pulling repository."
git pull
echo "Installing npm dependencies."
npm install
echo "Building npm production."
npm run prod
