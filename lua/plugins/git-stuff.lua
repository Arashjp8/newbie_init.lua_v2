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

					-- Add changes
					vim.keymap.set("n", "<leader>a", function()
						vim.cmd.Git("add .")
					end, opts)

					-- Commit changes
					vim.keymap.set("n", "<leader>c", function()
						vim.cmd.Git("commit")
					end, opts)

					-- Push changes
					vim.keymap.set("n", "<leader>p", function()
						vim.cmd.Git("push")
					end, opts)

					-- Pull with rebase always
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

			vim.keymap.set("n", "<leader>gd", ":Gitsigns preview_hunk<CR>", {})
			vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", {})
		end,
	},
	{
		"isakbm/gitgraph.nvim",
		dependencies = { "sindrets/diffview.nvim" },
		opts = {
			git_cmd = "git",
			symbols = {
				merge_commit = "M",
				commit = "*",
			},
			format = {
				timestamp = "%H:%M:%S %d-%m-%Y",
				fields = { "hash", "timestamp", "author", "branch_name", "tag" },
			},
			hooks = {
				-- on_select_commit = function(commit)
				-- 	print("selected commit:", commit.hash)
				-- end,
				-- on_select_range_commit = function(from, to)
				-- 	print("selected range:", from.hash, to.hash)
				-- end,
				-- Check diff of a commit
				on_select_commit = function(commit)
					vim.notify("DiffviewOpen " .. commit.hash .. "^!")
					vim.cmd(":DiffviewOpen " .. commit.hash .. "^!")
				end,
				-- Check diff from commit a -> commit b
				on_select_range_commit = function(from, to)
					vim.notify("DiffviewOpen " .. from.hash .. "~1.." .. to.hash)
					vim.cmd(":DiffviewOpen " .. from.hash .. "~1.." .. to.hash)
				end,
			},
		},
		keys = {
			{
				"<leader>gl",
				function()
					require("gitgraph").draw({}, { all = true, max_count = 5000 })
				end,
				desc = "GitGraph - Draw",
			},
		},
	},
}
