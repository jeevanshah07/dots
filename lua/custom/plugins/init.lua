return {
  { "wakatime/vim-wakatime" },
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "javareact" },
    after = "nvim-treesitter",
    config = function()
       require("nvim-ts-autotag").setup()
    end,
  },
  { "williamboman/nvim-lsp-installer", 
     config = function()
         local lsp_installer = require "nvim-lsp-installer"

         lsp_installer.on_server_ready(function(server)
            local opts = {}

            server:setup(opts)
            vim.cmd [[ do User LspAttachBuffers ]]
         end)
      end,
 },

  { "Pocco81/AutoSave.nvim", 
      config = function()
      local autosave = require "autosave"

      autosave.setup {
         enabled = true,
         execution_message = "autosaved at : " .. vim.fn.strftime "%H:%M:%S",
         events = { "InsertLeave", "TextChanged" },
         conditions = {
            exists = true,
            filetype_is_not = {},
            modifiable = true,
         },
         clean_command_line_interval = 2500,
         on_off_commands = true,
         write_all_buffers = false,
      }
     end, 
  },
  { "sbdchd/neoformat" }
}
