" misc-bindings.vim
" Every miscellaneous key binding will go here.

" << That stupid goddamned help key that you will invaribly hit constantly
" while aiming for escape >> -- Steve Losh
inoremap <F1> <esc>
vnoremap <F1> <esc>
nnoremap <F1> <esc>

" << it's one less key to hit every time I want to save a file >>
"   -- Steve Losh (again)
nnoremap ; :
vnoremap ; :

" From Kalenz's Vim config. Life changing.
nnoremap <Space> <C-w>
nnoremap <Space><Space> <C-w>w

nnoremap <S-Tab> :%s/\v
nnoremap <Tab> :s/\v
vnoremap <Tab> :s/\v
