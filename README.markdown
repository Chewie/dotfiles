About
=====

This is the repository containing my dotfiles, most notably my vim
configuration.

Installation
============

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


Vim plugins
===========

My vim setup uses the following plugins :

* [CtrlP](https://github.com/kien/ctrlp.vim/) : fuzzy file finder
* [Fugitive](https://github.com/tpope/vim-fugitive) : git wrapper
* [NERDCommenter](https://github.com/scrooloose/nerdcommenter) : quickly
  comment/decomment code
* [NERDTree](https://github.com/scrooloose/nerdtree) : filesystem explorer
* [Powerline](https://github.com/Lokaltog/vim-powerline) : fancy status line
* [Sparkup](https://github.com/rstacruz/sparkup) : quick HTML creation
* [Surround](https://github.com/tpope/vim-surround) : command related to
  surroundings
* [Syntastic](https://github.com/scrooloose/syntastic) : syntax checking on the
  fly
* [Tagbar](https://github.com/majutsushi/tagbar) : tag browser
* [UltiSnips](https://github.com/SirVer/ultisnips) : snippets engine
* [Unimpaired](https://github.com/tpope/vim-unimpaired) : mappings for commands
  that come in pair
* [Repeat](https://github.com/tpope/vim-repeat) : repeat Surround and
  Unimpaired commands with .
* [Bundler](https://github.com/tpope/vim-bundler) : bundler integration in vim
* [Rails](https://github.com/tpope/vim-fugitive) : rails integration in vim
* [Rainbow parentheses](https://github.com/kien/rainbow\_parentheses.vim)
  Parentheses coloration
* [Easymotion](https://github.com/Lokaltog/vim-easymotion) Visual motion
  selector
