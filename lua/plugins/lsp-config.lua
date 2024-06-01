return {
  {
    "williamboman/mason.nvim",
    config = function() 
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "html",
          "cssls",
          "cssmodules_ls",
          "css_variables",
          "tailwindcss",
          "tsserver",
          "clangd",
          "bashls",
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.html.setup({})
      lspconfig.cssls.setup({})
      lspconfig.cssmodules_ls.setup({})
      lspconfig.css_variables.setup({})
      lspconfig.tailwindcss.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.clangd.setup({})
      lspconfig.bashls.setup({})
    end
  }
}
