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

### sh文件处理

echo " " >> .gitignore
echo "/init.sh" >> .gitignore
echo "/public-gh-pages.sh" >> .gitignore
echo "/project-name.sh" >> .gitignore

### 替换工程名

grep "sequelize" -rl ./config.toml | xargs sed -i "s/sequelize/$1/g"
grep "sequelize" -rl ./content/README.md | xargs sed -i "s/sequelize/$1/g"
grep "sequelize" -rl ./README.md | xargs sed -i "s/sequelize/$1/g"

### content

cat content/README.md > content/_index.md
sed -i '4,999d' menu/index.md

### README.md

sed -i '20,999d' README.md

### git init remote

git init
repositoryDir="git@github.com:eiuapp/${projectName}.git"
git remote add origin ${repositoryDir}

### 安装 submodule

git submodule add https://github.com/alex-shpak/hugo-book themes/book

### git push

git add -A
git commit -m "init"
git push origin master

### 创建并使用 gh-pages

mkdir -p public/
hugo
bash ./public-gh-pages.sh ${repositoryDir}

### 创建 github actions 环境

cd ~/tom/idrsas/tom/tom-eiuapp/github-actions/
ssh-keygen -t rsa -f ${projectName} -q -N ""

