local M = {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {
          on_attach = require("plugins.lsp.config").on_attach,
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              codeLens = {
                enable = true,
              },
              completion = {
                callSnippet = "Replace",
              },
              doc = {
                privateName = { "^_" },
              },
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Enable",
                arrayIndex = "Disable",
              },
            },
          },
        },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
      formatters_by_ft = {
        lua = {
          "stylua",
        },
      },
    },
  },
}

return M
