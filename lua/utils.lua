local M = {}

function M.map(modes, lhs, rhs, opts)
  local options = { noremap = true };
  if opts and type(opts) == 'table' then
    for k, v in pairs(opts) do options[k] = v end
  end
  for _, mode in ipairs(modes) do
    vim.keymap.set(mode, lhs, rhs, options);
  end
end

return M
