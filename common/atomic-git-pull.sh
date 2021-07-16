#!/bin/bash
base_dir=$1
repo=$2
timestamp="$(date +%s)"
release_dir="$base_dir/releases/$timestamp"
cd $base_dir
git clone $repo $release_dir 2> /dev/null
ln -s $release_dir ./current
cd $release_dir
echo "$(pwd)"
