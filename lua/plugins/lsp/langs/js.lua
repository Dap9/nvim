local M = {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
	ts_ls = {
          on_attach = require("plugins.lsp.config").on_attach,
	}
      },
    },
  }
}

return M
