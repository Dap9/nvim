local M = {
  "NeogitOrg/neogit",
  cmd = {
    "Neogit",
  },
  keys = {
    {
      [[<leader>ng]],
      function()
        require("neogit").open()
      end,
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration

    "nvim-telescope/telescope.nvim",
  },
  opts = {
  }
}

return M
