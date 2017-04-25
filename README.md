# CS 368 (C++) Spring 2017 Git/GitHub session

This is a test repository for the CS 368 Git/GitHub session.
To clone this repo, run:

    $ git clone git@github.com:varuncnaik/gitsession-sp17.git

## Basic Git Commands

These are the commands we ran during the session. Feel free to run
them yourself to create a new local repo, and push it to GitHub. I
have added some comments for clarity.

Firstly, we create a local repository ("local repo" for short):

    $ mkdir <reponame>/
    $ cd <reponame>/
    $ git init
    $ git status

Next, we create our first commit:

    $ vim hello.cpp
    $ g++ -std=c++11 hello.cpp
    $ ./a.out
    $ rm a.out
    $ git commit -m "Initial commit"  # Oops
    $ git add hello.cpp
    $ git status
    $ git commit -m "Initial commit"  # Success!
    $ git status
    $ git log

Then, we create our second commit:

    $ vim hello.cpp
    $ g++ -std=c++11 hello.cpp
    $ ./a.out
    $ git status
    $ git diff
    $ git add hello.cpp
    $ git status
    $ git diff                        # Oops
    $ git diff --staged               # Success!
    $ git commit -m "Changed output message"
    $ git status
    $ git log

We want to push these local commits to a remote repository ("remote repo").
If we create an empty remote repo on GitHub, it will tell us to perform the
following commands:

    $ git remote add origin git@github.com:<username>/<reponame>.git
    $ git push origin master

Now, we can copy our code (and history) on a new machine (or even to a
different location on the same machine). We create a commit on the new machine
and push it to GitHub:

    $ git clone git@github.com:<username>/<reponame>.git
    $ cd <reponame>/
    $ git status
    $ git log
    $ vim README.md
    $ git status
    $ git add README.md
    $ git diff --staged
    $ git commit -m "Added README"
    $ git push origin master

We pull our changes onto the original machine:

    $ git pull origin master
    $ git log

Suppose we use `git add` to add a file, but we do not want the file to be
included in the next commit. We can unstage the file:

    $ git add a.out                   # Oops
    $ git status
    $ git reset HEAD -- a.out         # Fixed
    $ git status

If we want to remove the entire previous commit, we can run the following:

    $ git add a.out                   # Oops
    $ git commit -m "Bad commit"      # Double oops
    $ git log
    $ git reset HEAD~1                # Fixed!
    $ git log

## Branching

If you are working on a project alone or in a small group, it is okay for
everyone to push to the master branch. But for large groups, you may want each
member to push changes to a topic branch, and merge the topic branch into the
master branch when they are finished. Such topic branches are usually named
`username-description`. Over the lifetime of the project, each user will
probably create multiple topic branches, where each branch contains several
related changes.

During the discussion session, I was the only user writing code, but I was
pushing commits from two machines. So, in the example below, I write `lab` and
`macbook` in the branch names instead of two usernames.

On the first machine (`lab`), we create a branch, perform a commit, and push
the branch:

    $ git log
    $ git branch
    $ git checkout -b lab-helper-function
    $ git branch
    $ git status
    $ vim hello.cpp
    $ g++ -std=c++11 hello.cpp
    $ ./a.out
    $ git status
    $ git add hello.cpp
    $ git diff --staged
    $ git commit -m "Created helper function"
    $ git push origin lab-helper-function

On the second machine (`macbook`), we do something similar:

    $ git log
    $ git branch
    $ git checkout -b macbook-interactive-prompt
    $ git branch
    $ git status
    $ vim hello.cpp
    $ g++ -std=c++11 hello.cpp
    $ ./a.out
    $ git status
    $ git add hello.cpp
    $ git diff --staged
    $ git commit -m "Interactive prompt for name"
    $ git push origin macbook-interactive-prompt

Now, we look at the state of the different branches on each machine, and also
on GitHub. The local repository on the `lab` machine has two branches master
and lab-helper-function. The local repository on the `macbook` machine has two
branches master and macbook-interactive-prompt. The remote repository on GitHub
has all three branches master, lab-helper-function, and
macbook-interactive-prompt.

On the `lab` machine, we merge the lab-helper-function branch into master, and
then push the updated master branch:

    $ git log
    $ git branch
    $ git checkout master
    $ git pull origin master          # Nothing to pull
    $ git branch
    $ git merge lab-helper-function
    $ git status
    $ git log
    $ git push origin master

On the `macbook` machine, we merge the macbook-interactive-prompt branch into
master. We have to resolve a merge conflict. Then, we push the updated master
branch:

    $ git log
    $ git branch
    $ git checkout master
    $ git pull origin master          # Pull changes
    $ git branch
    $ git merge macbook-interactive-prompt
    $ git status
    $ vim hello.cpp                   # Fix merge conflict
    $ g++ -std=c++11 hello.cpp
    $ ./a.out
    $ git status
    $ git add hello.cpp
    $ git status
    $ git commit
    $ git log
    $ git push origin master

## Makefiles

See the history of this repo for previous versions of the Makefile.

## More information

To learn more about git, see https://git-scm.com/book/en/v2
