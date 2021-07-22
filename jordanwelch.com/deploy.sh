#!/bin/bash
export PATH="/home/dploy/.nvm/versions/node/v14.16.0/bin/:$PATH"
cd /var/www/jordanwelch.com/

echo "-------------------"
echo "Pulling repository."
echo "-------------------"
git pull

echo "-------------------------------"
echo "Installing bundle dependencies."
echo "-------------------------------"
bundle install

echo "----------------------------"
echo "Installing npm dependencies."
echo "----------------------------"
npm install

echo "------------------------"
echo "Building npm production."
echo "------------------------"
npm run prod
