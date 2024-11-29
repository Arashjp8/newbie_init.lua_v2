return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("tokyonight").setup({
      transparent = true,
      style = "night",
      styles = {
        keywords = { italic = true },
      },
      on_colors = function(colors)
        -- -- colors.bg = "#1e1e1e"
        -- colors.bg = "#1f2329"
        -- -- colors.bg = "#121212"
        -- -- colors.bg_dark = "#252526"
        -- colors.bg_dark = "#282c34"
        -- -- colors.bg_float = "#1e1e1e"
        -- colors.bg_float = "#1f2329"
        -- -- colors.bg_statusline = "#252526"
        -- colors.bg_statusline = "#282c34"
        -- -- colors.bg_sidebar = "#1e1e1e"
        -- colors.bg_sidebar = "#1f2329"
        colors.git = {
          add = "#73daca", -- Brighter teal
          change = "#7aa2f7", -- Brighter blue
          delete = "#f7768e", -- Vibrant red
          ignore = "#737aa2", -- Softer, brighter gray-blue
          -- add = "#449dab",
          -- change = "#6183bb",
          -- delete = "#914c54",
          -- ignore = "#545c7e",
        }
        colors.gitSigns = {
          add = "#449dab",
          change = "#6183bb",
          delete = "#b2555b",
        }
        -- colors.bg_visual = "#283457" -- original color
      end,
    })
    vim.cmd.colorscheme("tokyonight-night")
  end,
}

-- return {
-- 	"projekt0n/github-nvim-theme",
-- 	name = "github-theme",
-- 	lazy = false, -- make sure we load this during startup if it is your main colorscheme
-- 	priority = 1000, -- make sure to load this before all the other start plugins
-- 	config = function()
-- 		require("github-theme").setup({
-- 			options = {
-- 				transparent = true,
-- 			},
-- 		})
-- 		-- vim.cmd("colorscheme github_dark_dimmed")
-- 		vim.cmd("colorscheme github_dark_default")
-- 	end,
-- }

-- return {
-- 	"HoNamDuong/hybrid.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {},
-- 	config = function()
-- 		-- Default options:
-- 		require("hybrid").setup({
-- 			terminal_colors = true,
-- 			undercurl = true,
-- 			underline = true,
-- 			bold = true,
-- 			italic = {
-- 				strings = false,
-- 				emphasis = true,
-- 				comments = true,
-- 				folds = true,
-- 			},
-- 			strikethrough = true,
-- 			inverse = true,
-- 			transparent = false,
-- 		})
-- 		vim.cmd.colorscheme("hybrid")
-- 	end,
-- }

-- return {
-- 	"Mofiqul/vscode.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		require("vscode").setup({
-- 			transparent = true,
-- 		})
-- 		vim.cmd.colorscheme("vscode")
-- 	end,
-- }

-- return {
--   "navarasu/onedark.nvim",
--   priority = 1000,
--   config = function()
--     require("onedark").setup({
--       transparent = true,
--       -- style = "warm",
--       -- style = "warmer",
--       -- style = "dark",
--       style = "darker",
--     })
--     vim.cmd("colorscheme onedark")
--   end,
-- }

-- return {
--   "rose-pine/neovim",
--   name = "rose-pine",
--   config = function()
--     require("rose-pine").setup({
--       variant = "auto",   -- auto, main, moon, or dawn
--       dark_variant = "main", -- main, moon, or dawn
--       dim_inactive_windows = false,
--       extend_background_behind_borders = true,
--       enable = {
--         terminal = true,
--         legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
--         migrations = true,    -- Handle deprecated options automatically
--       },
--       styles = {
--         bold = true,
--         italic = false,
--         transparency = true,
--       },
--       groups = {
--         border = "muted",
--         link = "iris",
--         panel = "surface",
--         error = "love",
--         hint = "iris",
--         info = "foam",
--         note = "pine",
--         todo = "rose",
--         warn = "gold",
--         git_add = "foam",
--         git_change = "rose",
--         git_delete = "love",
--         git_dirty = "rose",
--         git_ignore = "muted",
--         git_merge = "iris",
--         git_rename = "pine",
--         git_stage = "iris",
--         git_text = "rose",
--         git_untracked = "subtle",
--         h1 = "iris",
--         h2 = "foam",
--         h3 = "rose",
--         h4 = "gold",
--         h5 = "pine",
--         h6 = "foam",
--       },
--       palette = {
--         -- Override the builtin palette per variant
--         -- moon = {
--         --     base = '#18191a',
--         --     overlay = '#363738',
--         -- },
--       },
--       highlight_groups = {
--         -- Comment = { fg = "foam" },
--         -- VertSplit = { fg = "muted", bg = "muted" },
--       },
--       before_highlight = function(group, highlight, palette)
--         -- Disable all undercurls
--         -- if highlight.undercurl then
--         --     highlight.undercurl = false
--         -- end
--         -- Change palette colour
--         -- if highlight.fg == palette.pine then
--         --     highlight.fg = palette.foam
--         -- end
--       end,
--     })
--     -- vim.cmd("colorscheme rose-pine")
--     vim.cmd("colorscheme rose-pine-main")
--     -- vim.cmd("colorscheme rose-pine-moon")
--     -- vim.cmd("colorscheme rose-pine-dawn")
--   end,
-- }

-- return {
-- 	"ellisonleao/gruvbox.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		require("gruvbox").setup({
-- 			terminal_colors = true, -- add neovim terminal colors
-- 			undercurl = true,
-- 			underline = true,
-- 			bold = true,
-- 			italic = {
-- 				strings = true,
-- 				emphasis = true,
-- 				comments = true,
-- 				operators = false,
-- 				folds = true,
-- 			},
-- 			strikethrough = true,
-- 			invert_selection = false,
-- 			invert_signs = false,
-- 			invert_tabline = false,
-- 			invert_intend_guides = false,
-- 			inverse = true, -- invert background for search, diffs, statuslines and errors
-- 			contrast = "", -- can be "hard", "soft" or empty string
-- 			palette_overrides = {},
-- 			overrides = {},
-- 			dim_inactive = false,
-- 			transparent_mode = false,
-- 		})
-- 		vim.cmd("colorscheme gruvbox")
-- 	end,
-- }

-- return {
-- 	{
-- 		"catppuccin/nvim",
-- 		lazy = false,
-- 		name = "catppuccin",
-- 		priority = 1000,
-- 		config = function()
-- 			require("catppuccin").setup({
-- 				transparent_background = true,
-- 				color_overrides = {
-- 					-- mocha = {
-- 					-- 	base = "#1f1f1f",
-- 					-- 	mantle = "#252526",
-- 					-- 	crust = "#1f1f1f",
-- 					-- },
-- 					-- macchiato = {
-- 					-- 	base = "#1f1f1f",
-- 					-- 	mantle = "#252526",
-- 					-- 	crust = "#1f1f1f",
-- 					-- },
-- 				},
-- 			})
-- 			vim.cmd.colorscheme("catppuccin-mocha")
-- 		end,
-- 	},
-- }
