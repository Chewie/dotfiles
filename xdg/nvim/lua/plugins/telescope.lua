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
            {
                "<leader>of",
                function()
                    require("telescope.builtin").oldfiles()
                end,
                desc = "[OF] Find recently opened files",
            },
            {
                "<leader><space>",
                function()
                    require("telescope.builtin").buffers()
                end,
                desc = "[ ] Find existing buffers",
            },
            {
                "<leader>sf",
                function()
                    require("telescope.builtin").find_files()
                end,
                desc = "[S]earch [F]iles",
            },
            {
                "<leader>sh",
                function()
                    require("telescope.builtin").help_tags()
                end,
                desc = "[S]earch [H]elp",
            },
            {
                "<leader>sw",
                function()
                    require("telescope.builtin").grep_string()
                end,
                desc = "[S]earch current [W]ord",
            },
            {
                "<leader>sg",
                function()
                    require("telescope.builtin").live_grep()
                end,
                desc = "[S]earch by [G]rep",
            },
            {
                "<leader>sd",
                function()
                    require("telescope.builtin").diagnostics()
                end,
                desc = "[S]earch [D]iagnostics",
            },
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
