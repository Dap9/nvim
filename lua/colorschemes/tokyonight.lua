local name = "tokyonight";

local M = {
  "folke/tokyonight.nvim",
  lazy = vim.g.colorscheme ~= name,
  priority = 1000,
  opts = {
    style = "night",
  },

  config = function (_, opts)
    require("utils").setup_colorscheme(name, opts);
  end
}

return M
