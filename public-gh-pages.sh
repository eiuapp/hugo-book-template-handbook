#!/bin/bash

# repositoryDir=`git remote -v | awk '{print $2}' | head -n 1 `
# hugo
repositoryDir=$1
echo "in public, the repository is: ${repositoryDir}"

cd public/
git init
git remote add origin ${repositoryDir}
git remote -v
git checkout -b gh-pages
git status
git add -A
git commit -m "init"
git push origin gh-pages

echo "gh-pages branch is ok!"