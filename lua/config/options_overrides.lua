local M = {}

--- Recursively search upward for a file
---@param start_dir string
---@param target string
---@return string|nil
function M.find_upwards(start_dir, target)
  local dir = vim.fs.dirname(start_dir)
  while dir and dir ~= "" do
    local candidate = dir .. "/" .. target
    if vim.fn.filereadable(candidate) == 1 or vim.fn.isdirectory(candidate) == 1 then
      return candidate
    end
    local parent = vim.fs.dirname(dir)
    if parent == dir then
      break
    end
    dir = parent
  end
  return nil
end

--- Parse rustfmt.toml and extract tab settings
---@param path string
---@return number indent_spaces
function M.parse_rustfmt_toml(path)
  local indent = 4
  for line in io.lines(path) do
    local key, value = line:match("^%s*([%w_]+)%s*=%s*(.+)")
    if key and value then
      value = value:gsub('"', ""):gsub("'", "")
      if key == "tab_spaces" then
        indent = tonumber(value) or indent
      end
    end
  end
  return indent
end

---@param override_value number
function M.override_tabwidth(override_value)
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
  vim.o.softtabstop = override_value

  -- Number of spaces to use for each step of (auto)indent.  Used for
  -- |'cindent'|, |>>|, |<<|, etc.
  vim.o.shiftwidth = override_value
end

return M
