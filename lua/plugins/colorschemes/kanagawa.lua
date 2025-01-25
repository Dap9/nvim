local M = {
  "rebelot/kanagawa.nvim",
  lazy = vim.g.colorscheme ~= "kanagawa",
  priority = 1000,
  opts = {
    -- Only used when `background` is not set
    theme = "dragon",
    background = {
      dark = "dragon",
      light = "wave",
    },
    dimInactive = "true",
  },

  config = function(_, opts)
    require("kanagawa").setup(opts)
    vim.cmd.colorscheme([[kanagawa]])
  end,
}

return M
