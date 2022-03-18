vim.opt.path:append { '**' };
vim.opt.number = true;
vim.opt.syntax = 'ON';
vim.opt.autoindent = true;
vim.opt.smartindent = true;
vim.opt.shiftwidth = 4;
-- Expand tab to use spaces
vim.opt.expandtab = true;
-- Number of spaces a tab counts for when editing. So this value is the number of spaces that is inserted when you hit <TAB> and also the number of spaces that are removed when you backspace
vim.opt.softtabstop = 4;
-- cursorline is local to window -> check with :h cursorline
vim.opt.cursorline = true; -- vim.wo.cursorline = true;
-- Change if this has a better option. didn't find any other for now
vim.cmd('filetype plugin indent on')
vim.opt.wildmenu = true;
-- allows faster macros but seems to be causing weird behavior sometimes? not sure. 
vim.opt.lazyredraw = true;
vim.opt.showmatch = true;
vim.opt.incsearch = true;
vim.opt.hlsearch = true;
vim.opt.foldenable = true;
vim.opt.foldmethod = 'syntax';
vim.opt.foldlevelstart = 10;
-- undofile is local to buffer -> check with :h undofile
vim.opt.undofile = true; -- vim.bo.undofile = true;
vim.opt.undodir = os.getenv('HOME') .. '/.nvim/undo';

-- If this doesnt work move to configgroup in autocmd.lua
if (vim.bo.filetype == 'make') then
    vim.opt_local.expandtab = false;
end

-- Set leader
vim.g.mapleader = ',';

--[[ 
Set colorscheme

" Options for colorschemes:
"   badwolf -> cant read some keywords with red cursor
"   angr
"   Atelier_CaveDark
"   anotherdark
"   basic-dark
"   chocolate -> Insert mode is REALLY bad though
"   codedark
"   codeblocks_dark
"   darkburn
"   darkdevel -> cant read some keywords with red cursor
"   despacio
"   duotone-darkcave
"   ego
"   ir_black
"   molokai_dark
"   mint
"   graywh
"   radicalgoodspeed

--]]

vim.cmd('colorscheme radicalgoodspeed')

-- Cursor modification
-- TODO: No nvim.api.nvim_set_hl() available yet. Should come with 0.7 so will move to them at that point 
vim.opt.termguicolors = true;
-- For normal mode
vim.cmd([[highlight Cursor guifg=NONE guibg=red]]);
-- For insert mode. Redundant for now but kept for clarity
vim.cmd([[highlight iCursor guifg=NONE guibg=red]]);
vim.opt.guicursor = [[a:blinkon0,n-v-c:block-Cursor,i-ci-ve:ver50-iCursor]];
