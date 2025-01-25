local M = {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = vim.g.colorscheme ~= "catppuccin",
  priority = 1000,
  opts = {
    flavor = "auto",
    background = {
      dark = "mocha",
      light = "frappe",
    },
    integrations = {
      telescope = {
        enabled = true,
      },
      gitsigns = true,
      aerial = true,
      mason = true,
      native_lsp = {
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
        inlay_hints = {
          background = true,
        },
      },
      -- raibow_delimiters = true,
    },
  },

  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme([[catppuccin]])
  end,
}

return M
