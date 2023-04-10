#!/bin/bash

# check for uncommit changes
if [[ $(git status --porcelain) ]];
	then
echo "There are uncommitted changes. will commit them now ... "
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
# fix bug ... it will accept a space at the end 
while true; do
    read -p "Enter branch name: " branchname
    if [[ ! $branchname =~ ^[a-zA-Z0-9_-]+[a-zA-Z]+$ ]]; then
		echo "start with letters CAP/lower cases can have numbers, hyphens, or underscores 
			and must end with a letter(s) no space."
	else
        break
    fi
done


git checkout -b $branchname
if [[ $?-eq0 ]];
	then
git push origin $branchname
else
	echo "Error in creating branchname"
 exit 1
fi 
git checkout main
echo you are on main ... go to GitHub for PR
echo ---------------------------------------
echo if you completed PR remember to git pull 
