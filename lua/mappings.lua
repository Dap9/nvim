local function map(modes, lhs, rhs, opts)
  local options = { noremap = true };
  if opts and type(opts) == 'table' then
    for k, v in pairs(opts) do options[k] = v end
  end
  for _, mode in ipairs(modes) do
    vim.keymap.set(mode, lhs, rhs, options);
  end
end

-- Mappings for plugins. REQUIRE plugins to work properly
-- <leader> = ','
map({'n'}, [[<leader><space>]], [[:nohlsearch<CR>]], { silent = true })

-- Mappings for easier window navigation. A: Alt, C: ctrl
map({'t'}, [[<A-h>]], [[<C-\><C-n><C-w>h]])
map({'t'}, [[<A-j>]], [[<C-\><C-n><C-w>j]])
map({'t'}, [[<A-k>]], [[<C-\><C-n><C-w>k]])
map({'t'}, [[<A-l>]], [[<C-\><C-n><C-w>l]])

local tmux = require("tmux")
map({'i', 'n'}, [[<A-h>]],function() tmux.move_left() end)
map({'i', 'n'}, [[<A-j>]],function() tmux.move_bottom() end)
map({'i', 'n'}, [[<A-k>]],function() tmux.move_top() end)
map({'i', 'n'}, [[<A-l>]],function() tmux.move_right() end)

map({'t'}, [[<A-Left>]], [[<C-\><C-n><C-w>h]])
map({'t'}, [[<A-Down>]], [[<C-\><C-n><C-w>j]])
map({'t'}, [[<A-Up>]], [[<C-\><C-n><C-w>k]])
map({'t'}, [[<A-Right>]], [[<C-\><C-n><C-w>l]])
map({'n'}, [[<A-Left>]], [[<C-w>h]])
map({'n'}, [[<A-Down>]], [[<C-w>j]])
map({'n'}, [[<A-Up>]], [[<C-w>k]])
map({'n'}, [[<A-Right>]], [[<C-w>l]])

-- Easier window resizing
map({'n'}, [[<C-Up>]], [[:resize -2<CR>]])
map({'n'}, [[<C-Down]], [[:resize +2<CR>]])
map({'n'}, [[<C-Left>]], [[:vertical resize -2<CR>]])
map({'n'}, [[<C-Right>]], [[:vertical resize +2<CR>]])
