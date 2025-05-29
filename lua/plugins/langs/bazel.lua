local M = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "buildifier",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
      formatters_by_ft = {
        bzl = {
          "buildifier",
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
      },
    },
  },
}

return M
