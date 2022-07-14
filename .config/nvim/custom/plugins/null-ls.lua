local null_ls = require "null-ls"
local b = null_ls.builtins

local formatting = b.formatting
local diagnostics = b.diagnostics

local M = {}

M.setup = function()
   null_ls.setup {
      debug = true,
      sources = {
        formatting.black.with({ extra_args = { "--fast" } }),
        diagnostics.flake8.with({ extra_args = { "--extend-ignore=E501" }}),
        b.code_actions.refactoring,
      }
   }
end

return M
