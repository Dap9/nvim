-- Easier function traversal

local M = {
  "stevearc/aerial.nvim",
  keys = {
    { [[<leader>a]], [[<cmd>AerialToggle left<cr>]] },
  },
  dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"
  },
  config = true,
}

return M
