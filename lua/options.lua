--[[
General use of `opt` vs `o`:
 - opt -> for list & map style options
 - o -> the rest

Similar for the rest:
 - `opt_local` vs `bo`
 - `opt_global` vs `go`


Note that |vim.opt| returns an `Option` object, not the value of the option,
which is accessed through |vim.opt:get()|
--]]

vim.g.mapleader = ',';

-- Allows vim to search recursively in subdirectories.
-- This is primarily to allow it to find files in subdirectories
vim.opt.path:append { '**' };
vim.o.number = true;
vim.o.relativenumber = true;

-- Smart indenting
vim.o.autoindent = true;
vim.o.smartindent = true;

-- Highlight the text line of the cursor with CursorLine
vim.o.cursorline = true;

-- Seems to be on by default?
-- vim.cmd("filetype plugin indent on");

-- On pressing 'wildchar' (usually <Tab>) to invoke completion, the possible
-- matches are shown.
vim.o.wildmenu = true;
vim.opt.wildignore:append {
  "*.docx",
  "*.jpg",
  "*.png",
  "*.gif",
  "*.pdf",
  "*.pyc",
  "*.exe",
  "*.flv",
  "*.img",
  "*.xlsx",
  "*DS_STORE",
  "*.db"
};


-- Only meant to be set temporarily when performing an operation that might
-- cause a slowdown. Thus set if needed, but not currently set
-- vim.o.lazyredraw = true;

-- When a bracket is inserted, briefly jump to the matching one.  The
-- jump is only done if the match can be seen on the screen.  The time to
-- show the match can be set with 'matchtime'.
vim.o.showmatch = true;

-- When there is a previous search pattern, highlight all its matches.
vim.o.hlsearch = true;

-- While typing a search command, show where the pattern, as it was typed
-- so far, matches.  The matched string is highlighted.  If the pattern
-- is invalid or not found, nothing is shown.  The screen will be updated
-- often, this is only useful on fast terminals.
-- turn off if slow
vim.o.incsearch = true;

-- on by default, but kept for consistency across machines if using a differrent
-- version of neovim or smth, tho how that would break other parts of the config
-- idk so might not even make sense to be here tbh
-- foldmethod & foldexpr are set in the treesitter config, since the expr is only
-- possible to be used when treesitter is loaded
vim.o.foldenable = true;

-- When on, Vim automatically saves undo history to an undo file when
-- writing a buffer to a file, and restores undo history from the same
-- file on buffer read.
vim.o.undofile = true;
vim.opt.undodir = os.getenv('HOME') .. '/.nvim/undo';

vim.o.termguicolors = true;

-- Expand tab to use spaces however Makefiles **require** tabs. Else they error
-- out. Set it here if it isn't auto done with `filetype indent on`
vim.bo.expandtab = vim.bo.filetype ~= "make"

-- The blow are set twice due to weird behaviors:
-- 1. Some lsps 'reset' shiftwidth & softtabstop. Thus need them in `options_override'
-- 2. Some lsps expect(?) the shiftwidth & softtabstop to be set prior to loading it so it 
--    defaults to setting them to shiftwidth = 8 which is objectively bad, whether you like
--    4 spaces or 2 cos no sane person like 8 spaces
--
-- Number of spaces a tab counts for when editing.
-- So this value is the number of spaces that is inserted when you hit <TAB>
-- and also the number of spaces that are removed when you backspace
vim.o.softtabstop = 2

-- Number of spaces to use for each step of (auto)indent.  Used for
-- |'cindent'|, |>>|, |<<|, etc.
vim.o.shiftwidth = 2

vim.g.colorscheme = "tokyonight";
