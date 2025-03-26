local M = {
  "mrjones2014/smart-splits.nvim",
  keys = {
    {
      [[<A-h>]],
      function()
        require("smart-splits").move_cursor_left()
      end,
    },
    {
      [[<A-j>]],
      function()
        require("smart-splits").move_cursor_down()
      end,
    },
    {
      [[<A-j>]],
      function()
        require("smart-splits").move_cursor_up()
      end,
    },
    {
      [[<A-l>]],
      function()
        require("smart-splits").move_cursor_right()
      end,
    },
    {
      [[<A-r>]],
      function()
        require("smart-splits").start_resize_mode()
      end,
    },
  },
}

return M
