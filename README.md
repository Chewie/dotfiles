About
=====

This is the repository containing my dotfiles, most notably my vim
configuration.

Installation
============

To install the dotfiles, run `./install.sh` in the root of the repository.
The install script assumes you're not running it from another directory, it
won't work if you do so!

The install script makes simlink from the repository to your home directory
using stow, the purpose being to ease updating. That means you musn't remove
the repository, or you'll have dangling simlinks! If you don't want that
behaviour, copy the files yourself from the repository.

Vim plugins
===========

My vim setup uses the following plugins :

* [Vim-plug](https://github.com/junegunn/vim-plug): Plugin manager

* [CtrlP](https://github.com/kien/ctrlp.vim/) : fuzzy file finder
* [Fugitive](https://github.com/tpope/vim-fugitive) : git wrapper
* [NERDCommenter](https://github.com/scrooloose/nerdcommenter) : quickly
  comment/uncomment code
* [Vinegar](https://github.com/tpope/vim-vinegar) : Directory brwoser done right
* [Airline](https://github.com/vim-airline/vim-airline) : fancy status line
* [Airline themes](https://github.com/vim-airline/vim-airline-themes) : A collection of themes for Airline
* [Surround](https://github.com/tpope/vim-surround) : command related to
  surroundings
* [Syntastic](https://github.com/scrooloose/syntastic) : syntax checking on the
  fly
* [Tagbar](https://github.com/majutsushi/tagbar) : tag browser
* [UltiSnips](https://github.com/SirVer/ultisnips) : snippets engine
* [Vim snippets](https://github.com/honza/vim-snippets) : A collection of default snippets
* [Unimpaired](https://github.com/tpope/vim-unimpaired) : mappings for commands
  that come in pair
* [Repeat](https://github.com/tpope/vim-repeat) : repeat Surround and
  Unimpaired commands with .
* [Rainbow](https://github.com/luochen1990/rainbow) : Parentheses coloration
* [Jellybeans](https://github.com/nanotech/jellybeans.vim) : A dark, soothing colorscheme
* [Pandoc syntax](https://github.com/vim-pandoc/vim-pandoc-syntax) : Syntax highlighting for pandoc
* [Pandoc](https://github.com/vim-pandoc/vim-pandoc) : General pandoc goodness
* [Ansible-vim](https://github.com/pearofducks/ansible-vim) : A better ftplugin than yaml for ansible playbooks
* [Ack](https://github.com/mileszs/ack.vim) : Ack integration
