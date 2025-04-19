return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "c_sharp"
      },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    config = require("configs.gitsigns")
  },

  {
    'tpope/vim-fugitive',
    lazy = false,
    -- config = require("configs.fugitive")
  },

  {
    'rmagatti/auto-session',
    lazy = false,

    opts = require("configs.auto-session")
  },

}
