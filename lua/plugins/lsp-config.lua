return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
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
					"pylsp",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
		lazy = false,
		config = function()
			-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				require("cmp_nvim_lsp").default_capabilities()
			)

			local function organize_imports()
				local params = {
					command = "_typescript.organizeImports",
					arguments = { vim.api.nvim_buf_get_name(0) },
				}
				vim.lsp.buf.execute_command(params)
			end

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
						organize_imports,
						description = "Organize Imports",
					},
				},
			})
			lspconfig.clangd.setup({ capabilities = capabilities })
			lspconfig.bashls.setup({ capabilities = capabilities })
			lspconfig.pylsp.setup({ capabilities = capabilities })

			vim.keymap.set("n", "H", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "grr", vim.lsp.buf.references, {})
			vim.keymap.set({ "n", "v" }, "<leader>rn", vim.lsp.buf.rename, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

			-- Function to get diagnostics count
			function _G.diagnostics()
				local buf = vim.api.nvim_get_current_buf()
				local diagnostics = vim.diagnostic.get(buf)

				local errors = #vim.tbl_filter(function(d)
					return d.severity == vim.diagnostic.severity.ERROR
				end, diagnostics)
				local warnings = #vim.tbl_filter(function(d)
					return d.severity == vim.diagnostic.severity.WARN
				end, diagnostics)
				local hints = #vim.tbl_filter(function(d)
					return d.severity == vim.diagnostic.severity.HINT
				end, diagnostics)

				-- Format diagnostics with errors, warnings, and hints
				return string.format("E:%d W:%d H:%d", errors, warnings, hints)
				-- Alternatively, use symbols for the status line (for a more visual approach)
				-- return string.format(" :%d  :%d  :%d", errors, warnings, hints)
			end

			-- Neovim LSP Diagnostics in statusline
			vim.o.statusline = "%f %m %r %h%w[%{v:lua.diagnostics()}] %=%l,%c            %p%%"

			-- Update the statusline when diagnostics change
			vim.lsp.handlers["textDocument/publishDiagnostics"] = function(_, result, ctx, _)
				vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx)
				vim.cmd("redrawstatus") -- Force statusline redraw
			end
		end,
	},
}
