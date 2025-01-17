local M = {
  kanagawa = {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    cond = vim.g.colorscheme == "kanagawa",
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
      vim.cmd([[colorscheme kanagawa-dragon]])
    end,
  },

  tokyonight = {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    cond = vim.g.colorscheme == "tokyonight",
    opts = {
      style = "night",
    },

    config = function (_, opts)
      require("tokyonight").setup(opts);
      vim.cmd([[colorscheme tokyonight]]);
    end
  }
}

return M[vim.g.colorscheme]
