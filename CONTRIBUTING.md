# Simple guide for new github contributors

## Prerequistes

Make a github user account and fork this repository https://github.com/hungrymonkey/JavaProject.git

```git clone http://github.com/<yourusename>/JavaProject.git

git remote add upstream https://github.com/hungrymonkey/JavaProject.git

git fetch --all
```

## Contributing

1. `git checkout -b <new branch>`
2. Make some modifications 

3. `git add <you the files you want to stage>`

4. Add a commit message `git commit`
  - If needed to reference an issue, write `Issue #<issue number>` on the bottom
  - If needed to close an issue, write `Fixes #<issue number>` on the bottom
     + close
     + closes
     + resolves
     + resolved
     + fixed

5. Squash commits `git rebase -i <hash or HEAD~2>`  
   - Use `git log` to find the hash number
   - `HEAD~#` is the last number of commits
   - The UI is interactive and help guide you to squashing your commits

6. `git fetch --all` Grab the master branch

7. Attempt to merge the master branch `git merge upstream/master`

8. `git push` Push it to your git account
   - If it doesn't exist, git will complain and print out a command to run
   - The command is `git push --set-upstream origin <branch_name>`
 
9. Make a pull request on github

For maintainers


## Keeping up with the master branch
```
git checkout master
git fetch --all
git merge upstream/master
git push
```


## Common git commands

* Change branches `git checkout <branch name>`
* View branch `git branch`
* View all branches `git branch -a`
* Delete branches `git branch -d <branch name>`
* View log `git log`
* View commit `git status`
* Undo Staging `git reset`


## Notes 


## TODO
This guide is not comprehensive. I need to add rebasing.
Maintainer guide
