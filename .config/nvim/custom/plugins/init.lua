return {
   ["goolord/alpha-nvim"] = {
     disable = true,
   },

   ["windwp/nvim-ts-autotag"] = {
      ft = { "html", "javascriptreact" },
      after = "nvim-treesitter",
      config = function()
         require("nvim-ts-autotag").setup()
      end,
   },

   ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require("custom.plugins.null-ls").setup()
      end,
   },

   ["nvim-telescope/telescope-media-files.nvim"] = {
      after = "telescope.nvim",
      config = function()
         require("telescope").setup {
            extensions = {
               media_files = {
                  filetypes = { "png", "webp", "jpg", "jpeg" },
               },
               -- fd is needed
            },
         }
         require("telescope").load_extension "media_files"
      end,
   },

   ["Pocco81/TrueZen.nvim"] = {
      cmd = {
         "TZAtaraxis",
         "TZMinimalist",
         "TZFocus",
      },
      config = function()
         require "custom.plugins.truezen"
      end,
   },

   ["Pocco81/AutoSave.nvim"] = {
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

  ["wakatime/vim-wakatime"] = {},

  ["folke/trouble.nvim"] = {
    config = function() 
      require("trouble").setup{}
  end,
  },

  ["nvim-neo-tree/neo-tree.nvim"] = {
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  },

  ["hrsh7th/nvim-cmp"] = {},

  ['simrat39/symbols-outline.nvim'] = {},

  ['folke/todo-comments.nvim'] = {
    requires = {
      "nvim-lua/plenary.nvim"
    },
    config = function()
      require("custom.plugins.todo")
    end
  },

  [ "iamcco/markdown-preview.nvim"] = {
    run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown"
    },
  },

}
