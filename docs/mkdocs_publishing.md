# How to easily publish a report or documentation using mkdocs in GitHub

1. Create a new repository on your GitHub account. You can seed it with a README.txt file
- Clone this repository locally
- Locally (in the master branch):
    - create an mkdocs.yml file similar to this [file](https://github.com/ARTbio/ansible-artimed/blob/master/mkdocs.yml)
    - create a docs subdirectory where you .md markdown files will go
    - add, commit and push to the origin/master of the remote GitHub report
    - install mkdocs `pip install mkdocs`
    - And build your html remote site in your gh-branch using the command
    ```
    mkdocs gh-deploy -c -m "<commit message>" 
    ```
    - You are done !
    
## Afterward
You just work locally in your master branch, commit and push your .md and .yml files in your master branch, and using mkdocs gh-deploy to synchronize your remote gh-pages branch.


## see locally the web docs
Still in your master branch, run `mkdocs serve` and see locally your documentation with your web browser

## Automatize the doc build with travis
- Activate the Travis service for the GitHub repo
- Create a personal access token in the [personal GitHub settings](https://github.com/settings/tokens)
- **copy** this token in a safe place and before closing the window give it the *appropriate* rights in reading/writing repos or branch
- install Travis locally client using
```
sudo gem install travis -v 1.8.2 --no-rdoc --no-ri # ruby has to be installed
```
- lint the .travis.yml file wich is present at the root of the master branch of this repo using `travis lint`
- add or change the encrypted token in this file by
```
travis encrypt GH_TOKEN="<the toked created above and copied>" --add
```
This add a `secure` variable in the `env`section
see this [documentation](http://stackoverflow.com/questions/18027115/committing-via-travis-ci-failing) for more info
- testing this on an IFB instance
- copy both the valid .travis.yml and deploy.sh in the root on the master branch of the repo.

This worked for me, but of course the important part is to adapt these settings to your personal token
