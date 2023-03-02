vim.opt.path:append { '**' };
vim.opt.number = true;
-- vim.opt.syntax = 'ON';
vim.opt.autoindent = true;
vim.opt.smartindent = true;
vim.opt.shiftwidth = 2;
-- Expand tab to use spaces
vim.opt.expandtab = true;
-- Number of spaces a tab counts for when editing.
-- So this value is the number of spaces that is inserted when you hit <TAB>
-- and also the number of spaces that are removed when you backspace
vim.o.softtabstop = 2;
-- Stop softtabstop of size 4. I don't like it, so i will not use it. fuck off
-- rust. Nvm, lsp formatting defaults to 4 spaces... Cant seem to fix that so
-- leaving it at 4 spaces. Fuck it. TODO: FIGURE THIS SHIT OUT
-- vim.g.rust_recommended_style = 0
-- cursorline is local to window -> check with :h cursorline
vim.opt.cursorline = true;  -- vim.wo.cursorline = true;
-- Change if this has a better option. didn't find any other for now
vim.cmd('filetype plugin indent on')
vim.opt.wildmenu = true;
-- allows faster macros but seems to be causing weird behavior sometimes?
-- not sure.
vim.opt.lazyredraw = true;
vim.opt.showmatch = true;
vim.opt.incsearch = true;
vim.opt.hlsearch = true;
vim.opt.foldenable = true;
vim.opt.foldmethod = 'syntax';
vim.opt.foldlevelstart = 10;
vim.opt.colorcolumn = "81"
-- undofile is local to buffer -> check with :h undofile
vim.opt.undofile = true;  -- vim.bo.undofile = true;
vim.opt.undodir = os.getenv('HOME') .. '/.nvim/undo';

-- If this doesnt work move to configgroup in autocmd.lua
if (vim.bo.filetype == 'make') then
  vim.opt_local.expandtab = false;
end

-- Set leader
vim.g.mapleader = ',';

-- Set escape timeout (else waits for some time)
-- vim.opt.ttimeoutlen = 0;
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
vim.cmd.colorscheme 'oh-lucy'
-- Cursor modification
vim.opt.termguicolors = true;
-- For normal mode
vim.api.nvim_set_hl(0, "Cursor", { bg = "red" });
-- vim.cmd([[highlight Cursor guifg=NONE guibg=red]]);
-- For insert mode. Redundant for now but kept for clarity
vim.api.nvim_set_hl(0, "iCursor", { bg = "red" });
-- vim.cmd([[highlight iCursor guifg=NONE guibg=red]]);
vim.opt.guicursor = [[a:blinkon0,n-v-c:block-Cursor,i-ci-ve:ver50-iCursor]];
