local name = "nightfox"

local M = {
  "EdenEast/nightfox.nvim",
  lazy = vim.g.colorscheme ~= name,
  priority = 1000,
  opts = {},

  config = function(_, opts)
    require("utils").setup_colorscheme(name, opts, "carbonfox")
    vim.g.colorscheme = name
  end,
}

function M.setup_colors()
  return vim.tbl_deep_extend("force", {}, {
    vimode_bg = "black",
  })
end

return M
