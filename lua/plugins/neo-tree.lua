return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    local neo_tree = require("neo-tree")
    neo_tree.setup({
      window = {
        position = "left",
        width = 32,
      },
    })

    vim.keymap.set("n", "<leader>t", ":Neotree filesystem reveal left toggle<CR>", {})
  end,
}

-- return {
-- 	{
-- 		"nvim-tree/nvim-tree.lua",
-- 		dependencies = { "nvim-tree/nvim-web-devicons" },
-- 		config = function()
-- 			vim.g.loaded_netrw = 1
-- 			vim.g.loaded_netrwPlugin = 1
--
-- 			require("nvim-tree").setup({})
--
-- 			-- vim.keymap.set("n", "<c-t>", ":NvimTreeFindFile<CR>")
-- 			vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>")
-- 		end,
-- 	},
-- }
