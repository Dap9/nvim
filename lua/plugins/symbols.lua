local M = {
  "oskarrrrrrr/symbols.nvim",
  cmd = {
    "Symbols",
    "SymbolsClose",
    "SymbolsOpen",
    "SymbolsToggle",
  },
  keys = {
    {
      "<leader>s",
      "<cmd>SymbolsToggle<cr>",
    },
  },
  opts = {},
  config = function()
    local r = require("symbols.recipes")
    require("symbols").setup(r.DefaultFilters, r.AsciiSymbols, {
      -- custom settings here
      -- e.g. hide_cursor = false
    })
    -- vim.keymap.set("n", ",s", "<cmd> Symbols<CR>")
    -- vim.keymap.set("n", ",S", "<cmd> SymbolsClose<CR>")
  end,
}

return {}
