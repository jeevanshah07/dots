local M = {}

local utils = require "core.utils"

M.on_attach = function(client, bufnr)
   local vim_version = vim.version()

   if vim_version.minor > 7 then
      -- nightly
      client.server_capabilities.documentFormattingProvider = true
      client.server_capabilities.documentRangeFormattingProvider = true
   else
      -- stable
      client.resolved_capabilities.document_formatting = true
      client.resolved_capabilities.document_range_formatting = true
   end

   local lsp_mappings = utils.load_config().mappings.lspconfig
   utils.load_mappings({ lsp_mappings }, { buffer = bufnr })

   if client.server_capabilities.signatureHelpProvider then
      require("nvchad.ui.signature").setup(client)
   end
end



M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   -- lspservers with default config
   local servers = { "jedi_language_server", "pyright", "html", "cssls", "bashls", "clangd", "nimls", "emmet_ls", "tsserver" }

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
         flags = {
            debounce_text_changes = 150,
         },
      }
   end

end

return M
