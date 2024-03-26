local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup()
require('mason-lspconfig').setup {
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
    },
}

require('cmp_nvim_lsp').default_capabilities()
require 'cmp'.setup {
    sources = {
        { name = 'nvim_lsp' }
    }
}
