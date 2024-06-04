return {
	"rockyzhang24/arctic.nvim",
	dependencies = { "rktjmp/lush.nvim" },
	name = "arctic",
	branch = "v2",
	priority = 1000,
	config = function()
		vim.cmd("colorscheme arctic")
	end,
}

-- return {
-- 	{
-- 		"catppuccin/nvim",
-- 		lazy = false,
-- 		name = "catppuccin",
-- 		priority = 1000,
-- 		config = function()
-- 			vim.cmd.colorscheme("catppuccin-mocha")
-- 		end,
-- 	},
-- }

-- return {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {},
-- 	config = function()
-- 		vim.cmd.colorscheme("tokyonight-night")
-- 	end,
-- }

-- return {
--   "rose-pine/neovim",
--   name = "rose-pine",
--   config = function()
--     require("rose-pine").setup({
--       disable_background = true,
--       styles = {
--         italic = false,
--       },
--     })
--
--     vim.cmd("colorscheme rose-pine-moon")
--   end,
-- }
