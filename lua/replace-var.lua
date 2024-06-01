local function replace_variable(varname, newvarname)
  local find_cmd = "find . -type f"
  local files = vim.fn.systemlist(find_cmd)
  local vimgrep_cmd = "vimgrep /" .. varname .. "/ " .. table.concat(files, " ")

  vim.cmd(vimgrep_cmd)

  vim.cmd("copen")

  local cdo_cmd = "cdo %s/" .. varname .. "/" .. newvarname .. "/gc"
  vim.cmd(cdo_cmd)

  vim.cmd("cclose")
end

vim.api.nvim_create_user_command("ReplaceVar", function(opts)
  local args = vim.split(opts.args, " ")
  if #args == 2 then
    replace_variable(args[1], args[2])
  else
    print("Usage: :ReplaceVar <variableName> <newVariableName>")
  end
end, { nargs = 1 })

_G.replace_variable = replace_variable

vim.api.nvim_set_keymap(
  "n",
  "<leader>rv",
  [[:lua replace_variable(vim.fn.input('Variable name: '), vim.fn.input('New variable name: '))<CR>]],
  { noremap = true, silent = true }
)
