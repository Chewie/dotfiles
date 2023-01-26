#! /bin/bash

# I can't be arsed to summon the cthulhu pattern to be POSIX, so sue me.
shopt -s dotglob

# stuff in home is not XDG compliant, must be symlinked to $HOME (boooo!)
ln -srfv home/* $HOME/

# stuff in xdg must be symlinked to XDG_CONFIG_HOME (defaults to ~/.config)
ln -srfv xdg/* ${XDG_CONFIG_HOME:-~/.config}/
