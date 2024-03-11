local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = { "golangci_lint_ls", "gopls", "texlab", "ruff_lsp", "bashls", "html", "cssls", "clangd", "pyright", "rust_analyzer", "jsonls", "tsserver", "jdtls", "nimls" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
