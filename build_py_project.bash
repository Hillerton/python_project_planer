#!/bin/bash

# https://gist.github.com/robwierzbowski/5430952/
# Create and push to a new github repo from the command line.  
# Grabs sensible defaults from the containing folder and `.gitconfig`.  
# Refinements welcome.

# Gather constant vars
CURRENTDIR=${PWD##*/}
GITHUBUSER=$(git config github.user)

# Get user input
echo "Name for New repo"
read REPONAME:-
echo "Git Username"
read USER
echo "Repo Description:"
each DESCRIPTION
echo "Give name for python tool"
read TOOL

echo "Here we go..."


#move all the needed files in to the current dir and remove old git files
rm -rf python_project_planer/.git/
mv python_project_planer/* .
rm -rf python_project_planer/

mv py_project $TOOL
mv py_project.toml $TOOL.toml

echo "#" $TOOL > README.md

pip3 install -r $TOOL/requirements.txt

# Curl some json to the github API oh damn we so fancy
curl -u ${USER:-${GITHUBUSER}} https://api.github.com/user/repos -d "{\"name\": \"${REPONAME:-${CURRENTDIR}}\", \"description\": \"${DESCRIPTION}\", \"private\": false, \"has_issues\": true, \"has_downloads\": true, \"has_wiki\": false}"

# Set the freshly created repo to the origin and push
# You'll need to have added your public key to your github account
git remote set-url origin git@github.com:${USER:-${GITHUBUSER}}/${REPONAME:-${CURRENTDIR}}.git
git push --set-upstream origin master

#add file structure to the new git 
git add .
git commit -m "first commit"
git push

#add the pre-commit hooks to the git
pre-commit install

#add these hooks to repository 
git add . 
git commit -m "added pre-commit hooks"
git push

