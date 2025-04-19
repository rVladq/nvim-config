require "nvchad.mappings"

local map = vim.keymap.set

map('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })
map('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })

map('n', '<C-k>', vim.diagnostic.open_float)
map('n', '<leader>ca', vim.lsp.buf.code_action)
-- map('n', '<C-K>', vim.lsp.buf.signature_help)

map('i', '<C-c>', '<ESC>')
