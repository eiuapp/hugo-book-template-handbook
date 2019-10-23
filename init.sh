#!/bin/bash

### 工程名 

projectName="$1-handbook"
echo "project name is: ${projectName}"

### 删除 .git 等暂时不需要的文件或文件夹

rm -rf .git/
rm -rf resources/
rm -rf themes/book/
rm .travis.yml
rm .gitmodules

### 安装 submodule

git submodule add https://github.com/alex-shpak/hugo-book themes/book

### sh文件处理

echo "init.sh" >> .gitignore
echo "public-gh-pages.sh" >> .gitignore

### 替换工程名

grep "sequelize" -rl ./config.toml | xargs sed -i "s/sequelize/$1/g"
grep "sequelize" -rl ./content/README.md | xargs sed -i "s/sequelize/$1/g"
grep "sequelize" -rl ./README.md | xargs sed -i "s/sequelize/$1/g"

### git init remote push

git init
repositoryDir="git@github.com:eiuapp/${projectName}.git"
git remote add origin ${repositoryDir}
git add -A
git commit -m "init"
git push origin master

### 创建并使用 gh-pages

mkdir -p public/
bash ./public-gh-pages.sh

### 创建 github actions 环境

cd ~/tom/idrsas/tom/tom-eiuapp/github-actions/
ssh-keygen -t rsa -f ${projectName} -q -N ""

