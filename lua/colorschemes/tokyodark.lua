local name = "tokyodark"

local M = {
  "tiagovla/tokyodark.nvim",
  lazy = vim.g.colorscheme ~= name,
  priority = 1000,
  opts = {},

  config = function(_, opts)
    require("utils").setup_colorscheme(name, opts)
  end,
}

return M
