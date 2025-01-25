local name = "nekonight";

local M = {
  "BrunoCiccarino/nekonight",
  name = name,
  -- This is fucked, not sure why. `opts.style` seems to be coming as a boolean for some reason.
  enabled = false,
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
