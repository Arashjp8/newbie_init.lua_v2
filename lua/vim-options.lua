---------------------------------------------------------------------
-- Basic Settings
---------------------------------------------------------------------
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number relativenumber")
vim.cmd("set termbidi")

---------------------------------------------------------------------
-- General Settings
---------------------------------------------------------------------
vim.g.mapleader = " "
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 25
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 10
vim.opt.ignorecase = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

vim.opt.cursorline = true
vim.cmd([[
  augroup CustomCursorLine
    autocmd!
    autocmd ColorScheme * hi CursorLine guibg=NONE
  augroup END
]])

vim.opt.colorcolumn = "80"
vim.cmd([[
  augroup CustomColors
  autocmd!
  autocmd ColorScheme * hi ColorColumn guibg=#16161e
  "autocmd ColorScheme * hi ColorColumn guibg=#0D0F13
  augroup END
]])

---------------------------------------------------------------------
-- Autocommand and Augroup Setup
---------------------------------------------------------------------
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local yank_group = augroup("HighlightYank", {})
autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

-- local custom_status_line_group = augroup("CustomStatusLine", {})
-- autocmd("ColorScheme", {
-- 	group = custom_status_line_group,
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.api.nvim_set_hl(0, "StatusLine", { fg = "#8a97b7", bg = "#16161e", bold = false })
-- 		-- vim.api.nvim_set_hl(0, "StatusLine", { fg = "#8a97b7", bg = "#0D0F13", bold = false })
-- 		vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "NONE", bg = "NONE" })
-- 	end,
-- })

---------------------------------------------------------------------
-- Status Line Configuration
---------------------------------------------------------------------
function _G.diagnostics()
	local buf = vim.api.nvim_get_current_buf()
	local diagnostics = vim.diagnostic.get(buf)

	local errors = #vim.tbl_filter(function(d)
		return d.severity == vim.diagnostic.severity.ERROR
	end, diagnostics)
	local warnings = #vim.tbl_filter(function(d)
		return d.severity == vim.diagnostic.severity.WARN
	end, diagnostics)
	local hints = #vim.tbl_filter(function(d)
		return d.severity == vim.diagnostic.severity.HINT
	end, diagnostics)

	return string.format("E:%d W:%d H:%d", errors, warnings, hints)
	-- Alternatively, use symbols for the status line (for a more visual approach)
	-- return string.format(" :%d  :%d  :%d", errors, warnings, hints)
end

-- vim.o.statusline = "%f %m %r %h%w[%{v:lua.diagnostics()}] %=%l,%c            %p%%"
vim.o.statusline = "%f %m %r %h%w%{v:lua.diagnostics()} %=%l,%c            %p%%"

-- Update the statusline when diagnostics change
vim.lsp.handlers["textDocument/publishDiagnostics"] = function(_, result, ctx, _)
	vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx)
	vim.cmd("redrawstatus") -- Force statusline redraw
end

---------------------------------------------------------------------
-- Visual Mode Mappings for Moving Lines
---------------------------------------------------------------------
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv")

---------------------------------------------------------------------
-- Center Screen on Scroll
---------------------------------------------------------------------
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

---------------------------------------------------------------------
-- Paste Over Visual Selection Without Yanking
---------------------------------------------------------------------
vim.keymap.set("x", "<leader>p", [["_dP]])

---------------------------------------------------------------------
-- Vim Pane Navigation
---------------------------------------------------------------------
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

---------------------------------------------------------------------
-- Quickfix List Navigation
---------------------------------------------------------------------
vim.keymap.set("n", "<M-j>", ":cnext<CR>", { silent = true, desc = "Go to the next item in the quickfix list" })
vim.keymap.set("n", "<M-k>", ":cprev<CR>", { silent = true, desc = "Go to the previous item in the quickfix list" })

---------------------------------------------------------------------
-- Clear Search Highlighting
---------------------------------------------------------------------
vim.keymap.set("n", "<leader>hl", ":nohlsearch<CR>")

---------------------------------------------------------------------
-- Line Numbers
---------------------------------------------------------------------
vim.wo.number = true
