-- This is an example chadrc file , its supposed to be placed in /lua/custom/

local M = {}
local userPlugins = require "custom.plugins"

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.plugins = {
  options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },
   install = userPlugins, 
}

-- so setup_lspconf = "custom.plugins.lspconfig" as per our example

M.ui = {
   theme = "wombat",
}

return M
