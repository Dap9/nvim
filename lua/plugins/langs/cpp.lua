local M = {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- https://clangd.llvm.org/config
        clangd = {
          on_attach = require("plugins.lsp.config").on_attach,
          -- This is horrible for proto files... We use a separate lsp and formatter for it
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
      formatters_by_ft = {
        cpp = {
          "clang-format",
        },
        c = {
          "clang-format",
        },
        cuda = {
          "clang-format",
        },
      },
    },
  },
}

return M
