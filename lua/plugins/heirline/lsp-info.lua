local conditions = require("heirline.conditions")

local Diagnostics = {
  condition = function()
    return conditions.has_diagnostics()
  end,

  static = {
    error_icon = "ⓧ ",
    warn_icon = "⚠ ",
    info_icon = "ⓘ ",
    hint_icon = "󰛩 ",
  },

  init = function(self)
    self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
    self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  end,

  update = { "DiagnosticChanged", "BufEnter" },

  {
    provider = "![",
  },
  {
    provider = function(self)
      -- 0 is just another output, we can decide to print it or not!
      return self.errors > 0 and (self.error_icon .. self.errors .. " ")
    end,
    hl = { fg = "diag_error" },
  },
  {
    provider = function(self)
      return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
    end,
    hl = { fg = "diag_warn" },
  },
  {
    provider = function(self)
      return self.info > 0 and (self.info_icon .. self.info .. " ")
    end,
    hl = { fg = "diag_info" },
  },
  {
    provider = function(self)
      return self.hints > 0 and (self.hint_icon .. self.hints)
    end,
    hl = { fg = "diag_hint" },
  },
  {
    provider = "]",
  },
}

local LSPMessages = {
  update = {  'DiagnosticChanged', 'BufEnter', },
  provider = require("lsp-status").status_progress,
  hl = { fg = "gray" },
}

local LspAttach = {
  provider = function()
    local names = {}
    for _, server in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
      table.insert(names, server.name)
    end
    return " [" .. table.concat(names, " ") .. "]"
  end,
  hl       = { fg = "green", bold = true },
}


local LspInfo = {
  condition = conditions.lsp_attached,
  update = { 'LspAttach', 'LspDetach' },
  LspAttach,
}

return {
  Diagnostics,
  LspInfo,
  LSPMessages,
}
