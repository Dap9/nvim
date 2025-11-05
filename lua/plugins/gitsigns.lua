-- Puts info about git changes in the gutter

local M = {
  "lewis6991/gitsigns.nvim",
  -- TODO: Will this work on windows? Not sure
  enabled = function()
    local result = os.execute("git rev-parse --is-inside-worktree > /dev/null 2>&1")
    return result == 0
  end,
  event = {
    "BufReadPost",
    "BufNewFile",
    "VeryLazy",
  },
  config = true,
}

return M
