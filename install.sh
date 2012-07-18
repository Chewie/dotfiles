#! /bin/zsh

## Warning: this script assumes that you are using zsh and running it from
## its directory (ie : ./install.sh)
## This is a quick and dirty script, don't expect anything fancy from it

setopt glob_dots
ln -s -t $HOME *~.git
