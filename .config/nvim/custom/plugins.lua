local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
  },

  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascriptreat" },
    after = "nvim-treesitter",
    config = function()
      require("custom.configs.smolconfigs").autotag()
    end,
  },

  {
    "wakatime/vim-wakatime",
    lazy = false,
  },

  {
    "Pocco81/auto-save.nvim",
    lazy = false,
    config = function()
      require("auto-save").setup {}
    end,
  },

  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {}
    end,
    cmd = "TroubleToggle"
  },

  {
    "hrsh7th/nvim-cmp",
  },

  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup()
    end,
    cmd = "SymbolsOutline"
  },

  {
    "folke/todo-comments.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("custom.configs.todo")
    end,
    lazy = false,
  },

  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    keys = { "<leader>md" },
  },

  {
    "sbdchd/neoformat",
    lazy = false,
  },

  {
    "f-person/git-blame.nvim",
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit"
  },

  {
    "alaviss/nim.nvim",
  },

  {
    "Exafunction/codeium.vim",
  },

  {
    "itchyny/vim-cursorword",
    lazy=false,
  },

  {
    "michaelb/sniprun",
    build="bash ./install.sh",
    lazy=false,
  }
}

return plugins
