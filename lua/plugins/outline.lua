local M = {
  "hedyhli/outline.nvim",
  dependencies = {
    "epheien/outline-treesitter-provider.nvim",
  },
  cmd = {
    "Outline",
  },
  keys = {
    {
      "<leader>o",
      "<cmd>Outline<cr>",
    },
  },
  opts = {
    outline_window = {
      position = "left",
      width = 15,
      wrap = true,
    },
    providers = {
      priority = { "lsp", "coc", "markdown", "norg", "treesitter" },
    },
  },
}

return M
