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

map("n", "<leader>j", function()
  require("harpoon.ui").toggle_quick_menu()
end, opts)

map("n", "<leader>1", function()
  require("harpoon.ui").nav_file(1)
end, opts)

map("n", "<leader>2", function()
  require("harpoon.ui").nav_file(2)
end, opts)

map("n", "<leader>3", function()
  require("harpoon.ui").nav_file(3)
end, opts)

map("n", "<leader>4", function()
  require("harpoon.ui").nav_file(4)
end, opts)

vim.keymap.set('n', '<leader>r', [[:%s/\C\<<C-r><C-w>\>//g<Left><Left>]], { noremap = true })



local dap = require "dap"

vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

-- Eval var under cursor
vim.keymap.set("n", "<space>?", function()
  require("dapui").eval(nil, { enter = true })
end)

vim.keymap.set("n", "<F1>", dap.continue)
vim.keymap.set("n", "<F2>", dap.step_into)
vim.keymap.set("n", "<F3>", dap.step_over)
vim.keymap.set("n", "<F4>", dap.step_out)
vim.keymap.set("n", "<F5>", dap.step_back)
vim.keymap.set("n", "<F12>", dap.restart)
