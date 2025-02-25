return {
	{
		"quarto-dev/quarto-nvim",
		dependencies = {
			"jmbuhr/otter.nvim",
			"nvim-treesitter/nvim-treesitter",
			"jpalardy/vim-slime",
		},
		config = function()
			local quarto = require("quarto")
			local runner = require("quarto.runner")

			quarto.setup({
				debug = false,
				closePreviewOnExit = true,
				lspFeatures = {
					enabled = true,
					chunks = "curly",
					languages = { "r", "python", "julia", "bash", "html" },
					diagnostics = {
						enabled = true,
						triggers = { "BufWritePost" },
					},
					completion = {
						enabled = true,
					},
				},
				codeRunner = {
					enabled = true,
					default_method = "slime",
					ft_runners = {},
					never_run = { "yaml" },
				},
			})

			vim.keymap.set("n", "<leader>rc", runner.run_cell, { desc = "run cell", silent = false })
		end,
	},
}
