# python_project_planer
Repository created to quickly set up a new python project.

To set up the project clone this repo to wanted new repo.
then: 
mv python_project_planer/* . 
rm -rf .git 
mv py_project project_name 
mv py_project.toml project_name.toml
pip3 install -r project_name/requirements.txt 

make README.md either by emacs and writing or by echo "project_name" > README.md

The files should now all be in place. Time to add it to git. 
git init 
pre-commit install
git add .
git commit -m "starting a new project" 
git remote add repository/path.git
git push

All should now be ready to use and some basic documentation and file structure should be in place to build on. 

## details on structure 

uses the github .gitignore python file for simple gitignore setup 

The folder contained at the top level would be:
data - should contain raw data for the project no files from here added to git as the data/ name added to .gitignore
results - should contain all results and outputs including text, tables and plots in subfolders. Will not be added to the git as results/ added to .gitignore
scripts - should contain all scripts not related directly to the project application, eg ploting scripts or analysis scripts not to be included in final output. Everything put here should be backed up to git.
py-project - the actual project folder should absolutely be backed up to git. Rename this to relevant project. This dir also includes a number of files and directories that needs adding to at later points but gives a nice structure to the project. 

structure is based on suggestions here https://docs.python-guide.org/writing/structure/

Includes some stuff for setting up and running git hooks with pre-compile, black and flake8. Also introduces a number of pre-compiler tests namly:
- importanize
- check-added-large-file - makes sure no files larger than git allows are added 
- check-case-conflict - Check for files with names that would conflict on a case-insensitive filesystem like MacOS HFS+ or Windows FAT
- check-merge-conflict - Check for files that contain merge conflict strings.
- debug-statements - Check for debugger imports and py37+ breakpoint() calls in python source
- check-json - Attempts to load all json files to verify syntax.
- check-xml - Attempts to load all xml files to verify syntax.
- check-yaml - Attempts to load all yaml files to verify syntax.
- name-tests-test - Assert that files in tests/ end in _test.py.

All of these things are controlled in the .pre-commit-config.yaml file and can be changed there at will.

Some run instructions for black and flake are also included in the py_project.tmol file.
