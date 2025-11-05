local name = "nekonight"

local M = {
  "BrunoCiccarino/nekonight",
  name = name,
  -- TODO: Tihs theme is fucked. Keeps thinking opts.style is a boolean for some reason.
  enabled = false,
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
  return vim.tbl_deep_extend("force", {}, {
    vimode_bg = "black",
  })
end

return M
