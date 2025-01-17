-- Needed separately from 'dependencies' in treesitter for some reason, not sure why
local M = {
  "HiPhish/rainbow-delimiters.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  event = {
    "BufReadPost",
    "BufNewFile",
    "VeryLazy",
  },
}

return M
