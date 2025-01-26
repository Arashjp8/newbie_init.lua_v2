---------------------------------------------------------------------
-- Plugin Configuration: nvim-treesitter
---------------------------------------------------------------------
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    ---------------------------------------------------------------------
    -- Treesitter Configuration
    ---------------------------------------------------------------------
    local config = require("nvim-treesitter.configs")
    config.setup({
      modules = {},
      sync_install = false,
      auto_install = true,
      ignore_install = {},
      ensure_installed = {
        "vimdoc",
        "lua",
        "markdown",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "jsdoc",
        "yaml",
        "json",
        "bash",
        "sql",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        custom_captures = {},
      },
      indent = { enable = true },
    })

    ---------------------------------------------------------------------
    -- Auto Commands for Custom Highlights
    ---------------------------------------------------------------------
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        -- NOTE: this is only for github dark theme
        -- #0D1117
        -- #161B22
        -- #21262D
        -- #89929B
        -- #C6CDD5
        -- #ECF2F8
        -- #FA7970
        -- #FAA356
        -- #7CE38B
        -- #A2D2FB
        -- #77BDFB
        -- #CEA5FB
        if
            vim.g.colors_name == "github_dark"
            or vim.g.colors_name == "github_dark_high_contrast"
            or vim.g.colors_name == "github_dark_dimmed"
        then
          -- vim.api.nvim_set_hl(0, "@lsp.type.parameter.typescriptreact", { fg = "#ecf2f8" })
          -- vim.api.nvim_set_hl(0, "@variable.parameter", { fg = "#FAA356" })
        end
      end,
    })
  end,
}
