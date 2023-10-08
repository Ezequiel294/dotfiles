vim.g.mapleader = ' '

-- file explorer
vim.keymap.set('n', '<leader>fe', vim.cmd.Ex)
vim.keymap.set('n', '<C-v>', vim.cmd.vsp)

-- Exit insert mode
vim.keymap.set("i", "jk", "<ESC>")

-- Save and exit files
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":wq!<CR>")

-- Clear buffer
vim.keymap.set("n", "<leader>bd", ":bd<CR>")

-- Better tabbing
vim.keymap.set("v", "<TAB>", ">gv")
vim.keymap.set("v", "<S-TAB>", "<gv")

-- Move selected line up and down
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv")
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv")

-- Better window navigation
vim.keymap.set("n", "<M-h>", "<C-w>h")
vim.keymap.set("n", "<M-j>", "<C-w>j")
vim.keymap.set("n", "<M-k>", "<C-w>k")
vim.keymap.set("n", "<M-l>", "<C-w>l")

-- TAB cicles buffers
vim.keymap.set("n", "<TAB>", ":bnext<CR>")
vim.keymap.set("n", "<S-TAB>", ":bprevious<CR>")
