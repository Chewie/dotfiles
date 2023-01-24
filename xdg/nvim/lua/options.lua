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
vim.opt.colorcolumn = '+1'

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
vim.opt.completeopt = "longest,menuone"

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
