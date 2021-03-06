#!/usr/bin/env bash

#### New strategy that works if rights of the GH_TOKEN are properly set up !
SCRIPT_PATH="$(cd "$(dirname "$0")" && pwd -P)"
sudo pip install mkdocs
mkdir mkdocs_build
cd mkdocs_build
# Initialize gh-pages checkout
DATE=`date`
git clone https://github.com/drosofff/docs.git
cd docs
git config credential.helper "store --file=.git/credentials"
echo "https://${GH_TOKEN}:@github.com" > .git/credentials
mkdocs gh-deploy --clean -m "gh-deployed by travis $DATE"
cd $SCRIPT_PATH

### Previous Marius's strategy
# We start by building and deploying the documentation
#SCRIPT_PATH="$(cd "$(dirname "$0")" && pwd -P)"
#DATE=`date`
#sudo pip install mkdocs
# Initialize gh-pages checkout
#mkdir -p docs/html
#(
#cd docs/html
#git init
#git config user.name "${GH_USER_NAME}"
#git config user.email "${GH_USER_EMAIL}"
#git remote add upstream "https://$GH_TOKEN@${GH_REF}"
#git fetch upstream
#git reset upstream/gh-pages
#)

#cd $SCRIPT_PATH
#mkdocs build --clean --site-dir docs/html

# Commit and push the documentation to gh-pages
#(
#cd docs/html
#touch .
#git add -A .
#git commit -m "Rebuild pages at ${rev} $DATE"
#git push -q upstream HEAD:gh-pages
#)
#cd $SCRIPT_PATH
