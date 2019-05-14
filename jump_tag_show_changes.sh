#!/bin/bash

# jump to the argument git tag and show the last commit's changes in the working directory
echo "This will hard reset all changes."
if [ -z ${1+x} ]; then echo "Specify the tag to checkout, one of:" && git tag -l; exit 1; else echo "Image version is set to '$1'"; fi

git add -A && git reset --hard && git checkout $1  && git reset HEAD~1