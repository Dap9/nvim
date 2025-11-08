local M = {
  "gisketch/triforce.nvim",
  dependencies = {
    "nvzone/volt",
  },
  ---@module "triforce"
  ---@type TriforceConfig
  opts = {
    keymap = {
      show_profile = "<leader>tp",
    },
  },
}

return M
