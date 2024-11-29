vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number relativenumber")
vim.cmd("set termbidi")

vim.g.mapleader = " "

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

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>hl", ":nohlsearch<CR>")
vim.wo.number = true
