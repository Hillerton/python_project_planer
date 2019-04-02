#!/bin/bash

echo "Give name for python tool"
read TOOL
echo "Give path to repo to sync with"
read path

echo "Here we go..."


#move all the needed files in to the current dir and remove old git files
rm -rf python_project_planer/.git/
mv python_project_planer/* .
rm -rf python_project_planer/

mv py_project $TOOL
mv py_project.toml $TOOL.toml

echo "#" $TOOL > README.md

pip3 install -r $TOOL/requirements.txt

#initialise empty git
git init

pre-commit install 

#add remote location 
git remote add $path

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

