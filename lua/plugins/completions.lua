---------------------------------------------------------------------
-- Plugin Configuration: nvim-cmp LSP source
---------------------------------------------------------------------
return {
  {
    "hrsh7th/cmp-nvim-lsp",
  },

  ---------------------------------------------------------------------
  -- Plugin for LuaSnip with dependencies for better snippet support
  ---------------------------------------------------------------------
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",  -- Dependency for LuaSnip integration with nvim-cmp
      "rafamadriz/friendly-snippets", -- Additional snippets for LuaSnip
    },
  },

  ---------------------------------------------------------------------
  -- Plugin for nvim-cmp with custom configuration
  ---------------------------------------------------------------------
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      -- Load VSCode style snippets
      require("luasnip.loaders.from_vscode").lazy_load()
      cmp.setup({
        ---------------------------------------------------------------------
        -- Snippet settings for nvim-cmp
        ---------------------------------------------------------------------
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        ---------------------------------------------------------------------
        -- Window settings for completion and documentation
        ---------------------------------------------------------------------
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        ---------------------------------------------------------------------
        -- Key mapping for completion actions
        ---------------------------------------------------------------------
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),      -- Scroll docs up
          ["<C-f>"] = cmp.mapping.scroll_docs(4),       -- Scroll docs down
          ["<C-Space>"] = cmp.mapping.complete(),       -- Trigger completion
          ["<C-e>"] = cmp.mapping.abort(),              -- Abort completion
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm completion
        }),

        ---------------------------------------------------------------------
        -- Sources for completion suggestions
        ---------------------------------------------------------------------
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, -- LSP source
          { name = "luasnip" }, -- LuaSnip source
        }, {
          { name = "buffer" }, -- Buffer source
        }),

        ---------------------------------------------------------------------
        -- Formatting settings for completion items
        ---------------------------------------------------------------------
        -- NOTE: installed in lua/plugins/jsts-stuff.lua file
        formatting = {
          format = require("tailwindcss-colorizer-cmp").formatter, -- Tailwind CSS colorizer
          fields = { "abbr", "kind", "menu" },
          expandable_indicator = true,                        -- Show expandable indicator for snippets
        },
      })

      ---------------------------------------------------------------------
      -- SQL completion configuration
      ---------------------------------------------------------------------
      cmp.setup.filetype({ "sql" }, {
        sources = {
          { name = "vim-dadbod-completion" },
          { name = "buffer" },
        },
      })
    end,
  },
}
