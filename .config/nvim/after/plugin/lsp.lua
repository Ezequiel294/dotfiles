local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.setup()

vim.api.nvim_set_keymap('i', '<leader><CR>', 'compe#complete()', {expr = true})
