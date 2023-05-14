local M = {
  'rebelot/heirline.nvim',
  dependencies = {
    'nvim-lua/lsp-status.nvim',
    'lewis6991/gitsigns.nvim',
  },
  event = "VeryLazy",
  opts = function()

    require("lsp-status").register_progress()

    local utils = require("plugins.heirline.utils")
    local color = require("plugins.heirline.colors")
    color.setup()

    local vi_mode = require("plugins.heirline.mode")
    local filename = require("plugins.heirline.filename")

    local pos = require("plugins.heirline.pos")

    local git_info = require("plugins.heirline.git-info")

    local lsp_info = require("plugins.heirline.lsp-info")

    local StatusLine = {
      vi_mode,
      filename,
      git_info,
      lsp_info,
      pos,
    }
    --[[ local component_eg = {
      provider = "%f",
      hl = {
        fg = fg_color,
        bg = bg_color,
        sp = underline_or_undercurl_color,
      },
      condition = function()
        return true
      end,
      on_click = {
        callback = function()
          on_click_action
        end,
        name = "???",
      },
    }]]
    return {
      statusline = StatusLine,
      colors = color.colors
    }
  end,
  config = function(_, opts)
    require("heirline").setup(opts)
  end
}

return M
