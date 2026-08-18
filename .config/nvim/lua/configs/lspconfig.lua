local nvlsp = require "nvchad.configs.lspconfig"

local servers = {
  "jdtls",
  "arduino-language-server",
  "ty",
  "clangd",
  "ts_ls",
  "pyright",
  "html",
  "cssls",
  "ruff",
  "texlab",
  "zls",
}

for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })

  vim.lsp.enable(lsp)
end
