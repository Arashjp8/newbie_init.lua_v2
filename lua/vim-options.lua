vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number relativenumber")
vim.cmd("set termbidi")

vim.cmd([[
  augroup CustomStatusLine
    autocmd!
    autocmd ColorScheme * lua vim.api.nvim_set_hl(0, "StatusLine", { fg = "#8a97b7", bg = "#16161e", bold = false})
    autocmd ColorScheme * lua vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "NONE", bg = "NONE" })
  augroup END
]])

vim.g.mapleader = " "

vim.g.netrw_banner = 0

vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 10
vim.opt.ignorecase = true

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

-- vim.keymap.set("v", "<M-Down>", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "<M-Up>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>hl", ":nohlsearch<CR>")
vim.wo.number = true
