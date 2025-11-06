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

--- Parse pyproject.toml and extract tab settings
--- Supports:
---   [tool.yapf]        -> indent_width
---   [tool.autopep8]    -> indent-size
---   [tool.ruff]        -> indent-width
---   [tool.ruff.format] -> indent-width
--- Black doesn't expose indent config, so we ignore [tool.black].
---@param path string
---@return number|nil indent_spaces
function M.parse_pyproject_toml(path)
  local indent = nil
  local current_section = nil

  for line in io.lines(path) do
    -- section like [tool.ruff.format]
    local section = line:match("^%s*%[([^%]]+)%]")
    if section then
      current_section = section
    else
      local key, value = line:match("^%s*([%w%-%_]+)%s*=%s*(.+)")
      if key and value and current_section then
        -- strip quotes
        value = value:gsub('"', ""):gsub("'", "")
        -- normalize key: indent-width -> indent_width
        local norm_key = key:gsub("%-", "_")

        -- Ruff can be in pyproject
        -- [tool.ruff] or [tool.ruff.format] -> key: indent-width
        if current_section == "tool.ruff" or current_section == "tool.ruff.format" then
          if norm_key == "indent_width" then
            indent = tonumber(value)
          end
        -- [tool.yapf]  -> key: indent_width
        elseif current_section == "tool.yapf" then
          if norm_key == "indent_width" then
            indent = tonumber(value)
          end

        -- [tool.autopep8] -> key: indent-size
        elseif current_section == "tool.autopep8" then
          if norm_key == "indent_size" then
            indent = tonumber(value)
          end
        end

        -- note: [tool.black] has no indent option -> skip
      end
    end
  end

  return indent
end

--- Parse ruff.toml and extract tab settings
--- Ruff formatter uses `indent-width`
--- We accept both `indent-width` and `indent_width` for robustness.
---@param path string
---@return number|nil indent_spaces
function M.parse_ruff_toml(path)
  local indent = nil
  local current_section = nil

  for line in io.lines(path) do
    local section = line:match("^%s*%[([^%]]+)%]")
    if section then
      current_section = section
    else
      local key, value = line:match("^%s*([%w%-%_]+)%s*=%s*(.+)")
      if key and value and current_section then
        value = value:gsub('"', ""):gsub("'", "")
        local norm_key = key:gsub("%-", "_")

        -- ruff.toml can have:
        --   [format]
        if current_section == "format" or current_section == "" then
          if norm_key == "indent_width" then
            indent = tonumber(value)
          end
        end
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
