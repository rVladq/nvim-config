require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "csharp_ls", "arduino_language_server", "ts_ls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
--   callback = function()
--     vim.diagnostic.show()
--   end,
-- })

vim.api.nvim_set_hl(0, 'DiagnosticUnnecessary', { fg = '#a29bfe', italic = true })

vim.diagnostic.config({
  virtual_text = true,
  update_in_insert = true,
})

local orig_virtual_text = vim.diagnostic.handlers.virtual_text

vim.diagnostic.handlers.virtual_text = {
  show = function(namespace, bufnr, diagnostics, opts)
    local filtered_diags = {}
    for _, diag in ipairs(diagnostics) do
      if diag.severity ~= vim.diagnostic.severity.WARN then
        table.insert(filtered_diags, diag)
      end
    end
    orig_virtual_text.show(namespace, bufnr, filtered_diags, opts)
  end,
  hide = function(namespace, bufnr)
    orig_virtual_text.hide(namespace, bufnr)
  end,
}

vim.keymap.set('n', '<leader>R', vim.lsp.buf.rename)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {
    border = "rounded"
  }
)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = "rounded" -- or "single", "double", "shadow", etc
  }
)

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
