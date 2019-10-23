#!/bin/bash

test="git@github.com:eiuapp/hugo-book-template-handbook.git"
echo "${test}" 
echo "${test##*/}" 

repositoryDir=`git remote -v | awk '{print $2}'`
echo "${repositoryDir}" 
echo "${repositoryDir##*/}" 

projectNameGit="${repositoryDir##*/}"
projectName="${projectNameGit%.*}"
echo "${projectNameGit}" 
echo "${projectName}" 