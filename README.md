About
=====

This is the repository containing my dotfiles, most notably my vim
configuration.

Installation
============

To install the dotfiles, run `./install.sh` in the root of the repository.
The install script assumes you're not running it from another directory, it
won't work if you do so!

The install script makes symlinks from the repository to your home directory
using `stow`, the purpose being to ease updating. That means you musn't remove
the repository, or you'll have dangling symlinks! If you don't want that
behaviour, copy the files yourself from the repository.
