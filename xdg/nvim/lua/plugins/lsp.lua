return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",

            -- Useful status updates for LSP
            { "j-hui/fidget.nvim", opts = {} },

            -- Additional lua configuration, makes nvim stuff amazing
            {
                "folke/lazydev.nvim",
                ft = "lua",
                cmd = "LazyDev",
                opts = {
                    library = {
                        { path = "luvit-meta/library", words = { "vim%.uv" } },
                    },
                },
            },
            { "Bilal2453/luvit-meta", lazy = true },
        },
        config = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
                callback = function(event)
                    local nmap = function(keys, func, desc)
                        if desc then
                            desc = "LSP: " .. desc
                        end

                        vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
                    end

                    local client = vim.lsp.get_client_by_id(event.data.client_id)

                    nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
                    nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

                    nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
                    nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
                    nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
                    nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
                    nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
                    nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
                    nmap(
                        "<leader>ws",
                        require("telescope.builtin").lsp_dynamic_workspace_symbols,
                        "[W]orkspace [S]ymbols"
                    )

                    nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

                    nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
                    nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
                    nmap("<leader>wl", function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, "[W]orkspace [L]ist Folders")
                    -- nmap('<leader>f', function()
                    --     vim.lsp.buf.format {
                    --         bufnr = event.buf,
                    --         -- async = true,
                    --         filter = function(c) return c.name ~= "tsserver" end,
                    --     }
                    -- end, '[F]ormat')
                    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
                        nmap("<leader>th", function()
                            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
                        end, "[T]oggle Inlay [H]ints")
                    end
                end,
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

            local servers = {
                clangd = {},
                rust_analyzer = {},
                helm_ls = {},
                bashls = {},
                dockerls = {},
                jsonls = {},
                terraformls = {},
                yamlls = {},
                -- ansiblels = {},
                -- eslint = {},
                biome = {},
                ts_ls = {},
                dagger = {},
                gopls = {},
                pyright = {},
                lua_ls = {
                    -- cmd = {...},
                    -- filetypes { ...},
                    -- capabilities = {},
                    settings = {
                        Lua = {
                            completion = {
                                callSnippet = "Replace",
                            },
                            -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                            -- diagnostics = { disable = { 'missing-fields' } },
                        },
                    },
                },
            }

            require("mason").setup()

            local ensure_installed = vim.tbl_keys(servers or {})
            vim.list_extend(ensure_installed, {
                "hadolint",
                "prettierd",
                "stylua",
            })
            require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

            require("mason-lspconfig").setup({
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}

                        server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                        require("lspconfig")[server_name].setup(server)
                    end,
                },
            })
        end,
    },
}
