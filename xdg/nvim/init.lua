--------------------------------------------------
-- Plugins
--------------------------------------------------

-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end


require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  -- Bag of mappings
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-unimpaired'
  use 'scrooloose/nerdcommenter'
  use 'romainl/vim-qf'

  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'honza/vim-snippets'

  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',
    },
  }

  use { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
  end,
  }

  -- Colorscheme
  use 'EdenEast/nightfox.nvim'

  use 'nvim-lualine/lualine.nvim'

  use 'tpope/vim-vinegar'

    if is_bootstrap then
    require('packer').sync()
  end
end)

--------------------------------------------------
-- Plugins config
--------------------------------------------------

require('lualine').setup {
    options = {
        icons_enabled = false,
        theme = 'carbonfox',
        component_separators = '|',
        section_separators = '',
    }
}

require('mason').setup()

local lsp_servers = { 'rust_analyzer', 'pyright', 'clangd'}

-- Ensure the servers above are installed
require('mason-lspconfig').setup {
  ensure_installed = lsp_servers
}

require('fidget').setup()

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workleader_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

for _, server in ipairs(lsp_servers) do
require('lspconfig')[server].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
end

require('nvim-treesitter.configs').setup {
    highlight = {enable = true}
}



vim.cmd("imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'")
vim.cmd("inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>")
vim.cmd("snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>")
vim.cmd("snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>")

require("luasnip.loaders.from_snipmate").lazy_load()
--------------------------------------------------
-- General parameters
--------------------------------------------------


-- Write the file when we leave the buffer
vim.opt.autowrite = true

-- Disable backups, we have source control for that
vim.opt.backup = false

-- Disable swapfiles too
vim.opt.swapfile = false

-- Set the time (in milliseconds) spent idle until various actions occur
-- In this configuration, it is particularly useful for the tagbar plugin
vim.opt.updatetime = 500


---------------------------------------------------
-- User interface
---------------------------------------------------

-- Set the minimal amount of lignes under and above the cursor
-- Useful for keeping context when moving with j/k
vim.opt.scrolloff = 5

-- Show current mode
vim.opt.showmode = true

-- Show command being executed
vim.opt.showcmd = true

-- Show line number
vim.opt.number = true

-- Always show status line
vim.opt.laststatus = 2

-- Format the status line
-- This status line comes from Pierre Bourdon's vimrc
--set statusline=%f\ %l\|%c\ %m%=%p%%\ (%Y%R)

-- Enhance command line completion
vim.opt.wildmenu = true

-- Set completion behavior, see :help wildmode for details
vim.opt.wildmode = "longest:full,list:full"

-- Disable bell completely
vim.opt.visualbell = true

-- Color the column after textwidth, usually the 80th
vim.opt.colorcolumn='+1'

-- Display whitespace characters
vim.opt.list = true

vim.opt.listchars = "tab:>─,eol:¬,trail: ,nbsp:¤"

vim.opt.fillchars = "vert:│"

-- Enable Doxygen highlighting
vim.g.load_doxygen_syntax = 1

-- Allow mouse use in vim
vim.opt.mouse = 'a'

-- Briefly show matching braces, parens, etc
vim.opt.showmatch = true

-- Enable line wrapping
vim.opt.wrap = true

-- Wrap on column 80
vim.opt.textwidth = 79

-- Disable preview window on completion
vim.opt.completeopt= "longest,menuone"

-- Highlight current line
vim.opt.cursorline = true

vim.opt.splitright = true

vim.opt.splitbelow = true

--"""""""""""""""""""""""""""""""""""""""""""""""""
-- Search options
--"""""""""""""""""""""""""""""""""""""""""""""""""

-- Ignore case on search
vim.opt.ignorecase = true

-- Ignore case unless there is an uppercase letter in the pattern
vim.opt.smartcase = true

-- Move cursor to the matched string
vim.opt.incsearch = true

-- Don't highlight matched strings
vim.opt.hlsearch = false

--"""""""""""""""""""""""""""""""""""""""""""""""""
-- Indentation options
--"""""""""""""""""""""""""""""""""""""""""""""""""

-- The length of a tab
-- This is for documentation purposes only,
-- do not change the default value of 8, ever.
vim.opt.tabstop = 8

-- The number of spaces inserted/removed when using < or >
vim.opt.shiftwidth = 4
--
-- Always indent to a multiple of shiftwidth
vim.opt.shiftround = true


-- The number of spaces inserted when you press tab.
-- -1 means the same value as shiftwidth
vim.opt.softtabstop = -1

-- Insert spaces instead of tabs
vim.opt.expandtab = true

-- When tabbing manually, use shiftwidth instead of tabstop and softtabstop
vim.opt.smarttab = true

-- Set basic indenting (i.e. copy the indentation of the previous line)
-- When filetype detection didn't find a fancy indentation scheme
vim.opt.autoindent = true

-- This one is complicated. See :help cinoptions-values for details
vim.opt.cinoptions = "(0,u0,U0,t0,g0,N-s"

--"""""""""""""""""""""""""""""""""""""""""""""""""
-- Mappings
--"""""""""""""""""""""""""""""""""""""""""""""""""

-- Set "," as map leader
vim.g.mapleader = ","

-- Toggle paste mode
vim.keymap.set('', '<leader>pp', ':setlocal paste!<cr>')

-- Move between rows in wrapped lines
vim.keymap.set('', 'j', 'gj')
vim.keymap.set('', 'k', 'gk')

-- Yank from cursor to end of line, to be consistent with C and D
vim.keymap.set('n', 'Y', 'y$')

-- Write as root, when you forgot to sudoedit
--cnoreabbrev w!! w !sudo tee % >/dev/null

-- map ; to :
vim.keymap.set('', ';', ':')

-- Open the quickfix window if there are errors, or close it if there are no
-- errors left
vim.keymap.set('', '<leader>cw', ':botright :cw<cr>')

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

-- Feel free to switch to another colorscheme
vim.cmd("colorscheme carbonfox")

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
