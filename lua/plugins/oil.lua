-- View & modify directories like a vim buffer
local M = {
  'stevearc/oil.nvim',
  -- lazy loading isn't possible since it needs to register a new file type
  -- from what i can tell & this messes with it

  ---@module 'oil'
  ---@type oil.SetupOpts
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = true,
}

return M
