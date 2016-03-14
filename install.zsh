#! /bin/sh


# Set options related to globbing, for the last line
setopt extendedglob
setopt glob_dots

# Synchronize the git submodules
git submodule init
git submodule update

# Symlink to home via stow
stow ctags
stow git
stow hg
stow tmux
stow vim
stow X
stow zsh
