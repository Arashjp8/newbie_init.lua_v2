return {
  "Djancyp/better-comments.nvim",
  config = function()
    require("better-comment").Setup()
  end,
}

-- return {
-- 	"folke/todo-comments.nvim",
-- 	dependencies = { "nvim-lua/plenary.nvim" },
-- 	config = function()
-- 		require("todo-comments").setup()
--
-- 		vim.keymap.set("n", "<leader>tt", ":TodoTelescope<CR>")
-- 	end,
-- }

-- PERF: fully optimized
-- HACK: hmm, this looks a bit funky
-- TODO: what else?
-- NOTE: adding a note
-- FIX: this needs fixing
-- WARNING: ???
-- ! mooooo
