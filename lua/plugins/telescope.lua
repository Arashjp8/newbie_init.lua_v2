return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<Space><Space>", function()
				builtin.find_files({
					hidden = true,
					-- Exclude node_modules folder from search
					file_ignore_patterns = { "node_modules" },
				})
			end, {})

			vim.keymap.set("n", "<leader>fg", function()
				builtin.live_grep()
			end, {})

			vim.keymap.set("n", "<leader>fr", function()
				builtin.lsp_references()
			end)

			vim.keymap.set("n", "<leader>fh", function()
				builtin.help_tags()
			end)
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				defaults = {
					layout_strategy = "flex",
					layout_config = {
						width = 0.99,
						height = 0.90,
						flip_columns = 120,
						horizontal = {
							prompt_position = "bottom",
						},
						vertical = {
							mirror = false,
						},
					},
					mappings = {
						i = {
							["<C-j>"] = require("telescope.actions").move_selection_next,
							["<C-k>"] = require("telescope.actions").move_selection_previous,
						},
						n = {
							["<C-j>"] = require("telescope.actions").move_selection_next,
							["<C-k>"] = require("telescope.actions").move_selection_previous,
						},
					},
				},
				extensions = {
					fzf = {},
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
						require("telescope").load_extension("ui-select"),
					},
					require("telescope").load_extension("fzf"),
				},
			})
		end,
	},
}
