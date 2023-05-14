-- TODO: Move these to a utils file
function is_empty(s)
  return s == nil or s == ''
end

function set_colorscheme(name, cursor_color)

  if (not is_empty(name)) then
    vim.cmd.colorscheme(name);
  end

  -- Set the cursor color here to ensure it is done after the colorscheme is loaded

  if (not is_empty(cursor_color)) then
    vim.api.nvim_set_hl(0, "Cursor", { bg = "red" });
    vim.opt.guicursor = [[a:blinkon0,n-v-c:block-Cursor,i-ci-ve:ver50]];
  end

end

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
-- vim.cmd.colorscheme 'oh-lucy'
local M = {
  "Yazeed1s/oh-lucy.nvim",
  priority = 1000,
  lazy = false,
  main = "oh-lucy",
  config = function()
    set_colorscheme("oh-lucy");
  end
}

return M
