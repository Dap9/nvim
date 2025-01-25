local name = "catppuccin";

local M = {
  "catppuccin/nvim",
  name = name,
  lazy = vim.g.colorscheme ~= name,
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

  config = function (_, opts)
    require("utils").setup_colorscheme(name, opts);
  end
}

return M
