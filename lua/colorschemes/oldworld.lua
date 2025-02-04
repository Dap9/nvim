-- Best theme for oled. Them deep blacks be deep
local name = "oldworld"

local M = {
  "dgox16/oldworld.nvim",
  lazy = vim.g.colorscheme ~= name,
  priority = 1000,
  opts = {
    variant = "oled",
  },

  config = function(_, opts)
    require("utils").setup_colorscheme(name, opts)
    vim.g.colorscheme = name
  end,
}

function M.setup_colors()
  local colors = {}
  return vim.tbl_deep_extend("force", colors, {
    -- TODO
    vimode_bg = "black",
  })
end

return M
