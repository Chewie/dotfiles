--------------------------------------------------
-- General parameters
--------------------------------------------------

-- Write the file when we leave the buffer
vim.o.autowrite = true

-- Disable backups, we have source control for that
vim.o.backup = false

-- Disable swapfiles too
vim.o.swapfile = false

-- Set the time (in milliseconds) spent idle until various actions occur
-- In this configuration, it is particularly useful for the tagbar plugin
vim.o.updatetime = 500

---------------------------------------------------
-- User interface
---------------------------------------------------

-- Set the minimal amount of lignes under and above the cursor
-- Useful for keeping context when moving with j/k
vim.o.scrolloff = 5

-- Show current mode
vim.o.showmode = true

-- Show command being executed
vim.o.showcmd = true

-- Show line number
vim.o.number = true

-- Always show status line
vim.o.laststatus = 2

-- Format the status line
-- This status line comes from Pierre Bourdon's vimrc
--set statusline=%f\ %l\|%c\ %m%=%p%%\ (%Y%R)

-- Enhance command line completion
vim.o.wildmenu = true

-- Set completion behavior, see :help wildmode for details
vim.o.wildmode = "longest:full,list:full"

-- Disable bell completely
vim.o.visualbell = true

-- Color the column after textwidth, usually the 80th
vim.o.colorcolumn = "+1"

-- Display whitespace characters
vim.o.list = true

vim.o.listchars = "tab:>─,eol:¬,trail: ,nbsp:¤"

vim.o.fillchars = "vert:│"

-- Enable Doxygen highlighting
vim.g.load_doxygen_syntax = 1

-- Allow mouse use in vim
vim.o.mouse = "a"

-- Briefly show matching braces, parens, etc
vim.o.showmatch = true

-- Enable line wrapping
vim.o.wrap = true

-- Wrap on column 80
vim.o.textwidth = 79

-- Disable preview window on completion
vim.o.completeopt = "longest,menuone"

-- Highlight current line
vim.o.cursorline = true

vim.o.splitright = true

vim.o.splitbelow = true

--"""""""""""""""""""""""""""""""""""""""""""""""""
-- Search options
--"""""""""""""""""""""""""""""""""""""""""""""""""

-- Ignore case on search
vim.o.ignorecase = true

-- Ignore case unless there is an uppercase letter in the pattern
vim.o.smartcase = true

-- Move cursor to the matched string
vim.o.incsearch = true

-- Don't highlight matched strings
vim.o.hlsearch = false

--"""""""""""""""""""""""""""""""""""""""""""""""""
-- Indentation options
--"""""""""""""""""""""""""""""""""""""""""""""""""

-- The length of a tab
-- This is for documentation purposes only,
-- do not change the default value of 8, ever.
vim.o.tabstop = 8

-- The number of spaces inserted/removed when using < or >
vim.o.shiftwidth = 4
--
-- Always indent to a multiple of shiftwidth
vim.o.shiftround = true

-- The number of spaces inserted when you press tab.
-- -1 means the same value as shiftwidth
vim.o.softtabstop = -1

-- Insert spaces instead of tabs
vim.o.expandtab = true

-- When tabbing manually, use shiftwidth instead of tabstop and softtabstop
vim.o.smarttab = true

-- Set basic indenting (i.e. copy the indentation of the previous line)
-- When filetype detection didn't find a fancy indentation scheme
vim.o.autoindent = true

-- This one is complicated. See :help cinoptions-values for details
vim.o.cinoptions = "(0,u0,U0,t0,g0,N-s"

-- Trigger file reload even if file changed externally
vim.api.nvim_create_autocmd("FocusGained", { command = "checktime" })
