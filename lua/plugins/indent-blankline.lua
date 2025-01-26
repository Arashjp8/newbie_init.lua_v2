return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    local highlight = {
      "line",
    }
    local hooks = require("ibl.hooks")
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "line", { fg = "#30363D" })
    end)
    require("ibl").setup({
      indent = { char = "▏", highlight = highlight },
      scope = { enabled = false },
    })
  end,
}
