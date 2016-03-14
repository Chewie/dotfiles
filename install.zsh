#! /bin/sh

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
