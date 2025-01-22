local M = {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rust_analyzer = {
          on_attach = require("plugins.lsp.config").on_attach,
        },
      },
    },
  },
}

return M
