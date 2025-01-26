local name = "nightfox"

local M = {
  "EdenEast/nightfox.nvim",
  lazy = vim.g.colorscheme ~= name,
  priority = 1000,
  opts = {},

  config = function(_, opts)
    require("utils").setup_colorscheme(name, opts, "carbonfox")
  end,
}

return M
