return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason-lspconfig.nvim' },
        },
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()
            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)
            require('mason-lspconfig').setup({
                vim.keymap.set('n', '<leader>i', vim.lsp.buf.hover, {}),
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {}),
                vim.keymap.set('n', '<leader>fa', vim.lsp.buf.format, {}),
                ensure_installed = {
                    'pylsp',
                    'clangd',
                    'bashls',
                    'lua_ls',
                    'tsserver',
                    'jsonls',
                    'cssls',
                    'html',
                },
                handlers = {
                    lsp_zero.default_setup,
                }
            })
        end
    }
}
