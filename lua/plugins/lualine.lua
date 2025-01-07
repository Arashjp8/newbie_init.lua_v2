return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		opts = function()
			local colors = {
				bg = "#16161E", -- background
				fg = "#a9b1d6", -- foreground
				yellow = "#e0af68",
				cyan = "#7dcfff",
				darkblue = "#414868", -- black
				green = "#73daca",
				orange = "#e0af68", -- reused yellow as orange is not explicitly in Tokyo Night
				violet = "#bb9af7", -- magenta
				magenta = "#bb9af7",
				blue = "#7aa2f7",
				red = "#f7768e",
				white = "#c0caf5", -- explicitly added white for potential use
			}

			local conditions = {
				buffer_not_empty = function()
					return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
				end,
				hide_in_width = function()
					return vim.fn.winwidth(0) > 80
				end,
				check_git_workspace = function()
					local filepath = vim.fn.expand("%:p:h")
					local gitdir = vim.fn.finddir(".git", filepath .. ";")
					return gitdir and #gitdir > 0 and #gitdir < #filepath
				end,
			}

			local config = {
				options = {
					icons_enabled = true,
					component_separators = "",
					section_separators = "",
					theme = {
						normal = { c = { fg = colors.fg, bg = colors.bg } },
						inactive = { c = { fg = colors.fg, bg = colors.bg } },
					},
				},
				sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_y = {},
					lualine_z = {},
					lualine_c = {},
					lualine_x = {},
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_y = {},
					lualine_z = {},
					lualine_c = {},
					lualine_x = {},
				},
			}

			local function ins_left(component)
				table.insert(config.sections.lualine_c, component)
			end

			local function ins_right(component)
				table.insert(config.sections.lualine_x, component)
			end

			ins_left({
				function()
					return "▊"
					-- return ""
				end,
				color = { fg = colors.blue },
				padding = { left = 0, right = 1 },
			})

			ins_left({
				function()
					local filetype_icon, _ =
						require("nvim-web-devicons").get_icon(vim.fn.expand("%:t"), vim.fn.expand("%:e"))
					local filename = vim.fn.expand("%:t")
					return filetype_icon .. " " .. filename
				end,
				color = { fg = nil },
				padding = { left = 0, right = 1 },
			})

			-- ins_left({
			--   "filetype",
			--   icons_enabled = true,
			--   icon_only = true,
			--   color = { fg = colors.white },
			-- })
			--
			-- ins_left({ "filename", color = { fg = colors.white } })

			ins_left({
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " " },
				diagnostics_color = {
					error = { fg = colors.red },
					warn = { fg = colors.yellow },
					info = { fg = colors.cyan },
				},
			})

			-- ins_left({
			--   function()
			--     return "%="
			--   end,
			-- })

			-- ins_right({
			--   "o:encoding",
			--   fmt = string.upper,
			--   cond = conditions.hide_in_width,
			--   color = { fg = colors.green, gui = "bold" },
			-- })

			-- ins_right({ "branch", icon = "", color = { fg = colors.violet, gui = "bold" } })

			-- ins_right({
			--   "diff",
			--   symbols = { added = " ", modified = "󰝤 ", removed = " " },
			--   diff_color = {
			--     added = { fg = colors.green },
			--     modified = { fg = colors.orange },
			--     removed = { fg = colors.red },
			--   },
			--   cond = conditions.hide_in_width,
			-- })

			ins_right({ "location" })
			ins_right({ "progress", color = { fg = colors.fg } })

			ins_right({
				function()
					return "▊"
					-- return ""
				end,
				color = { fg = colors.blue },
				padding = { left = 0 },
			})

			return config
		end,
	},
}
