local M = {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- https://clangd.llvm.org/config
        clangd = {
          on_attach = require("plugins.lsp.config").on_attach,
          -- TODO: Use a separate lsp for protobufs? I remember it was quite bad
          -- filetypes = function ()
          -- end
        },
      },
    },
  },
}

return M
