---------------------------------------------------------------------
-- Mason Plugin Configuration
---------------------------------------------------------------------
return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    ---------------------------------------------------------------------
    -- Mason-LSPConfig Plugin
    ---------------------------------------------------------------------
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        config = function()
            require("mason-lspconfig").setup({
                auto_install = true,
                ensure_installed = {
                    "html",
                    "cssls",
                    "cssmodules_ls",
                    "css_variables",
                    "tailwindcss",
                    "bashls",
                    "ts_ls",
                    "clangd",
                    "lua_ls",
                    "markdown_oxide",
                    -- "ruff",
                    -- "pyright",
                    "gopls",
                },
            })
        end,
    },

    ---------------------------------------------------------------------
    -- LSPConfig Plugin
    ---------------------------------------------------------------------
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            ---------------------------------------------------------------------
            -- LazyDev Plugin (for Lua files)
            ---------------------------------------------------------------------
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
                library = {
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
        lazy = false,
        config = function()
            ---------------------------------------------------------------------
            -- Setup LSP Capabilities
            ---------------------------------------------------------------------
            local capabilities = vim.tbl_deep_extend(
                "force",
                {},
                vim.lsp.protocol.make_client_capabilities(),
                require("cmp_nvim_lsp").default_capabilities()
            )

            ---------------------------------------------------------------------
            -- Organize Imports Command (TypeScript)
            ---------------------------------------------------------------------
            local function organize_ts_imports()
                local params = {
                    command = "_typescript.organizeImports",
                    arguments = { vim.api.nvim_buf_get_name(0) },
                }
                vim.lsp.buf.execute_command(params)
            end

            ---------------------------------------------------------------------
            -- Configure LSP Servers
            ---------------------------------------------------------------------
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({ capabilities = capabilities })
            lspconfig.html.setup({ capabilities = capabilities })
            lspconfig.cssls.setup({ capabilities = capabilities })
            lspconfig.cssmodules_ls.setup({ capabilities = capabilities })
            lspconfig.css_variables.setup({ capabilities = capabilities })
            lspconfig.tailwindcss.setup({ capabilities = capabilities })
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
                commands = {
                    OrganizeImports = {
                        organize_ts_imports,
                        description = "Organize Imports",
                    },
                },
            })
            lspconfig.clangd.setup({ capabilities = capabilities })
            lspconfig.bashls.setup({ capabilities = capabilities })
            -- lspconfig.pyright.setup({ capabilities = capabilities, filetypes = { "python" } })
            lspconfig.gopls.setup({
                cmd = { "gopls" },
                filetypes = { "go", "gomod", "gowork", "gotmpl" },
                settings = {
                    gopls = {
                        completeUnimported = true,
                        usePlaceholders = true,
                        analyses = {
                            unusedparams = true,
                        },
                    },
                    env = {
                        GOEXPERIMENT = "rangefunc",
                    },
                    formatting = {
                        gofumpt = true,
                    },
                },
            })

            ---------------------------------------------------------------------
            -- Keybindings for LSP Features
            ---------------------------------------------------------------------
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n", "v" }, "grr", vim.lsp.buf.references, {})
            vim.keymap.set({ "n", "v" }, "<leader>rn", vim.lsp.buf.rename, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "]d", function()
                vim.diagnostic.goto_next()
            end, {})
            vim.keymap.set("n", "[d", function()
                vim.diagnostic.goto_prev()
            end, {})
            vim.keymap.set("n", "<leader>ld", vim.diagnostic.setqflist, { desc = "Quickfix [L]ist [D]iagnostics" })
        end,
    },
}
