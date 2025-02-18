local M = {
  "fdschmidt93/telescope-egrepify.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", { "nvim-lua/plenary.nvim" } },
  keys = {
    {
      [[,fg]],
      function()
        return require("telescope").extensions.egrepify.egrepify()
      end,
    },
  },
  opts = {
    extensions = {
      egrepify = {},
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("egrepify")
  end,
}

return M
