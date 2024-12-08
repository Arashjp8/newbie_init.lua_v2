-- return {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {},
-- 	config = function()
-- 		require("tokyonight").setup({
-- 			on_highlights = function() end,
-- 			transparent = true,
-- 			style = "night",
-- 			styles = {
-- 				keywords = { italic = false },
-- 				comments = { italic = false },
-- 				floats = "dark",
-- 			},
-- 			on_colors = function() end,
-- 		})
-- 		vim.cmd.colorscheme("tokyonight-night")
-- 	end,
-- }

return {
  "projekt0n/github-nvim-theme",
  name = "github-theme",
  lazy = false,   -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- Default options
    require("github-theme").setup({
      options = {
        -- Compiled file's destination location
        compile_path = vim.fn.stdpath("cache") .. "/github-theme",
        compile_file_suffix = "_compiled", -- Compiled file suffix
        hide_end_of_buffer = true,     -- Hide the '~' character at the end of the buffer for a cleaner look
        hide_nc_statusline = true,     -- Override the underline style for non-active statuslines
        transparent = true,            -- Disable setting bg (make neovim's background transparent)
        terminal_colors = true,        -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
        dim_inactive = false,          -- Non focused panes set to alternative background
        module_default = true,         -- Default enable value for modules
        styles = {                     -- Style to be applied to different syntax groups
          comments = "NONE",           -- Value is any valid attr-list value `:help attr-list`
          functions = "NONE",
          keywords = "NONE",
          variables = "NONE",
          conditionals = "NONE",
          constants = "NONE",
          numbers = "NONE",
          operators = "NONE",
          strings = "NONE",
          types = "NONE",
        },
        inverse = { -- Inverse highlight for different types
          match_paren = false,
          visual = false,
          search = false,
        },
        darken = { -- Darken floating windows and sidebar-like windows
          floats = true,
          sidebars = {
            enable = true,
            list = {}, -- Apply dark background to specific windows
          },
        },
        modules = { -- List of various plugins and additional options
          -- ...
        },
      },
      palettes = {},
      specs = {},
      groups = {},
    })
    -- setup must be called before loading
    vim.cmd("colorscheme github_dark_dimmed")
  end,
}

-- return {
--   "Mofiqul/vscode.nvim",
--   priority = 1000,
--   config = function()
--     require("vscode").setup({
--       transparent = true,
--     })
--     vim.cmd.colorscheme("vscode")
--   end,
-- }

-- return {
-- 	"rose-pine/neovim",
-- 	name = "rose-pine",
-- 	config = function()
-- 		require("rose-pine").setup({
-- 			variant = "auto", -- auto, main, moon, or dawn
-- 			dark_variant = "main", -- main, moon, or dawn
-- 			dim_inactive_windows = false,
-- 			extend_background_behind_borders = true,
-- 			enable = {
-- 				terminal = true,
-- 				legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
-- 				migrations = true, -- Handle deprecated options automatically
-- 			},
-- 			styles = {
-- 				bold = true,
-- 				italic = false,
-- 				transparency = true,
-- 			},
-- 			groups = {
-- 				border = "muted",
-- 				link = "iris",
-- 				panel = "surface",
-- 				error = "love",
-- 				hint = "iris",
-- 				info = "foam",
-- 				note = "pine",
-- 				todo = "rose",
-- 				warn = "gold",
-- 				git_add = "foam",
-- 				git_change = "rose",
-- 				git_delete = "love",
-- 				git_dirty = "rose",
-- 				git_ignore = "muted",
-- 				git_merge = "iris",
-- 				git_rename = "pine",
-- 				git_stage = "iris",
-- 				git_text = "rose",
-- 				git_untracked = "subtle",
-- 				h1 = "iris",
-- 				h2 = "foam",
-- 				h3 = "rose",
-- 				h4 = "gold",
-- 				h5 = "pine",
-- 				h6 = "foam",
-- 			},
-- 			palette = {
-- 				-- Override the builtin palette per variant
-- 				moon = {
-- 					base = "#18191a",
-- 					overlay = "#363738",
-- 				},
-- 			},
-- 			highlight_groups = {
-- 				-- Comment = { fg = "foam" },
-- 				-- VertSplit = { fg = "muted", bg = "muted" },
-- 			},
-- 			before_highlight = function(group, highlight, palette)
-- 				-- Disable all undercurls
-- 				-- if highlight.undercurl then
-- 				--     highlight.undercurl = false
-- 				-- end
-- 				-- Change palette colour
-- 				-- if highlight.fg == palette.pine then
-- 				--     highlight.fg = palette.foam
-- 				-- end
-- 			end,
-- 		})
-- 		-- vim.cmd("colorscheme rose-pine")
-- 		-- vim.cmd("colorscheme rose-pine-main")
-- 		vim.cmd("colorscheme rose-pine-moon")
-- 		-- vim.cmd("colorscheme rose-pine-dawn")
-- 	end,
-- }
