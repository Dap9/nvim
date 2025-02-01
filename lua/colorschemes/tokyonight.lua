local name = "tokyonight"

local M = {
  "folke/tokyonight.nvim",
  lazy = vim.g.colorscheme ~= name,
  priority = 1000,
  opts = {
    style = "night",
  },

  config = function(_, opts)
    require("utils").setup_colorscheme(name, opts)
    vim.g.colorscheme = name
  end,
}

function M.setup_colors()
  local colors = require("tokyonight.colors").setup()

  return vim.tbl_deep_extend("force", colors, {
    vimode_bg = colors.bg_float,
  })
end

return M
