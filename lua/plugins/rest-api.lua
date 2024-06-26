return {
	"javiorfo/nvim-ship",
	lazy = true,
	ft = "ship",
	cmd = { "ShipCreate", "ShipCreateEnv" },
	dependencies = {
		"javiorfo/nvim-spinetta",
		"javiorfo/nvim-popcorn",
		"hrsh7th/nvim-cmp", -- nvim-cmp is optional
	},
	opts = {
		-- Not necessary. Only if you want to change the setup.
		-- The following are the default values

		request = {
			timeout = 30,
			autosave = true,
		},
		response = {
			show_headers = "all",
			window_type = "h",
			size = 20,
			redraw = true,
		},
		output = {
			save = false,
			override = true,
			folder = "output",
		},
		internal = {
			log_debug = false,
		},
	},
	config = function()
		require("ship").setup({
			-- Mapping bound to user init.lua
			vim.api.nvim_set_keymap("n", "<leader>sh", "<cmd>Ship<CR>", { noremap = true, silent = true }),
			-- Mapping bound to user init.lua
			vim.api.nvim_set_keymap("n", "<leader>sc", "<cmd>ShipCloseResponse<CR>", { noremap = true, silent = true }),
		})
	end,
}
