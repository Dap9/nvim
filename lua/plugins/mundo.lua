-- REQUIRES pynvim
-- Move to https://github.com/mbbill/undotree ?

local M = {
  'simnalamburt/vim-mundo',
  keys = {
    { "<leader>u", "<cmd>MundoToggle<cr>", {silent = true, noremap = true}},
  },
  cmd = "Mundo",
}

return M
