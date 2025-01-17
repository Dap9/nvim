local M = {
  "NeogitOrg/neogit",
  cmd = {
    "Neogit",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration

    "nvim-telescope/telescope.nvim",
  },
  config = true
}

return M
