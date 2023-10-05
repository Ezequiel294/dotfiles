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

    -- Git
    'lewis6991/gitsigns.nvim',

    -- Copilot
    'github/copilot.vim',
    
    -- Lua Line
    'nvim-lualine/lualine.nvim',
    
    -- Colorschemes
    'navarasu/onedark.nvim',
    'ellisonleao/gruvbox.nvim',
    
    -- Treesitter
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    
    -- Indent Guides
    { "lukas-reineke/indent-blankline.nvim", main = "ibl" },

    -- Autopairs
    { 'windwp/nvim-autopairs', event = "InsertEnter"},

    -- Telescope
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- Lsp
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
