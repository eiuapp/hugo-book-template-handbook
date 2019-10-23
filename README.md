# 学习笔记

![](https://raw.githubusercontent.com/eiuapp/img/master/img/hugo-logo-black.png?token=AJOUPL5RQABN75RVK4HTESK5CSI5M)

### 内容介绍

关于 sequelize , 主要包括一些学习笔记

### 访问方式

请点击下面的链接阅读:

- [在线阅读](https://eiuapp.github.io/sequelize-handbook/)：hugo格式，界面清爽。
- [@github](https://github.com/eiuapp/sequelize-handbook/)：源码托管于github，如有谬误或需讨论，请提issue，欢迎提交PR


### 版权申明

本笔记内容可以任意转载，但请注明来源并提供链接，**请勿用于商业出版**。


# (使用时请删除)如何使用 本仓库 作为 hugo-book 的 template

## 方法1 执行 init.sh

先要去 init.sh 中修改 `sequelize-handbook` 为 `工程名`，然后运行 `bash sh/init.sh`

## 方法2 step by step

### 工程名 

```bash
projectName="$1-handbook"
echo "project name is: ${projectName}"
```

### 删除 .git 等暂时不需要的文件或文件夹

```bash
rm -rf .git/
rm -rf resources/
rm -rf themes/book/
rm .travis.yml
rm .gitmodules
```

### 安装 submodule

```bash
git submodule add https://github.com/alex-shpak/hugo-book themes/book
```

### sh文件处理

```bash
echo "init.sh" >> .gitignore
echo "public-gh-pages.sh" >> .gitignore
```

### 替换工程名

```bash
grep "sequelize" -rl ./config.toml | xargs sed -i "s/sequelize/$1/g"
grep "sequelize" -rl ./content/README.md | xargs sed -i "s/sequelize/$1/g"
grep "sequelize" -rl ./README.md | xargs sed -i "s/sequelize/$1/g"
```

### git init remote push

```bash
git init
repositoryDir="git@github.com:eiuapp/${projectName}.git"
git remote add origin ${repositoryDir}
git add -A
git commit -m "init"
git push origin master
```

### 创建并使用 gh-pages

```bash
mkdir -p public/
bash ./public-gh-pages.sh
```

### 创建 github actions 环境

参考[这里](https://github.com/eiuapp/github-handbook/blob/master/content/github/actions/hugo-github-actions.md)

创建 

```bash
cd ~/tom/idrsas/tom/tom-eiuapp/github-actions/
ssh-keygen -t rsa -f sequelize-handbook -q -N ""
```


