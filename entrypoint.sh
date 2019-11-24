#!/bin/sh

# Exit automatically when an error happens
set -e
# Change the directory to the one that we need
cd $2

# If the access token is not set, notify and return
if [ -z "$1" ]; then
    echo "ERROR: There is no token set for pushing the branch"
    exit 1
fi

# Initialize the GitHub repository
git init
# Set the name and email to GitHub Actions
git config user.name "$5"
git config user.email "$6"

# If there is nothing to commit, notify and return
if [ -z "$(git status --porcelain)" ]; then
    echo "There are no files to commit"
    exit 0
fi

# Otherwise, add all of the files
git add .
# Create the commit
git commit -m "$4"
# Force push into the repo
git push --force "https://$1@github.com/${GITHUB_REPOSITORY}.git" "master:$3"

# Finally, as a cleanup remove the git folder
rm -fr .git
