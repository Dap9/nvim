local M = {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- https://clangd.llvm.org/config
        clangd = {
          mason = false,
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
          on_attach = require("plugins.lsp.config").on_attach,
        },
      },
    },
  },
}

return M
