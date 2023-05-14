-- Helps traverse undo tree
-- REQUIRES pynvim (pip)

local M = {
  'simnalamburt/vim-mundo',
  keys = {
    { "<leader>u", "<cmd>MundoToggle<cr>", {silent = true, noremap = true}},
  },
  cmd = "Mundo",
}

return M
