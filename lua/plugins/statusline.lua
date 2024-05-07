local M = {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  event = 'VeryLazy',
  opts = {
    options = {
      theme = "catppuccin",
    },
  },
  config = function(_, opts)
    require('lualine').setup(opts.options)
  end
}

return M
