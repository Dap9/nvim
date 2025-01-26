local name = "ayu"

local M = {
  "Shatur/neovim-ayu",
  lazy = vim.g.colorscheme ~= name,
  priority = 1000,
  opts = {},

  config = function(_, opts)
    require("utils").setup_colorscheme(name, opts)
  end,
}

return M
