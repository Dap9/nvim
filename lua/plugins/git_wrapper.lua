-- A wrapper for git

-- NOTE: :Git log/status/graph does not have colors -> to fix
local M = {
  'tpope/vim-fugitive',
  keys = {
    { [[<leader>g]], [[:Git<space>]] },
    { [[<leader>ga]], [[:Git<space>add<space>]] },
    { [[<leader>gc]], [[:Git<space>commit -m<space>]] },
    { [[<leader>gg]], [[:Git log --graph --oneline --all --decorate<CR>]] },
  },
  cmd = "Git",
}

return M
