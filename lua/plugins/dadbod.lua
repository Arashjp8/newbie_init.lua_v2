return {

	"tpope/vim-dadbod", -- Modern database interface for Vim
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
			-- Your DBUI configuration
			vim.g.db_ui_use_nerd_fonts = 1
			vim.g.dbs = {
				-- dev = "postgres://postgres:mypassword@localhost:5432/my-dev-db",
				-- staging = "postgres://postgres:mypassword@localhost:5432/my-staging-db",
				wp = "mysql://root@localhost/test",
				-- dockerpostgresboiler = "postgresql://backend:backend@0.0.0.0:5432/backend",
			}
		end,
	},
}
