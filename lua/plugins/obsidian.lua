return {
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
		-- event = {
		-- 	-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		-- 	-- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
		-- 	-- refer to `:h file-pattern` for more examples
		-- 	"BufReadPre ~/MyBrain/*.md",
		-- 	"BufNewFile ~/MyBrain/*.md",
		-- },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("obsidian").setup({
				ui = { enable = false },
				workspaces = {
					{
						name = "personal",
						path = "~/MyBrain",
					},
					-- {
					-- 	name = "work",
					-- 	path = "~/vaults/work",
					-- },
				},
				templates = {
					folder = "Templates",
					date_format = "%d-%b-%Y",
					time_format = "%H:%M",
					default = "",
				},
			})

			vim.keymap.set("n", "<leader>md", function()
				vim.cmd("set conceallevel=2")
				print("Conceal Level set to 2")
			end, { desc = "Set conceallevel=2" })

			vim.keymap.set("n", "<leader>ot", ":ObsidianTags<CR>")
			vim.keymap.set("n", "<leader>oT", ":ObsidianTemplate<CR>")
			vim.keymap.set("n", "<leader>oc", ":ObsidianTOC<CR>")
			vim.keymap.set("v", "<leader>ol", ":ObsidianLink<CR>")
		end,
	},
	{
		"folke/zen-mode.nvim",
		opts = {},
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		opts = {
			code = {
				sign = false,
				width = "block",
				right_pad = 1,
				language_name = false,
			},
			heading = {
				enabled = false,
				sign = false,
				icons = {},
			},
			checkbox = {
				enabled = false,
			},
		},
	},
}
