require "nvchad.options"

vim.o.cursorlineopt = 'both' -- to enable cursorline!
vim.o.number = true
vim.o.relativenumber = true
vim.o.clipboard = "unnamedplus"

vim.api.nvim_set_hl(0, "Visual", {
  bg = "#ff69b4", -- bright cyan
  fg = "#000000",
  bold = true,
})
