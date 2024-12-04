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

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
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

				return string.format("E:%d W:%d", errors, warnings)
			end

			-- Neovim LSP Diagnostics in statusline
			vim.o.statusline = "%f   %h%w[%{v:lua.diagnostics()}] %m"

			-- Update the statusline when diagnostics change
			vim.lsp.handlers["textDocument/publishDiagnostics"] = function(_, result, ctx, _)
				vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx)
				vim.cmd("redrawstatus") -- Force statusline redraw
			end
		end,
	},
}
