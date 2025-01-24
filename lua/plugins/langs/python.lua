local M = {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          on_attach = require("plugins.lsp.config").on_attach,
        },
        ruff = {
          on_attach = function (client, _)
            client.server_capabilities.hoverProvider = false;
          end
        }
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "ruff",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
      formatters_by_ft = {
        python = {
          "ruff_fix",
          "ruff_format",
          "ruff_organize_imports",
        },
      },
    },
  },
}

return M
