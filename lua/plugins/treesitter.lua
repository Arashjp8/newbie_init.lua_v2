return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      modules = {},
      sync_install = false,
      auto_install = true,
      ignore_install = {},
      ensure_installed = {
        "lua",
        "markdown",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "json",
        "bash",
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
