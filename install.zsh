#! /bin/zsh

## Warning: this script assumes that you are using zsh and running it from
## its directory (ie : ./install.sh)
## This is a quick and dirty script, don't expect anything fancy from it

setopt extendedglob
setopt glob_dots

git submodule init
git submodule update
cd $HOME

ln -s $OLDPWD/*~*.git~*install.sh .
