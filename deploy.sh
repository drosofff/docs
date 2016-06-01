#!/usr/bin/env bash

# We start by building and deploying the documentation
SCRIPT_PATH="$(cd "$(dirname "$0")" && pwd -P)"
sudo pip install mkdocs
mkdir mkdocs_build
cd mkdocs_build
# Initialize gh-pages checkout
# mkdir -p docs/html

#(
#    cd docs/html
#    git init
#    git config user.name "${GH_USER_NAME}"
#    git config user.email "${GH_USER_EMAIL}"
#    git remote add upstream "https://$GH_TOKEN@${GH_REF}"
#    git fetch upstream
#    git reset upstream/gh-pages
#)
git clone https://github.com/drosofff/docs.git
cd docs
git config credential.helper "store --file=.git/credentials"
echo "https://${GH_TOKEN}:@github.com" > .git/credentials
mkdocs gh-deploy --clean -m "gh-deployed by travis"


# Commit and push the documentation to gh-pages
#(
#    cd docs/html
#    touch .
#    git add -A .
#    git commit -m "Rebuild pages at ${rev}"
#    git push -q upstream HEAD:gh-pages
#)
cd $SCRIPT_PATH
