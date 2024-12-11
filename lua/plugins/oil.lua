return {
	{
		"stevearc/oil.nvim",
		config = function()
			local oil = require("oil")
			oil.setup({
				default_file_explorer = true,
				view_options = {
					show_hidden = true,
					is_always_hidden = function(name, _)
						return name == ".." or name == ".git"
					end,
				},
				win_options = {
					wrap = true,
				},
			})
			vim.keymap.set("n", "-", oil.toggle_float, {})
		end,
	},
	{
		"nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({})
		end,
	},
}
