---------------------------------------------------------------------
-- Plugin Configuration: none-ls.nvim
---------------------------------------------------------------------
return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		---------------------------------------------------------------------
		-- LSP Formatting Augroup
		---------------------------------------------------------------------
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local null_ls = require("null-ls")

		---------------------------------------------------------------------
		-- null-ls Setup
		---------------------------------------------------------------------
		null_ls.setup({
			sources = {
				-- c, c++
				null_ls.builtins.formatting.clang_format.with({
					extra_args = {
						"-style={BasedOnStyle: llvm, IndentWidth: 4, TabWidth: 4}",
					},
				}),
				-- python
				null_ls.builtins.formatting.black,
				null_ls.builtins.diagnostics.mypy,
				-- null_ls.builtins.diagnostics.ruff,
				-- go
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.formatting.goimports_reviser,
				null_ls.builtins.formatting.golines.with({
					extra_args = { "--max-len=80", "--base-formatter=gofumpt" },
				}),
				-- lua
				null_ls.builtins.formatting.stylua,
				-- typescript
				null_ls.builtins.formatting.prettier.with({
					-- prefer_local = "node_modules/.bin", -- use project-local Prettier
					extra_args = { "--tab-width", "4", "--print-width", "120", "--semi", true },
				}),
				-- WARNING: deprecated
				-- null_ls.builtins.formatting.eslint_d,

				-- NOTE: deactivated because of delijan local eslint
				-- require("none-ls.diagnostics.eslint"),
			},
			-- Format on save
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
		})

		---------------------------------------------------------------------
		-- Keybindings
		---------------------------------------------------------------------
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
