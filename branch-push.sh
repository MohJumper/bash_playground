#!/bin/bash

# check for uncommit changes
if [[ $(git status --porcelain) ]];
  then
echo "There are uncommitted changes. Please commit or stash them before switching to the main branch."
git pull
git add .
echo type your comments here
read comments
git commit -m "$comments "

else

	# making sure you are at main
	git checkout main
	# pull for possible recent change in remote repo
	git pull
	git add .

	echo type your comments here
	read comments
	git commit -m "$comments "

	exit 1
fi
# making sure you are at main
#git checkout main
# pull for possible recent change in remote repo
#git pull
#git add .

#echo type your comments here
#read comments
#git commit -m "$comments "

echo type your branch name
read branchname

if [[ !$branchname=~^[a-zA-Z0-9_-]+$ ]];
	then
echo "Invalid branch name. Please use only letters, numbers, hyphens, or underscores."
 exit 1
fi

git checkout -b $branchname
if [[ $?-eq0 ]];
	then
git push origin $branchname
else
	echo "Error in creating branchname"
 exit 1
fi 
git chechout main

echo Back to main ... go to GitHub for PR
