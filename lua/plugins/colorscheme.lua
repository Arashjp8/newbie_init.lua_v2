return {
  "projekt0n/github-nvim-theme",
  name = "github-theme",
  lazy = false,   -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- Default options
    require("github-theme").setup({
      options = {
        -- Compiled file's destination location compile_path = vim.fn.stdpath("cache") .. "/github-theme",
        compile_file_suffix = "_compiled", -- Compiled file suffix
        hide_end_of_buffer = true,     -- Hide the '~' character at the end of the buffer for a cleaner look
        hide_nc_statusline = true,     -- Override the underline style for non-active statuslines
        transparent = true,            -- Disable setting bg (make neovim's background transparent)
        terminal_colors = true,        -- Set terminal colors (vim.g.terminal_color_*) used in :terminal
        dim_inactive = false,          -- Non focused panes set to alternative background
        module_default = true,         -- Default enable value for modules
        styles = {
          comments = "NONE",
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
      },
    })
    vim.cmd([[
      augroup CustomColors
      autocmd!
      autocmd ColorScheme * hi ColorColumn guibg=#14171C
      augroup END
    ]])
    vim.cmd([[
        augroup CustomCursorLine
        autocmd!
        autocmd ColorScheme * hi CursorLine guibg=NONE
        "autocmd ColorScheme * hi CursorLine guibg=#171B22
        augroup END
    ]])
    vim.cmd("colorscheme github_dark")
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#14171C" })
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#565f89", bg = "NONE" })
    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#14171C" })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#565f89", bg = "#14171C" })
    vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "#F78166", bold = true })
    vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#3e4452" })
    vim.api.nvim_set_hl(0, "TelescopeTitle", { fg = "#77BDFB", bold = true })
  end,
}

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
-- 		vim.cmd([[
--         augroup CustomColors
--         autocmd!
--         "autocmd ColorScheme * hi ColorColumn guibg=#16161E
--         autocmd ColorScheme * hi ColorColumn guibg=#1A1B26
--         "autocmd ColorScheme * hi ColorColumn guibg=#05070D
--         augroup END
--       ]])
-- 		vim.cmd([[
--         augroup CustomCursorLine
--         autocmd!
--         autocmd ColorScheme * hi CursorLine guibg=NONE
--         autocmd ColorScheme * hi CursorLineNr guifg=#a9b1d6 guibg=NONE
--         augroup END
--     ]])
-- 		vim.cmd("colorscheme tokyonight")
-- 		vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#0db9d7", bg = "NONE" })
-- 	end,
-- }
