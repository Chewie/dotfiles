return {
    {
        'EdenEast/nightfox.nvim',
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
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
            require('nvim-treesitter.configs').setup {
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
    { 'numToStr/Comment.nvim', config = true },
    { 'stevearc/oil.nvim', config = true },
    { 'simrat39/rust-tools.nvim', config = true },
    { 'terrastruct/d2-vim',lazy = false },
    'hashivim/vim-terraform',
}
