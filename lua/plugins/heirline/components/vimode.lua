local utils = require("heirline.utils")

local vimode = {
  -- We can now access the value of mode() that, by now, would have been
  -- computed by `init()` and use it to index our strings dictionary.
  -- note how `static` fields become just regular attributes once the
  -- component is instantiated.
  -- To be extra meticulous, we can also add some vim statusline syntax to
  -- control the padding and make sure our string is always at least 2
  -- characters long. Plus a nice Icon.
  provider = function(self)
    return "%-2(" .. self.mode_names[self.mode] .. "%)"
  end,

  hl = function(self)
    local mode = self.mode:sub(1, 1) -- get only the first mode character

    utils.get_highlight("")

    return { fg = self.mode_colors[mode], bold = true }
  end,

  init = function(self)
    self.mode = vim.fn.mode(1)
  end,

  -- Re-evaluate the component only on ModeChanged event!
  -- Also allows the statusline to be re-evaluated when entering operator-pending mode
  update = {
    "ModeChanged",

    -- :h ModeChanged describes the pattern matched here. In this case we simply match any change in mode
    pattern = "*:*",
    callback = vim.schedule_wrap(function()
      vim.cmd("redrawstatus")
    end),
  },

  static = {
    -- :h mode()
    mode_names = {
      n = "N", -- Normal mode
      no = "N?", -- Operator-pending mode
      nov = "N?", -- Operator-pending (forced characterwise Visual)
      noV = "N?", -- Operator-pending (forced linewise Visual)
      ["no\22"] = "N?", -- Operator-pending (forced blockwise Visual)

      niI = "Ni", -- Normal mode (transitioned from Insert with a capital I)
      niR = "Nr", -- Normal mode (transitioned from Replace)
      niV = "Nv", -- Normal mode (transitioned from Virtual Replace)
      nt = "Nt", -- Normal mode in a Terminal job buffer

      v = "V", -- Visual by character
      vs = "Vs", -- Visual (Select sub-mode by character)
      V = "V_", -- Visual by line
      Vs = "Vs", -- Visual line (Select sub-mode)
      ["\22"] = "^V", -- Visual block ('\22' = <C-v> in lua)
      ["\22s"] = "^V", -- Visual block (Select sub-mode)

      s = "S", -- Select by character
      S = "S_", -- Select by line
      ["\19"] = "^S", -- Select block

      i = "I", -- Insert mode
      ic = "Ic", -- Insert mode (completion in progress)
      ix = "Ix", -- Insert mode (extended completion)

      R = "R", -- Replace mode
      Rc = "Rc", -- Replace mode (completion in progress)
      Rx = "Rx", -- Replace mode (extended completion)
      Rv = "Rv", -- Virtual Replace mode
      Rvc = "Rv", -- Virtual Replace mode (with completion in progress)
      Rvx = "Rv", -- Virtual Replace mode (extended completion)

      c = "C", -- Command-line mode
      cv = "Ex", -- Ex mode
      r = "...", -- "hit-enter" prompt
      rm = "M", -- "more" prompt (pager)
      ["r?"] = "?", -- "confirm" prompt (for :confirm queries)
      ["!"] = "!", -- Shell or external command is running
      t = "T", -- Terminal job mode
    },
    mode_colors = {
      n = "red",
      i = "green",
      v = "cyan",
      V = "cyan",
      ["\22"] = "cyan",
      c = "orange",
      s = "purple",
      S = "purple",
      ["\19"] = "purple",
      R = "orange",
      r = "orange",
      ["!"] = "red",
      t = "red",
    },
  },
}

return utils.surround({ "█", " " }, "vimode_bg", vimode)
