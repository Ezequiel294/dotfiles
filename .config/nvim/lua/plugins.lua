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

    -- Copilot
    'github/copilot.vim',

    -- Lua Line
    'nvim-lualine/lualine.nvim',

    -- Telescope UI Select
    'nvim-telescope/telescope-ui-select.nvim',

    -- Git
    'lewis6991/gitsigns.nvim',
    'tpope/vim-fugitive',

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },

    -- Autopairs
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter"
    },

    -- Nvim Tree
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.3',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- Colorschemes
    'navarasu/onedark.nvim',
    'ellisonleao/gruvbox.nvim',
    { 'rose-pine/neovim', name = 'rose-pine' },
    { "catppuccin/nvim",  name = "catppuccin", priority = 1000 },

    -- Lsp
    {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'L3MON4D3/LuaSnip',
        'hrsh7th/nvim-cmp',
        { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
    },
})
