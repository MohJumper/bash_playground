#!/bin/bash 

echo type local branch to delete: 
read branchDelete

git branch -d $branchDelete

echo deleted local branch 

git push origin --delete $branchDelete

git pull 

