return {
    {
        "EdenEast/nightfox.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme carbonfox]])
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = false,
        branch = "main",
    },
    {
        "mks-h/treesitter-autoinstall.nvim",
        opts = {
            highlight = true,
        },
    },
    "tpope/vim-surround",
    "tpope/vim-repeat",
    "tpope/vim-unimpaired",
    "tpope/vim-fugitive",
    "grafana/vim-alloy",
    {
        "stevearc/oil.nvim",
        opts = {
            lsp_file_methods = {
                enabled = true,
                autosave_changes = true,
            },
            watch_for_changes = true,
        },
    },
    "hashivim/vim-terraform",
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            scope = {
                show_start = false,
                show_end = false,
            },
        },
    },
    {
        "towolf/vim-helm",
        ft = "helm",
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "[?] Show all buffer keymaps",
            },
        },
    },
    {
        "stevearc/quicker.nvim",
        event = "FileType qf",
        ---@module "quicker"
        ---@type quicker.SetupOptions
        opts = {},
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            picker = {
                enabled = true,
                win = {
                    input = {
                        keys = {
                            ["<c-space>"] = { { "select_and_next", "list_up" }, mode = { "i", "n" } },
                        },
                    },
                },
            },
            toggle = {},
        },
    },
    {
        "rachartier/tiny-cmdline.nvim",
        config = function()
            vim.o.cmdheight = 0
            require("tiny-cmdline").setup({
                on_reposition = require("tiny-cmdline").adapters.blink,
                native_types = {},
            })
        end,
    },
    {
        "catgoose/nvim-colorizer.lua",
        event = "BufReadPre",
        opts = {
            options = {
                parsers = {
                    names = {
                        enable = false,
                    },
                    hex = {
                        rrggbbaa = true,
                    },
                },
            },
        },
    },
}
