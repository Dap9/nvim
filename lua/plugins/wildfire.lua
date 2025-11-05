local M = {
  "sustech-data/wildfire.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  ---@module wildfire
  opts = {
    keymaps = {
      init_selection = "<A-t>",
      node_incremental = "<A-t>",
      node_decremental = "<bs>",
    },
  },
}

return M
