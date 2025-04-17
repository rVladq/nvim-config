require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })
map('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })

map('n', '<C-k>', vim.diagnostic.open_float)

map('i', '<C-c>', '<ESC>')
