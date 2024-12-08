return {
  "mbbill/undotree",
  config = function()
    vim.keymap.set("n", "<leader>u", function()
      vim.cmd.UndotreeToggle()
      if vim.fn.exists(":UndotreeFocus") == 2 then
        vim.cmd.UndotreeFocus()
      end
    end)
  end,
}
