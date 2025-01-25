local M = {
  "folke/tokyonight.nvim",
  lazy = vim.g.colorscheme ~= "tokyonight",
  priority = 1000,
  cond = vim.g.colorscheme == "tokyonight",
  opts = {
    style = "night",
  },

  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd.colorscheme([[tokyonight]])
  end,
}

return M
