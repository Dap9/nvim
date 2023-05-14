local M = {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  event = 'VeryLazy',
  opts = {
    options = {
    },
  },
  config = function(_, opts)
    require('lualine').setup()
  end
}

return M
