vim.diagnostic.config({
    severity_sort = true,
    virtual_lines = true,
    float = {
        border = "rounded",
        source = "if_many",
    },
    jump = {
        on_jump = function(_, bufnr)
            vim.diagnostic.open_float({
                bufnr = bufnr,
                scope = "cursor",
                focus = false,
            })
        end,
    },
})
