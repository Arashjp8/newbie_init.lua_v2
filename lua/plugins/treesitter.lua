---------------------------------------------------------------------
-- Treesitter Plugin Setup
---------------------------------------------------------------------
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		---------------------------------------------------------------------
		-- Treesitter Configuration
		---------------------------------------------------------------------
		local config = require("nvim-treesitter.configs")
		config.setup({
			modules = {},
			sync_install = false,
			auto_install = true,
			ignore_install = {},
			ensure_installed = {
				"vimdoc",
				"lua",
				"markdown",
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
				"jsdoc",
				"yaml",
				"json",
				"bash",
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
				custom_captures = {},
			},
			indent = { enable = true },
		})

		---------------------------------------------------------------------
		-- Auto Commands for Custom Highlights
		---------------------------------------------------------------------
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				-- NOTE: this is only for github dark theme
				if vim.g.colors_name == "github_dark" then
					vim.api.nvim_set_hl(0, "@lsp.type.parameter", { fg = "#FFA657" })
					vim.api.nvim_set_hl(0, "@lsp.type.parameter.typescriptreact", { fg = "#ecf2f8" })
					-- vim.api.nvim_set_hl(0, "@lsp.type.class", { fg = "#FFA657" })
					-- vim.api.nvim_set_hl(0, "@lsp.type.variable", { fg = "#FFD700" })
				end
			end,
		})
	end,
}
