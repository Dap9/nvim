-- TODO: Move these to a utils file
function is_empty(s)
  return s == nil or s == ''
end

-- TODO this should be done somewhere else, not in this file.
local function set_colorscheme(name, cursor_color)
  if (not is_empty(name)) then
    vim.cmd.colorscheme(name);
  end

  -- Set the cursor color here to ensure it is done after the colorscheme is loaded

  if (not is_empty(cursor_color)) then
    vim.api.nvim_set_hl(0, "Cursor", { bg = "red" });
    vim.opt.guicursor = [[a:blinkon0,n-v-c:block-Cursor,i-ci-ve:ver50]];
  end
end

--[[
Set colorscheme

Options for colorschemes:
  badwolf -> cant read some keywords with red cursor
  angr
  Atelier_CaveDark
  anotherdark
  basic-dark
  chocolate -> Insert mode is REALLY bad though
  codedark
  codeblocks_dark
  darkburn
  darkdevel -> cant read some keywords with red cursor
  despacio
  duotone-darkcave
  ego
  ir_black
  molokai_dark
  mint
  graywh
  radicalgoodspeed
  dracula
  atom-dark
  oh-lucy
  nordic
--]]

-- If using a colorscheme from a plugin, comment this & put it after the
-- plugin loader
--vim.cmd([[colorscheme dracula]])
-- vim.cmd([[colorscheme catppuccin]])
-- vim.cmd.colorscheme 'catppuccin'
-- vim.opt.background = 'dark'
-- vim.cmd.colorscheme 'oh-lucy'

-- TODO: Setup a default so that i don't have to do priority etc defaults every time
local default = {
  priority = 1000,
}

local M = {
  {
    "Yazeed1s/oh-lucy.nvim",
    priority = 1000,
    -- lazy = false,
    main = "oh-lucy",
    config = function()
      set_colorscheme("oh-lucy-evening");
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    main = "catppuccin",
    priority = 1000,
    lazy = false,
    opts = {
      term_colors = true,
      integrations = {
        telescope = {
          enabled = true,
          -- style = "nvchad",
        },
        gitsigns = true,
        aerial = true,
        mason = true,
        native_lsp = {
          enabled = true,
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
        rainbow_delimiters = true,
        -- dropbar = {
        --   -- enabled = true,
        --   color_mode = true,
        -- },
      },
    },
    config = function(_, opts)
      local flavor = 'gruvbox'
      if flavor ~= nil then
        local overrides = require('plugins.colorscheme_customization.catppuccin')[flavor]
        opts.color_overrides = overrides.color_overrides
        opts.highlight_overrides = overrides.highlight_overrides or {}
        opts.styles = overrides.styles or {}
        opts.ransparent_background = overrides.transparent_background or false
        opts.show_end_of_buffer = overrides.show_end_of_buffer or false
      end
      require("catppuccin").setup(opts)
      set_colorscheme("catppuccin");
    end,
  },
}

return M
