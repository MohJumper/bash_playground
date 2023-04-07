#!/bin/bash

git checkout main

git pull
git add .

echo type your comments here

read comments
git commit -m "$comments "

echo type your branch name

read branchname

git checkout -b $branchname

git push origin $branchname

git chechout main

echo Back to main ... go to GitHub for PR
