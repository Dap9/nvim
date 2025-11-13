local M = {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        hyprls = {
          on_attach = require("plugins.lsp.config").on_attach,
        },
      },
    },
  },
}

return M
