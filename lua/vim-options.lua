-- NOTE: temp workaround
vim.hl = vim.highlight
---------------------------------------------------------------------
-- Basic Settings
---------------------------------------------------------------------
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
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
-- vim.opt.colorcolumn = "80"

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
