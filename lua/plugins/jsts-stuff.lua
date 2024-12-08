return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      local hooks = require("ibl.hooks")
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      require("ibl").setup({ indent = { char = "▏" }, scope = { enabled = false } })
      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({})
    end,
  },
}

-- return {
--   {
--     "windwp/nvim-autopairs",
--     event = "InsertEnter",
--     config = function()
--       require("nvim-autopairs").setup({})
--     end,
--   },
--   {
--     "lukas-reineke/indent-blankline.nvim",
--     main = "ibl",
--     config = function()
--       local hooks = require("ibl.hooks")
--       -- create the highlight groups in the highlight setup hook, so they are reset
--       -- every time the colorscheme changes
--       require("ibl").setup({ indent = { char = "▏" }, scope = { enabled = false } })
--       hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
--     end,
--   },
--   {
--     "windwp/nvim-ts-autotag",
--     config = function()
--       require("nvim-ts-autotag").setup({})
--     end,
--   },
-- }
