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
        }
      })
      
      vim.keymap.set('n', '<leader>t', ":Neotree filesystem reveal left toggle<CR>", {})
    end,
}
