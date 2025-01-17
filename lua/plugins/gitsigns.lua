-- Puts info about git changes in the gutter

local M = {
  "lewis6991/gitsigns.nvim",
  -- TODO: do a check to see if it's a git repo & disable if not?
  -- local result = os.execute("git rev-parse --is-inside-worktree > /dev/null 2>&1") 
  -- return result == 0
  event = {
    "BufReadPost",
    "BufNewFile",
    "VeryLazy",
  },
  config = true,
}

return M
