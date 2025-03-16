local M = {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- https://clangd.llvm.org/config
        nushell = {
          mason = false,
          on_attach = require("plugins.lsp.config").on_attach,
          setup = function ()
            require("lspconfig").nushell.setup({})
          end
        },
      },
    },
  },
}

return M
