#!/bin/bash

# This script is based on:
# http://www.steveklabnik.com/automatically_update_github_pages_with_travis_example/

# Note that the static files branch (specified by STATIC_BRANCH) must exist
# at the time this script is run. You may want to create an orphan branch
# using the instructions at http://stackoverflow.com/a/4288660/2422398.

set -o errexit -o nounset

export STATIC_BRANCH="gh-pages"
export REPO="toolness/jess-portfolio"
export STATIC_DIR="public"
export BASE_URL="https://toolness.github.io/jess-portfolio/"

rev=$(git rev-parse --short HEAD)

rm -rf $STATIC_DIR

hugo --baseURL $BASE_URL

cd $STATIC_DIR

git init

git remote add upstream "https://github.com/$REPO.git"
git fetch upstream
git reset upstream/$STATIC_BRANCH

touch .nojekyll
touch .

git add -A .
git commit -m "rebuild static site at ${rev}"
git push -q upstream HEAD:$STATIC_BRANCH

echo "Success! You can view your site at:"
echo $BASE_URL
