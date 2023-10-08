-- Ensure lazy.nvim is installed
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

-- Install plugins
require("lazy").setup({

    -- Autopairs
    { 
        'windwp/nvim-autopairs', 
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup()
        end,
    },

    -- Git
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end,
    },

    -- Copilot
    {
        'github/copilot.vim',
        config = function()
            vim.cmd('imap <silent><script><expr> <leader><TAB> copilot#Accept("")')
            vim.cmd("let g:copilot_no_tab_map = v:true")
        end,
    },
    
    -- Lua Line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {'nvim-tree/nvim-web-devicons'},
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'gruvbox'
                }
            }
        end,
        
    },
    
    -- Colorschemes
    {
        -- Onedark
        {
            'navarasu/onedark.nvim',
            config = function()
                require('onedark').setup()
            end,
        },
        -- Gruvbox
        {
            'ellisonleao/gruvbox.nvim',
            config = function()
                require('gruvbox').setup()
            end,
        },
        config = function()
            -- Set the colorscheme
            vim.cmd('colorscheme gruvbox')
        end,
    },

    -- File explorer
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {"nvim-tree/nvim-web-devicons",},
        config = function()
            require("nvim-tree").setup{
                sort_by = "case_sensitive",
                view = {
                    width = 30,
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = true,
                },
            }
        end,
    },
    
    -- Treesitter
    { 
        'nvim-treesitter/nvim-treesitter', 
        build = ':TSUpdate',
        config = function()
            require 'nvim-treesitter.configs'.setup {
                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                -- Autotag for html files
                autotag = {
                    enable = true,
                }
            }
        end,
    },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim', 
        tag = '0.1.3',
        dependencies = {'nvim-lua/plenary.nvim',}
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<C-p>', builtin.git_files, {})
            vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>ps', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") })
            end)
        end,
    },

    -- Lsp
    {
        {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/nvim-cmp',
        'L3MON4D3/LuaSnip',

        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.on_attach(function(client, bufnr)
            -- see :help lsp-zero-keybindings
            lsp_zero.default_keymaps({buffer = bufnr})
            end)
            require('mason').setup({})
            require('mason-lspconfig').setup({
            ensure_installed = {

            },
            handlers = {
                lsp_zero.default_setup,
            },
            })
        end,
    },
})
