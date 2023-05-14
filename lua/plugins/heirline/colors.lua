local utils = require("plugins.heirline.utils")

local M = {}
local h_utils = require("heirline.utils")

local function setup_colors()
  return {
    black1 = h_utils.get_highlight("ColorColumn").bg,
    git_add = h_utils.get_highlight("GitSignsAdd").fg,
    git_change = h_utils.get_highlight("GitSignsChange").fg,
    git_del = h_utils.get_highlight("GitSignsDelete").fg,
    diag_error = h_utils.get_highlight("DiagnosticSignError").fg,
    diag_warn = h_utils.get_highlight("DiagnosticSignWarn").fg,
    diag_info = h_utils.get_highlight("DiagnosticSignInfo").fg,
    diag_hint = h_utils.get_highlight("DiagnosticSignHint").fg,
    default_bg = h_utils.get_highlight("LineNr").bg,
    default_fg = h_utils.get_highlight("LineNr").fg,
  }
end

M.colors = setup_colors()

M.setup = function()
  require("heirline").load_colors(M.colors)
  vim.api.nvim_create_augroup("Heirline", { clear = true })
  vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
      h_utils.on_colorscheme(setup_colors)
    end,
    group = "Heirline",
  })
end

return M
