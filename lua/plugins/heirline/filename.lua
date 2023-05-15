local conditions = require("heirline.conditions")
local h_utils = require("heirline.utils")

local FileInfoBlock = {
  init = function(self)
    self.filename = vim.fn.expand("%f")
  end
}

local WorkDir = {
  init = function(self)
    self.icon = (vim.fn.haslocaldir(0) == 1 and "l" or "g") .. " " .. " "
    local cwd = vim.fn.getcwd(0)
    self.cwd = vim.fn.fnamemodify(cwd, ":~")
  end,
  hl = { fg = "LightCyan", bold = true },
  flexible = 1,

  {
    -- evaluates to the full-lenth path
    provider = function(self)
      local trail = self.cwd:sub(-1) == "/" and "" or "/"
      return self.icon .. self.cwd .. trail .. " "
    end,
  },
  {
    -- evaluates to the shortened path
    provider = function(self)
      local cwd = vim.fn.pathshorten(self.cwd)
      local trail = self.cwd:sub(-1) == "/" and "" or "/"
      return self.icon .. cwd .. trail .. " "
    end,
  },
  {
    -- evaluates to "", hiding the component
    provider = "",
  }
}

local Filename = {
  init = function(self)
    -- trim the pattern relative to the current directory. For other
    -- options, see :h filename-modifers
    self.lfilename = vim.fn.fnamemodify(self.filename, ":.")
    if self.filename == "" then self.lfilename = "[No Name]" end
  end,
  hl = { fg = "dir" },
  flexible = 2,

  {
    provider = function(self)
      return self.lfilename
    end,
  },
  {
    provider = function(self)
      vim.fn.pathshorten(self.lfilename)
    end
  }
}

local FileFlags = {
  {
    condition = function()
      return vim.bo.modified
    end,
    provider = "[+]",
    hl = { fg = "green" },
  },
  {
    condition = function()
      return not vim.bo.modifiable or vim.bo.readonly
    end,
    provider = "🔒",
    hl = { fg = "orange" },
  },
}


FileInfoBlock = h_utils.insert(FileInfoBlock,
  Filename,
  FileFlags,
  { provider = '%<' } -- this means that the statusline is cut here when there's not enough space
)


local TerminalName = {
  -- we could add a condition to check that buftype == 'terminal'
  -- or we could do that later (see #conditional-statuslines below)
  provider = function()
    local tname, _ = vim.fn.expand("%f"):gsub(".*:", "")
    return " " .. tname
  end,
  hl = { fg = "blue", bold = true },
}

return {
  WorkDir,
  FileInfoBlock,
}
