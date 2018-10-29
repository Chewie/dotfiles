#! /bin/sh

# Symlink to home via stow
stow ctags
stow git
stow hg
stow tmux
stow vim
stow X
stow zsh

# Awesome needs to be symlinked to ~/.config/awesome
mkdir -p ~/.config/awesome
stow -t ~/.config/awesome awesome
