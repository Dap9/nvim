local M = {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        protols = {
          on_attach = require("plugins.lsp.config").on_attach(),
        },
      },
    },
  },

  -- Formatting
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "buf",
      },
    },
  },
  {
    "stevearc/conform.nvim",

    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
      formatters_by_ft = {
        proto = {
          "buf",
        },
      },
    },
  },
}

return M
