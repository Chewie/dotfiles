" wrapping.vim
" Configures everything related to wrapping

set wrap
set textwidth=79

" Justify using ,gq
runtime macros/justify.vim
nmap ,gq :%s/\s\+/ /<CR>gq1G_j
vmap ,gq :s/\s\+/ /<CR>gvgq_j
