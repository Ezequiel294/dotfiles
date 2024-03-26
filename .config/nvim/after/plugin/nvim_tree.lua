require("nvim-tree").setup({
    view = {
        side = "right",
    },
    filters = {
        dotfiles = true,
    },
})
vim.keymap.set("n", "<leader>fe", ":NvimTreeToggle<CR>")
