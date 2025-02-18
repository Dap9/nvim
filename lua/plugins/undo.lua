local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = { -- note how they're inverted to above example
    {
      "debugloop/telescope-undo.nvim",
    },
  },
  keys = {
    {
      "<leader>u",
      "<cmd>Telescope undo<cr>",
      desc = "undo history",
    },
  },
  opts = {
    -- don't use `defaults = { }` here, do this in the main telescope spec
    extensions = {
      undo = {
        mappings = {
          i = {
            ["<S-cr>"] = function()
              return require("telescope-undo.actions").yank_deletions
            end,
          },
        },
      },
    },
  },
  config = function(_, opts)
    -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
    -- configs for us. We won't use data, as everything is in it's own namespace (telescope
    -- defaults, as well as each extension).
    require("telescope").setup(opts)
    require("telescope").load_extension("undo")
  end,
}

return M
