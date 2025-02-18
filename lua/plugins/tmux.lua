-- Integrate for easier movement with tmux
local M = {
  "aserowy/tmux.nvim",
  -- https://unix.stackexchange.com/questions/10689/how-can-i-tell-if-im-in-a-tmux-session-from-a-bash-script
  cond = os.getenv("TMUX") ~= nil,
  keys = {
    {
      [[<A-h>]],
      function()
        require("tmux").move_left()
      end,
    },
    {
      [[<A-j>]],
      function()
        require("tmux").move_bottom()
      end,
    },
    {
      [[<A-k>]],
      function()
        require("tmux").move_top()
      end,
    },
    {
      [[<A-l>]],
      function()
        require("tmux").move_right()
      end,
    },
  },
  opts = {
    navigation = {
      enable_default_keybindings = false,
      cycle_navigation = false,
    },
    resize = {
      enable_default_keybindings = false,
    },
  },
}

return M
