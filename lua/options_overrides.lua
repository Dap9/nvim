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

-- Number of spaces a tab counts for when editing.
-- So this value is the number of spaces that is inserted when you hit <TAB>
-- and also the number of spaces that are removed when you backspace
vim.o.softtabstop = 2

-- Number of spaces to use for each step of (auto)indent.  Used for
-- |'cindent'|, |>>|, |<<|, etc.
vim.o.shiftwidth = 2
