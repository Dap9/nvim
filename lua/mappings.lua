local function map(mode, lhs, rhs, opts)
  local options = { noremap = true };
  if opts and type(opts) == 'table' then
    for k, v in pairs(opts) do options[k] = v end
  end
  vim.keymap.set(mode, lhs, rhs, options);
end

-- Mappings for plugins. REQUIRE plugins to work properly
-- <leader> = ','
map('n', [[<leader><space>]], [[:nohlsearch<CR>]], { silent = true })
map('n', [[<leader>u]], [[:MundoToggle<CR>]], { silent = true })
map('n', [[<leader>g]], [[:Git<space>]])
map('n', [[<leader>ga]], [[:Git<space>add<space>]])
map('n', [[<leader>gc]], [[:Git<space>commit -m<space>"]])
map('n', [[<leader>gg]], [[:Git log --graph --oneline --all --decorate<CR>]])

-- Telescope mappings
map('n', [[,ff]], function() return require('telescope.builtin').find_files() end)
map('n', [[,fg]], function() return require('telescope.builtin').live_grep() end)
map('n', [[,fb]], function() return require('telescope.builtin').buffers() end)
map('n', [[,fs]], function() return require('telescope.builtin').grep_string() end)
map('n', [[,m]], function() return require('telescope.builtin').man_pages({sections={"1","2","3"}}) end)
map('n', [[,ss]], function() return require('telescope.builtin').spell_suggest() end)
map('n', [[,fr]], function() return require('telescope.builtin').resume() end)
map('n', [[,fp]], function() return require('telescope.builtin').registers() end)
-- NOTE: :Git log/status/graph does not have colors -> to fix

-- Mappings for easier window navigation. A: Alt, C: ctrl
map('t', [[<A-h>]], [[<C-\><C-n><C-w>h]])
map('t', [[<A-j>]], [[<C-\><C-n><C-w>j]])
map('t', [[<A-k>]], [[<C-\><C-n><C-w>k]])
map('t', [[<A-l>]], [[<C-\><C-n><C-w>l]])
map('i', [[<A-h>]], [[<C-w>h]])
map('i', [[<A-j>]], [[<C-w>j]])
map('i', [[<A-k>]], [[<C-w>k]])
map('i', [[<A-l>]], [[<C-w>l]])
map('n', [[<A-h>]], [[<C-w>h]])
map('n', [[<A-j>]], [[<C-w>j]])
map('n', [[<A-k>]], [[<C-w>k]])
map('n', [[<A-l>]], [[<C-w>l]])

map('t', [[<A-Left>]], [[<C-\><C-n><C-w>h]])
map('t', [[<A-Down>]], [[<C-\><C-n><C-w>j]])
map('t', [[<A-Up>]], [[<C-\><C-n><C-w>k]])
map('t', [[<A-Right>]], [[<C-\><C-n><C-w>l]])
map('n', [[<A-Left>]], [[<C-w>h]])
map('n', [[<A-Down>]], [[<C-w>j]])
map('n', [[<A-Up>]], [[<C-w>k]])
map('n', [[<A-Right>]], [[<C-w>l]])

-- Easier window resizing
map('n', [[<C-Up>]], [[:resize -2<CR>]])
map('n', [[<C-Down]], [[:resize +2<CR>]])
map('n', [[<C-Left>]], [[:vertical resize -2<CR>]])
map('n', [[<C-Right>]], [[:vertical resize +2<CR>]])
