local name = "kanagawa";

local M = {
  "rebelot/kanagawa.nvim",
  lazy = vim.g.colorscheme ~= name,
  priority = 1000,
  opts = {
    -- Only used when `background` is not set
    theme = "dragon",
    background = {
      dark = "dragon",
      light = "wave",
    },
    dimInactive = "true",
  },

  config = function (_, opts)
    require("utils").setup_colorscheme(name, opts);
  end
}

return M
