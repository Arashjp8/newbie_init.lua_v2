return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
		config = function()
			local builtin = require("telescope.builtin")
			local themes = require("telescope.themes")

			vim.keymap.set("n", "<Space><Space>", function()
				builtin.find_files(themes.get_ivy({ hidden = true }))
			end, {})
			vim.keymap.set("n", "<leader>fg", function()
				builtin.live_grep(themes.get_ivy())
			end, {})
			vim.keymap.set("n", "<leader>fr", function()
				builtin.lsp_references(themes.get_ivy())
			end)
			vim.keymap.set("n", "<leader>fr", function()
				builtin.lsp_references(themes.get_ivy())
			end)
			vim.keymap.set("n", "<leader>fh", function()
				builtin.help_tags(themes.get_ivy())
			end)
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
						require("telescope").load_extension("ui-select"),
					},
				},
			})
		end,
	},
}
