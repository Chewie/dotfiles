This is the repository containing my dotfiles, most notably my vim
configuration.

Installation
------------

This repository uses git submodules to track vim plugins.
If you don't know what git submodules are, you can find information
[here](http://git-scm.com/book/en/Git-Tools-Submodules).

To install the dotfiles, run `./install.zsh` in the root of the repository.
The install script assumes you're not running it from another directory, it
won't work if you do so!
The script initiates the submodules in case you haven't cloned the repository
with the --recursive option, then links the dotfiles.

The install script makes simlink from the repository to your home directory,
the purpose being to ease updating. That means you musn't remove the
repository, or you'll have dangling simlinks!
If you don't want that behaviour, copy the files yourself from the
repository, but don't forget to run
`git submodule init && git submodule update` first!
