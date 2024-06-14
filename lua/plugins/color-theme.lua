function SetCustomBackground()
  vim.cmd("highlight Normal guibg=#1e1e1e")
end

-- return {
--   "rockyzhang24/arctic.nvim",
--   dependencies = { "rktjmp/lush.nvim" },
--   name = "arctic",
--   branch = "v2",
--   priority = 1000,
--   config = function()
--     vim.cmd("colorscheme arctic")
--   end,
-- }

-- return {
--   "navarasu/onedark.nvim",
--   priority = 1000,
--   config = function()
--     require("onedark").setup({
--       style = "warmer",
--     })
--     vim.cmd("colorscheme onedark")
--   end,
-- }

-- return {
--   {
--     "catppuccin/nvim",
--     lazy = false,
--     name = "catppuccin",
--     priority = 1000,
--     config = function()
--       require("catppuccin").setup({
--         color_overrides = {
--           mocha = {
--             base = "#1e1e1e",
--             mantle = "#252526",
--             crust = "#1e1e1e",
--           },
--         },
--       })
--       vim.cmd.colorscheme("catppuccin-mocha")
--     end,
--   },
-- }

return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("tokyonight").setup({
      style = "night",
      on_colors = function(colors)
        colors.bg = "#1e1e1e"   -- base
        colors.bg_dark = "#252526" -- mantle
        colors.bg_float = "#1e1e1e" -- crust
        colors.bg_statusline = "#252526"
        colors.bg_sidebar = "#1e1e1e"
        -- colors.git = {
        --   add = "#449dab",
        --   change = "#6183bb",
        --   delete = "#914c54",
        --   ignore = "#545c7e",
        -- },
        colors.gitSigns = {
          add = "#449dab",
          change = "#6183bb",
          delete = "#b2555b",
        }
      end,
    })
    vim.cmd.colorscheme("tokyonight-night")
  end,
}
