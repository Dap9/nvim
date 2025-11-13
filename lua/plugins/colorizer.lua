-- Colorize hex values, rgb values, color names -> e.g. red
local M = {
  "NvChad/nvim-colorizer.lua",
  keys = {
    { [[<leader>ci]], [[<cmd>ColorizerToggle<cr>]] },
  },
  cmd = {
    "ColorizerToggle",
  },
  main = "colorizer",
  opts = {
    filetypes = {
      hyprlang = {
        rgb_fn = true,
      },
    },
  },
}

return M
