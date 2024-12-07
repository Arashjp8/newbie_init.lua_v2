return {
	{
		"tpope/vim-fugitive",

		vim.keymap.set("n", "<leader>gs", vim.cmd.Git),

		config = function()
			local Arash_Fugitive = vim.api.nvim_create_augroup("Arash_Fugitive", {})

			local autocmd = vim.api.nvim_create_autocmd
			autocmd("BufWinEnter", {
				group = Arash_Fugitive,
				pattern = "*",
				callback = function()
					if vim.bo.ft ~= "fugitive" then
						return
					end

					local bufnr = vim.api.nvim_get_current_buf()
					local opts = { buffer = bufnr, remap = false }

					vim.keymap.set("n", "<leader>a", function()
						vim.cmd.Git("add .")
					end, opts)

					-- Commit changes
					vim.keymap.set("n", "<leader>c", function()
						vim.cmd.Git("commit")
					end, opts)

					vim.keymap.set("n", "<leader>p", function()
						vim.cmd.Git("push")
					end, opts)

					-- rebase always
					vim.keymap.set("n", "<leader>P", function()
						vim.cmd.Git({ "pull", "--rebase" })
					end, opts)

					-- NOTE: It allows me to easily set the branch i am pushing and any tracking
					-- needed if i did not set the branch up correctly
					vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts)
				end,
			})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
			vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
		end,
	},
}
