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

                    nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
                    nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")

                    nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

                    nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
                    nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
                    nmap("<leader>wl", function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, "[W]orkspace [L]ist Folders")
                    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
                        nmap("<leader>th", function()
                            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
                        end, "[T]oggle Inlay [H]ints")
                    end
                end,
            })

            local servers = {
                clangd = {},
                rust_analyzer = {},
                helm_ls = {},
                bashls = {},
                dockerls = {},
                -- terraformls = {},
                tofu_ls = {},
                -- yamlls = {},
                -- ansiblels = {},
                biome = {},
                -- tsgo = {},
                ts_ls = {},
                dagger = {},
                gopls = {
                    settings = {
                        staticcheck = true,
                    },
                },
                golangci_lint_ls = {},
                tilt = {
                    cmd = { "tilt", "lsp", "start" },
                    filetypes = { "tiltfile.bzl" },
                    root_markers = { ".git" },
                },
                pyright = {
                    capabilities = {
                        textDocument = {
                            publishDiagnostics = {
                                tagSupport = {
                                    valueSet = { 2 },
                                },
                            },
                        },
                    },
                    settings = {
                        pyright = {
                            -- Using Ruff's import organizer
                            disableOrganizeImports = true,
                        },
                        python = {
                            pythonPath = ".venv/bin/python",
                        },
                    },
                },
                ruff = {},
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
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if client == nil then
                        return
                    end
                    if client.name == "ruff" then
                        -- Disable hover in favor of Pyright
                        client.server_capabilities.hoverProvider = false
                    end
                end,
                desc = "LSP: Disable hover capability from Ruff",
            })

            require("mason").setup()

            local ensure_installed = vim.tbl_keys(servers or {})
            vim.list_extend(ensure_installed, {
                "hadolint",
                "stylua",
                "mdformat",
                "golangci-lint",
            })
            require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

            for server_name, config in pairs(servers) do
                config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities, true)
                vim.lsp.config[server_name] = config
                vim.lsp.enable(server_name)
            end
        end,
    },
}
