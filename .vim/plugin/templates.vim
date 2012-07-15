" templates.vim
" Load a file template based on the file extension when creating a new file

au BufNewFile * sil! 0r ~/.vim/templates/%:t
au BufNewFile * sil! 0r ~/.vim/templates/%:e
