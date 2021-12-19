#!/usr/bin/env bash

set -x
set -e

commitSha=$(git rev-parse --short HEAD)
commitMessage=$(git log --oneline -n 1)

cd $(dirname $0)

yarn build

cd ./prebuilt

git pull

cp -r ../dist/* .

cp index.html 404.html

git add .
git commit -am "${commitMessage}"

git push

cd -
