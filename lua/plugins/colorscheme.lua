local M = {
  {
    "rebelot/kanagawa.nvim",
    lazy = vim.g.colorscheme ~= "kanagawa",
    priority = 1000,
    opts = {
      -- Only used when `background` is not set
      theme = "dragon",
      background = {
        dark = "dragon",
        light = "wave",
      },
      dimInactive = "true",
    },

    config = function(_, opts)
      require("kanagawa").setup(opts);
      vim.cmd.colorscheme([[kanagawa]])
    end,
  },

  {
    "folke/tokyonight.nvim",
    lazy = vim.g.colorscheme ~= "tokyonight",
    priority = 1000,
    cond = vim.g.colorscheme == "tokyonight",
    opts = {
      style = "night",
    },

    config = function(_, opts)
      require("tokyonight").setup(opts);
      vim.cmd.colorscheme([[tokyonight]]);
    end
  },

  {
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

    config = function (_, opts)
      require("catppuccin").setup(opts);
      vim.cmd.colorscheme([[catppuccin]]);
    end,
  },
}

return M
