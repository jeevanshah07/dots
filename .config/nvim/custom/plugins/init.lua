return {

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  ["andreadev-it/shade.nvim"] = {
    module = "shade",
    config = function()
      require("custom.plugins.smolconfigs").shade()
    end,
  },

  ["lukas-reineke/indent-blankline.nvim"] = {},

  ["windwp/nvim-ts-autotag"] = {
    ft = { "html", "javascriptreact" },
    after = "nvim-treesitter",
    config = function()
      require("custom.plugins.smolconfigs").autotag()
    end,
  },

  ["goolord/alpha-nvim"] = {
    disable = true,
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

	["Pocco81/auto-save.nvim"] = {
    config = function()
      require("auto-save").setup {
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
  ['simrat39/symbols-outline.nvim'] = {
    config = function ()
      require("symbols-outline").setup()
    end
  },
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

  ["sbdchd/neoformat"] = {},
}
