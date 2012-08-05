""""""""""""""""""""""""""""""""""""""""""""""""""
" Description:
"   This is the .vimrc file
"
" Maintainer:
"   Kévin "Chewie" Sztern
"   <chewie@deliciousmuffins.net>
"
" Complete_version:
"   You can find the complete configuration,
"   including all the plugins used, here:
"   https://bitbucket.org/chewiebeardy/configs
"
" Acknowledgements:
"   Several elements of this .vimrc come from Pierre Bourdon's config
"   You can find it here: https://bitbucket.org/delroth/configs/
"
""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""
" General parameters
""""""""""""""""""""""""""""""""""""""""""""""""""

" /!\ Comment this line if you only have the .vimrc /!\
" Load all the plugins in .vim/bundle
call pathogen#infect()

" Disable vi compatibility mode
set nocompatible

" Reload a file when it is changed from the outside
set autoread

" Write files as utf-8
set fileencoding=utf-8

" Enable filetype stuff
filetype on
filetype plugin on
filetype indent on

" Disable backups, we have source control for that
set nobackup

" Disable swapfiles too
set noswapfile

" Hide buffers instead of closing them
set hidden

""""""""""""""""""""""""""""""""""""""""""""""""""
" User interface
""""""""""""""""""""""""""""""""""""""""""""""""""

" Make backspace behave as expected
set backspace=eol,indent,start

" Set the minimal amount of lignes under and above the cursor
" Useful for keeping context when moving with j/k
set scrolloff=5

" Show current mode
set showmode

" Show command being executed
set showcmd

" Show line number
set number

" Always show status line
set laststatus=2

" Format the status line
" This status line comes from Pierre Bourdon's vimrc
set statusline=%f\ %l\|%c\ %m%=%p%%\ (%Y%R)

" Enhance command line completion
set wildmenu

" Set completion behavior, see :help wildmode for details
set wildmode=list:longest:full

" Disable bell completely
set visualbell
set t_vb=

" Color the column after textwidth, usually the 80th
if version >= 703
  set colorcolumn=+1
endif

" From Pierre Bourdon's vimrc : display tabs and EOL visually
set list
set listchars=tab:.\ ,eol:¬

" Enables syntax highlighting
syntax on

" Dark background is easier to the eye, at least for me.
set background=dark

" Feel free to switch to another colorscheme
colorscheme torte

" Allow mouse use in vim
set mouse=a

" Briefly show matching braces, parens, etc
set showmatch

" Enable line wrapping
set wrap

" Wrap on column 80
set textwidth=79

" Highlight trailing whitespaces
highlight ExtraWhitespace ctermbg=darkgreen
match ExtraWhitespace /\s\+$/

""""""""""""""""""""""""""""""""""""""""""""""""""
" Search options
""""""""""""""""""""""""""""""""""""""""""""""""""

" Ignore case on search
set ignorecase

" Ignore case unless there is an uppercase letter in the pattern
set smartcase

" Move cursor to the matched string
set incsearch

" Don't highlight matched strings
set nohlsearch

" Toggle g option by default on substition
set gdefault

""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation options
""""""""""""""""""""""""""""""""""""""""""""""""""

" The length of a tab
set tabstop=8

" Number of spaces in a 'fake' tab
set softtabstop=2

" The number of spaces inserted/removed when using <, >, or =
set shiftwidth=2

" Don't use spaces for tabs
set noexpandtab

" When tabbing manually, use shiftwidth instead of tabstop and softtabstop
set smarttab

" Set basic indenting (i.e. copy the indentation of the previous line)
" When filetype detection didn't find a fancy indentation scheme
set autoindent

" Correctly indent continuaton lines when using cindent
" See http://vim.wikia.com/wiki/VimTip1626#Continuation_lines
set cinoptions=(0,u0,U0

""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""

" Set "," as map leader
let mapleader = ","

" 'very magic' regexp searches
nnoremap / /\v
nnoremap ? ?\v

" 'very magic' regexp substitutions
cnoremap %s %s/\v

" Toggle paste mode
noremap <leader>pp :setlocal paste!<cr>

" Move between rows in wrapped lines
nnoremap j gj
nnoremap k gk

" Yank from cursor to end of line, to be consistent with C and D
nnoremap Y y$

" Write as root, when you forgot to sudoedit
cnoremap w!! w !sudo tee % >/dev/null

" map ; to :
noremap ; :

" Call :make
noremap <leader>m :make<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Persistence options
""""""""""""""""""""""""""""""""""""""""""""""""""

" Set location of the viminfo file
set viminfo='20,\"50,<100,n~/.vimtmp/viminfo

" From the Vim wiki
" http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

" Persistent undo
if version >= 703
    set undofile
    set undodir=~/.vimtmp/undo
    silent !mkdir -p ~/.vimtmp/undo
endif

""""""""""""""""""""""""""""""""""""""""""""""""""
" C/C++ related options
""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatically insert guard on new headers
" This function comes from Pierre Bourdon's vimrc
function Insert_header_guards()
    let basename=substitute(@%, "[^/]*/", "", "g")
    let underscored=tr(basename, ".", "_")
    let const=substitute(underscored, ".*", "\\U\\0", "")."_"
    exe "normal i#ifndef ".const."\n\e"
    exe "normal i# define ".const."\n\n\n\n\e"
    exe "normal i#endif /"."* !".const." */\e"
    exe "normal 4G"
endfunction

au Bufnewfile *.h call Insert_header_guards()
au Bufnewfile *.hh call Insert_header_guards()

" Set filetype of C headers to c instead of cpp
au Bufnewfile,Bufread *.h set ft=c

" Set filetype of C++ headers to cpp
au Bufnewfile,Bufread *.hh set ft=cpp

""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin mappings and options
""""""""""""""""""""""""""""""""""""""""""""""""""
" /!\ Comment these if you only have the .vimrc! /!\

" Toggle Tagbar
noremap <leader>tt :TagbarToggle<cr>

