return {
    'nvim-lualine/lualine.nvim',
    config = function()
        local requires = { 'nvim-tree/nvim-web-devicons', opt = true }
        require('lualine').setup {
            options = {
                theme = 'auto',
            }
        }
    end
}
