return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                cond = vim.fn.executable("make") == 1,
            },
            "benfowler/telescope-luasnip.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
        },
        keys = {
            { "<leader>of", require("telescope.builtin").oldfiles, desc = "[OF] Find recently opened files" },
            { "<leader><space>", require("telescope.builtin").buffers, desc = "[ ] Find existing buffers" },
            { "<leader>sf", require("telescope.builtin").find_files, desc = "[S]earch [F]iles" },
            { "<leader>sh", require("telescope.builtin").help_tags, desc = "[S]earch [H]elp" },
            { "<leader>sw", require("telescope.builtin").grep_string, desc = "[S]earch current [W]ord" },
            { "<leader>sg", require("telescope.builtin").live_grep, desc = "[S]earch by [G]rep" },
            { "<leader>sd", require("telescope.builtin").diagnostics, desc = "[S]earch [D]iagnostics" },
            {
                "<leader>/",
                function()
                    require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                        winblend = 10,
                        previewer = false,
                    }))
                end,
                desc = "[/] Fuzzily search in current buffer]",
            },
        },
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({
                            -- even more opts
                        }),
                    },
                },
            })
            require("telescope").load_extension("luasnip")
            require("telescope").load_extension("ui-select")

            -- Enable telescope fzf native, if installed
            pcall(require("telescope").load_extension, "fzf")
        end,
    },
}
