return {
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = vim.fn.executable 'make' == 1
            },
            'benfowler/telescope-luasnip.nvim',
        },
        config = function()
            require('telescope').setup {}
            require('telescope').load_extension('luasnip')

            -- Enable telescope fzf native, if installed
            pcall(require('telescope').load_extension, 'fzf')

        end
    }
}
