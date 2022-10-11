local M = {}

local plugin_conf = require "custom.plugins.configs"
local userPlugins = require "custom.plugins"
local override = require "custom.override"

M.plugins = {

   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
      statusline = {
        style = "slant"
      },
   },

   override = {
      ["kyazdani42/nvim-tree.lua"] = plugin_conf.nvimtree,
      ["nvim-treesitter/nvim-treesitter"] = plugin_conf.treesitter,
      ["williamboman/mason.nvim"] = override.mason,
   },

   user = userPlugins,
}

M.ui = {
  theme = "onedark",
}

M.mappings = require "custom.mappings"

return M
