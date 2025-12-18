local M = {}

function M.map(modes, lhs, rhs, opts)
  local options = { noremap = true }
  if opts and type(opts) == "table" then
    for k, v in pairs(opts) do
      options[k] = v
    end
  end
  for _, mode in ipairs(modes) do
    vim.keymap.set(mode, lhs, rhs, options)
  end
end

function M.setup_colorscheme(name, opts, style)
  require(name).setup(opts)
  vim.cmd.colorscheme(style or name)
end

function M.serializeTable(val, name, skipnewlines, depth)
  skipnewlines = skipnewlines or false
  depth = depth or 0

  local tmp = string.rep(" ", depth)

  if name then
    tmp = tmp .. name .. " = "
  end

  if type(val) == "table" then
    tmp = tmp .. "{" .. (not skipnewlines and "\n" or "")

    for k, v in pairs(val) do
      tmp = tmp .. M.serializeTable(v, k, skipnewlines, depth + 1) .. "," .. (not skipnewlines and "\n" or "")
    end

    tmp = tmp .. string.rep(" ", depth) .. "}"
  elseif type(val) == "number" then
    tmp = tmp .. tostring(val)
  elseif type(val) == "string" then
    tmp = tmp .. string.format("%q", val)
  elseif type(val) == "boolean" then
    tmp = tmp .. (val and "true" or "false")
  else
    tmp = tmp .. '"[inserializeable datatype:' .. type(val) .. ']"'
  end

  return tmp
end

return M
