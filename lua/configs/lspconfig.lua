require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "csharp_ls", "arduino_language_server" }
local nvlsp = require "nvchad.configs.lspconfig"

vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
  callback = function()
    vim.diagnostic.show()
  end,
})

vim.diagnostic.config({
  virtual_text = true,
  update_in_insert = true,
})

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
