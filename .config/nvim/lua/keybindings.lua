vim.g.mapleader = " "

-- Vertical and horizontal split
vim.keymap.set("n", "<leader>v", vim.cmd.vsp)
vim.keymap.set("n", "<leader>h", vim.cmd.split)

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

-- CLose buffer
vim.keymap.set("n", "<leader>cb", ":bd<CR>")
vim.keymap.set("n", "<leader>db", ":bw<CR>")
