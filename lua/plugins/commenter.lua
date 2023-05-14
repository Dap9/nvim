-- Commenting shortcuts

local M = {
  "numToStr/Comment.nvim",
  keys = {
    {
      "<leader>cc",
      mode = "n",
      "<Plug>(comment_toggle_linewise_current)",
    },
    {
      "<leader>cc",
      mode = "x",
      "<Plug>(comment_toggle_linewise_visual)",
    },
    {
      "<leader>cs",
      mode = "n",
      "<Plug>(comment_toggle_blockwise_current)",
    },
    {
      "<leader>cs",
      mode = "x",
      "<Plug>(comment_toggle_blockwise_visual)",
    },
  },
  opts = {
    mappings = {
      basic = false,
      extra = false,
    },
  },
}

return M
