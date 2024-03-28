return {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require("nvim-tree").setup({
            view = {
                side = "right",
            },
            filters = {
                dotfiles = true,
            },
        })
        vim.keymap.set('n', '<leader>fe', ':NvimTreeToggle<CR>')
    end
}
