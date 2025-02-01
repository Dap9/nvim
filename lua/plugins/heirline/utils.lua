local M = {}

function M.setup_colors()
  local scheme = string.format("colorschemes.%s", vim.g.colorscheme)
  return require(scheme).setup_colors()
end

return M
