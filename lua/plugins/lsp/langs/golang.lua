local M = {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
	gopls = {
          on_attach = require("plugins.lsp.config").on_attach,
	},
      },
    },
  }
}

return M
