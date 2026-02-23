local M = {
  "mrjones2014/smart-splits.nvim",
  -- keys = {
  --   -- {
  --   --   "<A-
  --   -- }
  --   -- This fucks up mappings if nested
  --   -- {
  --   --   [[<A-r>",
  --   --   function()
  --   --     require("smart-splits").start_resize_mode()
  --   --   end,
  --   -- },
  -- },

  opts = {
    resize_mode = {
      silent = true,
      hooks = {
        on_enter = function()
          vim.notify("Entering resize mode")
        end,
        on_leave = function()
          vim.notify("Exiting resize mode, bye")
        end,
      },
    },
    at_edge = "stop",
  },

  config = function(_, opts)
    local utils = require("utils")
    utils.map({ "n" }, "<A-h>", require("smart-splits").move_cursor_left)
    utils.map({ "n" }, "<A-j>", require("smart-splits").move_cursor_down)
    utils.map({ "n" }, "<A-k>", require("smart-splits").move_cursor_up)
    utils.map({ "n" }, "<A-l>", require("smart-splits").move_cursor_right)

    require("smart-splits").setup(opts)
  end,
}

return M
