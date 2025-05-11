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
vim.fn.sign_define('DapBreakpoint', {
  text = '●',
  texthl = 'DapBreakpoint',
  linehl = '',
  numhl = 'DapBreakpoint'
})

vim.fn.sign_define('DapStopped', {
  text = '▶',
  texthl = 'DapStopped',
  linehl = 'DapStoppedLine',
  numhl = 'DapStopped'
})

vim.cmd [[
  highlight DapBreakpoint guifg=#FF5555 gui=bold
  highlight DapStopped guifg=#00FF00 gui=bold
  highlight DapStoppedLine guibg=#222244
]]

vim.opt.showtabline = 0
