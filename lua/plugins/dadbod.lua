return {

	"tpope/vim-dadbod",
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			vim.g.db_ui_use_nerd_fonts = 1
			vim.g.dbs = {
				-- dev = "postgres://postgres:mypassword@localhost:5432/my-dev-db",
				-- staging = "postgres://postgres:mypassword@localhost:5432/my-staging-db",
				wp = "mariadb://root@localhost/test",
				-- dockerpostgresboiler = "postgresql://backend:backend@0.0.0.0:5432/backend",
			}
		end,

		-- vim.keymap.set("n", "<leader>du", ":DBUI<CR>"),
		vim.keymap.set("n", "<leader>db", ":DBUIToggle<CR>"),
		-- vim.keymap.set("n", "<leader>da", ":DBUIAddConnection<CR>")
		-- vim.keymap.set("n", "<leader>df", ":DBUIFindBuffer<CR>")
	},
}
