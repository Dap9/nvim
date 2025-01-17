-- Colorize hex values, rgb values, color names -> e.g. red
local M = {
  'NvChad/nvim-colorizer.lua',
  keys = {
    {[[<leader>ci]], [[<cmd>ColorizerToggle<cr>]]},
  },
  cmd = {
    "ColorizerToggle",
  },
  main = 'colorizer',
  config = true,
}

return M
