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
    -- {
    --     "rachartier/tiny-cmdline.nvim",
    --     config = function()
    --         vim.o.cmdheight = 0
    --         require("tiny-cmdline").setup({
    --             native_types
    --             on_reposition = require("tiny-cmdline").adapters.blink,
    --         })
    --     end,
    -- },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = false,
        branch = "main",
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
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {

            -- add any options here
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                },
            },
            routes = {
                {
                    filter = {
                        event = "msg_show",
                        kind = "",
                        find = "written",
                    },
                    opts = { skip = true },
                },
            },
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
    },
    "kcl-lang/kcl.nvim",
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
            },
        },
    },
}
