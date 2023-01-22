#! /bin/sh

# Symlink to home via stow
stow ctags
stow git
stow hg
stow tmux
stow vim
stow X
stow zsh
stow readline

# stuff in xdg must be symlinked to XDG_CONFIG_HOME (defaults to ~/.config)
stow -t ${XDG_CONFIG_HOME:-~/.config} xdg
