--"""""""""""""""""""""""""""""""""""""""""""""""""
-- TODO: stuff not ported yet. Still needed?
--"""""""""""""""""""""""""""""""""""""""""""""""""

-- Run make silently, then skip the 'Press ENTER to continue'
--noremap <leader>m :silent! :make! \| :redraw!<cr>

--"""""""""""""""""""""""""""""""""""""""""""""""""
-- Persistence options
--"""""""""""""""""""""""""""""""""""""""""""""""""

-- Set location of the viminfo file
-- set viminfo='20,\"50,<100

-- See :h last-position-jump
--augroup last_position_jump
--    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
--augroup END

-- Persistent undo
--if !has("nvim")
--    set undofile
--    set undodir=~/.vimtmp/undo
--    silent !mkdir -p ~/.vimtmp/undo
--endif

--"""""""""""""""""""""""""""""""""""""""""""""""""
-- Plugin mappings and options
--"""""""""""""""""""""""""""""""""""""""""""""""""

-- Disable Ack.vim's mappings on the quickfix and location list windows
-- We use vim-qf mappings instead
--let g:ack_apply_qmappings = 0
--let g:ack_apply_lmappings = 0
--let g:qf_mapping_ack_style = 1

-- Override unimpaired quickfix and loc-list mappings to use vim-qf wrapparound
--let g:nremap = {"[q": "", "]q": "", "[l": "", "]l": ""}
--nmap [q <Plug>(qf_qf_previous)
--nmap ]q <Plug>(qf_qf_next)
--nmap [l <Plug>(qf_loc_previous)
--nmap ]l <Plug>(qf_loc_next)

-- Launch fugitive's gstatus
--noremap <leader>gs :Gstatus<cr>

-- Mappings for vim-test
--nmap <silent> <leader>ts :TestSuite<cr>

-- Tell vim-test to use dispatch to run our tests
--let test#strategy = "dispatch"

-- Tell Dispatch to use the pytest compiler when we call pytest (the compiler
-- file looks for py.test instead of pytest)
--let g:dispatch_compilers = {'pytest': 'pytest'}

-- Add the termdebug built-in plugin
--packadd termdebug

--let g:rustfmt_autosave = 1
