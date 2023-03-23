local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = { "golangci_lint_ls", "gopls", "texlab", "sourcery", "jedi_language_server", "pylsp", "bashls", "html", "cssls", "emmet_ls", "clangd", "jsonls", "tsserver", "jdtls", "nimls" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig["pylsp"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {"E501"}
        }
      }
    }
  }
})
