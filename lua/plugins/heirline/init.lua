local M = {
  "rebelot/heirline.nvim",
  dependencies = {
    "nvim-web-devicons",
  },
  event = {
    "VeryLazy",
  },

  init = function()
    -- PERF: disable for starter page
    -- vim.g.= vim.o.laststatus
    -- if vim.fn.argc(-1) > 0 then
    -- set an empty statusline till heirline loads
    vim.o.statusline = " "
    -- else
    -- hide the statusline on the starter page
    -- vim.o.laststatus = 0
    -- end
  end,

  -- This **NEEDS** to be a function, else it starts trying to evaluate the
  -- components files at startup and errors
  opts = function()
    return {
      statusline = require("plugins.heirline.statusline"),
      -- winbar = require("plugins.statusline.winbar"),
      -- tabline = require("plugins.statusline.tabline"),
      -- statuscolumn = require("plugins.statusline.statuscolumn"),

      opts = {
        colors = require("plugins.heirline.utils").setup_colors(),
      },
    }
  end,

  config = function(_, opts)
    require("heirline").setup(opts)

    local utils = require("heirline.utils")
    vim.api.nvim_create_augroup("Heirline", { clear = true })
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        utils.on_colorscheme(require("plugins.heirline.utils").setup_colors)
      end,
      group = "Heirline",
    })
  end,
}

return M
