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
    mkdocs `mkdocs gh-deploy -c -m "<commit message>" 
    ```
    - You are done !
    
## Afterward
You just work locally in your master branch, commit and push your .md and .yml files in your master branch, and using mkdocs gh-deploy to synchronize your remote gh-pages branch.


## see locally the web docs
Still in your master branch, run `mkdocs serve` and see locally your documentation with your web browser

