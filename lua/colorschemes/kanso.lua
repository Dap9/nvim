local name = "kanso"

local M = {
  "webhooked/kanso.nvim",
  lazy = vim.g.colorscheme ~= name,
  priority = 1000,
  opts = {
    theme = "zen",
    keywordStyle = {
      italic = false,
    },
  },

  config = function(_, opts)
    require("utils").setup_colorscheme(name, opts)
    vim.g.colorscheme = name
  end,
}

function M.setup_colors()
  return vim.tbl_deep_extend("force", {}, {
    vimode_bg = "black",
  })
end

return M
