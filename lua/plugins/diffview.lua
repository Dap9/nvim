local M = {
  "sindrets/diffview.nvim",
  depeendencies = {
    "nvim-tree/nvim-web-devicons",
  },
  cmd = {
    "DiffviewOpen",
    "DiffviewFileHistory",
  },
  opts = {
    view = {
      merge_tool = {
        layout = "diff4_mixed", -- Enables the 4-way merge layout
        disable_diagnostics = true, -- Optionally disable diagnostics in merge view
      },
    },
  },
}
return M
