return {
    {
        'EdenEast/nightfox.nvim',
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme carbonfox]])
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require('nvim-treesitter.configs').setup {
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
                auto_install = true,
                highlight = { enable = true }
            }
        end,
    },
    'tpope/vim-surround',
    'tpope/vim-repeat',
    'tpope/vim-unimpaired',
    'tpope/vim-fugitive',
    'romainl/vim-qf',
    'rfratto/vim-river',
    { 'numToStr/Comment.nvim',    config = true },
    { 'stevearc/oil.nvim',        config = true },
    { 'simrat39/rust-tools.nvim', config = true },
    { 'terrastruct/d2-vim',       lazy = false },
    'hashivim/vim-terraform',
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        opts = {},
    },
    'towolf/vim-helm',
    {
        'folke/trouble.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeoutlen = 300
        end,
        config = true,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },
    -- {
    --     "nvim-tree/nvim-tree.lua",
    --     dependencies = {
    --         "nvim-tree/nvim-web-devicons",
    --     },
    --     config = function()
    --         require("nvim-tree").setup {}
    --     end,
    -- },
    -- {
    --     "echasnovski/mini.files",
    --     version = false,
    --     config = {}
    -- },
}
