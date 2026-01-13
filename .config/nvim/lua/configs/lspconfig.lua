require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

local servers = { "clangd", "ts_ls", "pyright", "html", "cssls", "ruff", "texlab" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.pyright.setup({
  on_attach = function(client, bufnr)
    -- Disable the specific mapping in insert mode
    vim.api.nvim_buf_set_keymap(bufnr, 'i', ',<space>', ',<space>', { noremap = true, silent = true })
  end
})
