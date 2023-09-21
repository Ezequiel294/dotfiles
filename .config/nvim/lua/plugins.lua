-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- git
    use 'lewis6991/gitsigns.nvim'

    -- github copilot
    use 'github/copilot.vim'

    -- alpha
    use 'goolord/alpha-nvim'

    -- auto pairs
    use "windwp/nvim-autopairs"

    -- lua line
    use 'nvim-lualine/lualine.nvim'

    -- indent guide lines
    use 'lukas-reineke/indent-blankline.nvim'

    -- colorscheme
    use 'navarasu/onedark.nvim'
    use 'ellisonleao/gruvbox.nvim'

    -- treesitter
    use('nvim-treesitter/nvim-treesitter',
        { run = ':TSUpdate' })

    -- telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- lsp
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },                  -- Required
            { 'hrsh7th/cmp-nvim-lsp' },              -- Required
            { 'L3MON4D3/LuaSnip' },                  -- Required
        }
    }
end)
