return {
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("refactoring").setup()

			vim.keymap.set("x", "<leader>re", ":Refactor extract ")
			vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ")

			vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ")

			vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")

			vim.keymap.set("n", "<leader>rI", ":Refactor inline_func")

			vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
			vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")
		end,
	},
	{
		"saecki/live-rename.nvim",
		config = function()
			local live_rename = require("live-rename")
			live_rename.setup({
				-- Send a `textDocument/prepareRename` request to the server to
				-- determine the word to be renamed, can be slow on some servers.
				-- Otherwise fallback to using `<cword>`.
				prepare_rename = true,
				--- The timeout for the `textDocument/prepareRename` request and final
				--- `textDocument/rename` request when submitting.
				request_timeout = 1500,
				-- Make an initial `textDocument/rename` request to gather other
				-- occurences which are edited and use these ranges to preview.
				-- If disabled only the word under the cursor will have a preview.
				show_other_ocurrences = true,
				-- Try to infer patterns from the initial `textDocument/rename` request
				-- and use these to show hopefully better edit previews.
				use_patterns = true,
				keys = {
					submit = {
						{ "n", "<cr>" },
						{ "v", "<cr>" },
						{ "i", "<cr>" },
					},
					cancel = {
						{ "n", "<esc>" },
						{ "n", "q" },
					},
				},
				hl = {
					current = "CurSearch",
					others = "Search",
				},
			})
			vim.keymap.set("n", "<leader>rn", live_rename.rename, { desc = "LSP rename" })
		end,
	},
	-- BUG: on 28th of November plugin below had some buggs when executing :IncRename so I went with the one above
	-- {
	-- 	"smjonas/inc-rename.nvim",
	-- 	config = function()
	-- 		require("inc_rename").setup()
	--
	-- 		vim.keymap.set("n", "<leader>rn", function()
	-- 			return ":IncRename " .. vim.fn.expand("<cword>")
	-- 		end, { expr = true })
	-- 	end,
	-- },
}
