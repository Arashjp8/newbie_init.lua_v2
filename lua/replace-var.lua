local function replace_variable_with_confirmation(varname, newvarname, filetype, directory)
	local find_cmd = "find " .. directory .. " -type f -name '*" .. filetype .. "'"
	local files = vim.fn.systemlist(find_cmd)

	if #files == 0 then
		print("No files found with the specified filetype: " .. filetype)
		return
	end

	local vimgrep_cmd = "vimgrep /" .. varname .. "/ " .. table.concat(files, " ")

	vim.cmd(vimgrep_cmd)
	vim.cmd("copen")

	local cdo_cmd = "cdo %s/" .. varname .. "/" .. newvarname .. "/gc"
	vim.cmd(cdo_cmd)

	vim.cmd("cclose")
end

vim.api.nvim_create_user_command("ReplaceVar", function(opts)
	local args = vim.split(opts.args, " ")
	if #args == 4 then
		replace_variable_with_confirmation(args[1], args[2], args[3], args[4])
	else
		print("Usage: :ReplaceVar <variableName> <newVariableName> <fileType> <directory>")
	end
end, { nargs = 1 })

_G.replace_variable = replace_variable_with_confirmation

vim.api.nvim_set_keymap(
	"n",
	"<leader>R",
	[[:lua replace_variable(vim.fn.input('Variable name: '), vim.fn.input('New variable name: '), vim.fn.input('File type: '), vim.fn.input('Directory: '))<CR>]],
	{ noremap = true, silent = true }
)
