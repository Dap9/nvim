local M = {
  "saghen/blink.cmp",
  -- optional: provides snippets for the snippet source
  dependencies = {
    "rafamadriz/friendly-snippets",
  },

  event = {
    "InsertEnter",
    "CmdlineEnter",
  },

  version = "*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- See the full "keymap" documentation for information on defining your own keymap.
    keymap = {
      preset = "default",
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-s>"] = { "show", "show_signature", "hide_signature", "fallback" },
      ["<C-d>"] = { "show_documentation", "hide_documentation", "fallback" },
      ["<C-f>"] = { "scroll_signature_down", "scroll_documentation_down", "fallback" },
      ["<C-b>"] = { "scroll_signature_up", "scroll_documentation_up", "fallback" },
      ["<C-e>"] = { "cancel", "fallback" },
      ["<C-space>"] = { "hide", "fallback" },
    },

    completion = {
      accept = {},
      trigger = {
        show_on_insert_on_trigger_character = true,
      },
      menu = {
        draw = {
          treesitter = {
            "lsp",
          },
        },
      },
    },

    appearance = {
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      -- Useful for when your theme doesn't support blink.cmp
      -- Will be removed in a future release
      -- use_nvim_cmp_as_default = true,
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = "mono",
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      -- default = { "lsp", "path", "snippets", "buffer" },
    },
  },
  opts_extend = { "sources.default" },
}

return M
