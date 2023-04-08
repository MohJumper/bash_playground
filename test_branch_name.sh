#!/bin/bash 

while true; do
    read -p "Enter branch name: " branchname
    if [[ ! $branchname =~ ^[a-zA-Z0-9_-]+[a-zA-Z]$ ]]; then
        echo "Invalid branch name. Please use only letters, numbers, hyphens, or underscores and end with a letter."
    else
        break
    fi
done

