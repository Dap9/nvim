-- View & modify directories like a vim buffer
local M = {
  "stevearc/oil.nvim",
  enabled = false,
  -- https://github.com/stevearc/oil.nvim/issues/300
  -- Close enough
  cmd = "Oil",
  event = { "VimEnter */*,.*", "BufNew */*,.*" },

  ---@module "oil"
  ---@type oil.SetupOpts
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

return M
