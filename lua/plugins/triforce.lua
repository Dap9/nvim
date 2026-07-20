local M = {
  "gisketch/triforce.nvim",
  dependencies = {
    "nvzone/volt",
  },
  ---@module "triforce"
  ---@type TriforceConfig
  keys = {
    {
      "<leader>tp",
      function()
        require("triforce").show_profile()
      end,
    },
  },
  opts = {},
}

return M
