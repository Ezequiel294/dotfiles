return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require('toggleterm').setup()
        vim.keymap.set('n', '<leader><CR>', ':ToggleTerm size=100 direction=vertical<CR>')
    end,
}
