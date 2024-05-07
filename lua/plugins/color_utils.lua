-- Colorize hex values, rgb values, color names -> e.g. red
local M = {
  'NvChad/nvim-colorizer.lua',
  -- event = { 'BufReadPre' },
  keys = {
    {[[<leader>ci]], [[<cmd>ColorizerToggle<cr>]]},
  },
  main = 'colorizer',
  config = function()
    require('colorizer').setup()
  end,
}

return M
