-- EXAMPLE 
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig" 

local servers = { "ts_ls", "html", "cssls", "ruff", "pyright", "texlab" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
