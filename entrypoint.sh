#!/bin/sh

# Exit automatically when an error happens
set -e
# Change the directory to the one that we need
cd $1

# If the access token is not set, notify and return
if [ -z "$ACCESS_TOKEN" ]; then
    echo "ERROR: There is no ACCESS_TOKEN set for pushing the branch"
    exit 1
fi

# Initialize the GitHub repository
git init
# Set the name and email to GitHub Actions
git config user.name "$4"
git config user.email "$5"

# If there is nothing to commit, notify and return
if [ -z "$(git status --porcelain)" ]; then
    echo "There are no files to commit"
    exit 0
fi

# Otherwise, add all of the files
git add .
# Create the commit
git commit -m "$3"
# Force push into the repo
git push --force "https://${ACCESS_TOKEN}@github.com/${GITHUB_REPOSITORY}.git" "master:$2"

# Finally, as a cleanup remove the git folder
rm -fr .git
