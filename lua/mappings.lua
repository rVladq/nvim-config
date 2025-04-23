require "nvchad.mappings"

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })
map('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })

map('n', '<C-k>', vim.diagnostic.open_float)
map('n', '<leader>ca', vim.lsp.buf.code_action)
-- map('n', '<C-K>', vim.lsp.buf.signature_help)

map('i', '<C-c>', '<ESC>')

map("n", "<leader>a", function()
  require("harpoon.mark").add_file()
end, opts)

map("n", "<C-e>", function()
  require("harpoon.ui").toggle_quick_menu()
end, opts)

map("n", "<C-q>", function()
  require("harpoon.ui").nav_file(1)
end, opts)

map("n", "<C-w>", function()
  require("harpoon.ui").nav_file(2)
end, opts)

map("n", "<C-e>", function()
  require("harpoon.ui").nav_file(3)
end, opts)

map("n", "<C-r>", function()
  require("harpoon.ui").nav_file(4)
end, opts)

map("n", "<leader><Tab>", function()
  require("harpoon.ui").nav_next()
end, opts)

map("n", "<leader><S-Tab>", function()
  require("harpoon.ui").nav_prev()
end, opts)

vim.keymap.set('n', '<leader>r', [[:%s/\<<C-r><C-w>\>//g<Left><Left>]], { noremap = true })
