return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<Space><Space>", function()
				builtin.find_files({ hidden = true })
			end, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

			-- getting all refrences for the variable under cursor
			vim.keymap.set("n", "<leader>ic", function()
				builtin.lsp_incoming_calls()
			end, {})
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
