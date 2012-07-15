""
"" tiger.vim for vim-syntax in /u/a1/sigour_b/.vim/ftdetect
""
"" Made by SIGOURE Benoit
"" Login   <sigour_b@epita.fr>
""
"" Started on  Sat Jan  7 20:08:17 2006 SIGOURE Benoit
"" Last update Wed Mar  8 14:01:07 2006 SIGOURE Benoit
""

" This file is used to detect the tiger files

" INSTALL instructions:
" $ mkdir -p ~/.vim/ftdetect
" $ cp tiger-ftdetect.vim ~/.vim/ftdetect/tiger.vim

au BufRead,BufNewFile *.tig		set filetype=tiger
au BufRead,BufNewFile *.tih		set filetype=tiger
