local utils = require('utils')

utils.map({'n'}, [[<leader><space>]], [[:nohlsearch<CR>]], { silent = true })

utils.map({'t'}, [[<A-h>]], [[<C-\><C-n><C-w>h]])
utils.map({'t'}, [[<A-j>]], [[<C-\><C-n><C-w>j]])
utils.map({'t'}, [[<A-k>]], [[<C-\><C-n><C-w>k]])
utils.map({'t'}, [[<A-l>]], [[<C-\><C-n><C-w>l]])

utils.map({'t'}, [[<A-Left>]], [[<C-\><C-n><C-w>h]])
utils.map({'t'}, [[<A-Down>]], [[<C-\><C-n><C-w>j]])
utils.map({'t'}, [[<A-Up>]], [[<C-\><C-n><C-w>k]])
utils.map({'t'}, [[<A-Right>]], [[<C-\><C-n><C-w>l]])
utils.map({'n'}, [[<A-Left>]], [[<C-w>h]])
utils.map({'n'}, [[<A-Down>]], [[<C-w>j]])
utils.map({'n'}, [[<A-Up>]], [[<C-w>k]])
utils.map({'n'}, [[<A-Right>]], [[<C-w>l]])

-- Easier window resizing
utils.map({'n'}, [[<C-Up>]], [[:resize -2<CR>]])
utils.map({'n'}, [[<C-Down]], [[:resize +2<CR>]])
utils.map({'n'}, [[<C-Left>]], [[:vertical resize -2<CR>]])
utils.map({'n'}, [[<C-Right>]], [[:vertical resize +2<CR>]])

-- The regular mappings for movement are all based on 'tmux.nvim'. They should
-- overwrite these once the plugins load.
-- In this case, lazy.nvim will overwrite these to allow lazy loading of 'tmux.nvim'
-- on these keys
utils.map({'n'}, [[<A-h>]],[[<C-w>h]])
utils.map({'n'}, [[<A-j>]],[[<C-w>j]])
utils.map({'n'}, [[<A-k>]],[[<C-w>k]])
utils.map({'n'}, [[<A-l>]],[[<C-w>l]])
