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

-- Plugin specific keymaps

vim.keymap.set("n", "-", function()
    require("oil").open()
end, { desc = "Open parent directory" })

--"""""""""""""""""""""""""""""""""""""""""""""""""
-- Picker mappings
--"""""""""""""""""""""""""""""""""""""""""""""""""

vim.keymap.set("n", "gri", function()
    require("snacks.picker").lsp_implementations()
    require("telescope.builtin")
end, { desc = "Go to implementation" })

vim.keymap.set("n", "grd", function()
    require("snacks.picker").lsp_definitions()
end, { desc = "Go to definition" })

vim.keymap.set("n", "grr", function()
    require("snacks.picker").lsp_references()
end, { desc = "Find references" })

vim.keymap.set("n", "grt", function()
    require("snacks.picker").lsp_type_definitions()
end, { desc = "Go to type definition" })

vim.keymap.set("n", "gO", function()
    require("snacks.picker").lsp_symbols()
end, { desc = "Show document symbols" })

vim.keymap.set("n", "sf", function()
    require("snacks.picker").files()
end, { desc = "Search files" })

vim.keymap.set("n", "sg", function()
    require("snacks").picker.grep()
end, { desc = "Search by grep" })

vim.keymap.set("n", "sh", function()
    require("snacks").picker.help()
end, { desc = "Search Help" })

vim.keymap.set("n", "sd", function()
    require("snacks").picker.diagnostics()
end, { desc = "Search diagnostics" })

vim.keymap.set("n", "sw", function()
    require("snacks").picker.grep_word()
end, { desc = "Search current word" })

vim.keymap.set("n", "se", function()
    require("snacks").picker.explorer()
end, { desc = "Show explorer" })
