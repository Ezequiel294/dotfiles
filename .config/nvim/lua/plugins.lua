local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

    'lewis6991/gitsigns.nvim',
    'github/copilot.vim',
    'goolord/alpha-nvim',
    'windwp/nvim-autopairs',
    'nvim-lualine/lualine.nvim',
    'navarasu/onedark.nvim',
    'ellisonleao/gruvbox.nvim',
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

    -- telescope
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.3',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- lsp
    {
        { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/nvim-cmp',
        'L3MON4D3/LuaSnip',
    },
})
