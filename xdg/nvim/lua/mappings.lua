--"""""""""""""""""""""""""""""""""""""""""""""""""
-- Mappings
--"""""""""""""""""""""""""""""""""""""""""""""""""

-- Toggle paste mode
vim.keymap.set("", "<leader>pp", ":setlocal paste!<cr>")

-- Move between rows in wrapped lines
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Yank from cursor to end of line, to be consistent with C and D
vim.keymap.set("n", "Y", "y$")

-- Write as root, when you forgot to sudoedit
--cnoreabbrev w!! w !sudo tee % >/dev/null

-- map ; to :
vim.keymap.set("", ";", ":")

-- Open the quickfix window if there are errors, or close it if there are no
-- errors left
vim.keymap.set("", "<leader>cw", ":botright :cw<cr>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
