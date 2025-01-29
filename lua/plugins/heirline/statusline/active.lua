local common = require("plugins.heirline.components.common")
local statusline = {
  condition = require("heirline.conditions").is_active,

  require("plugins.heirline.components.vimode"),
  common.space,
  require("plugins.heirline.components.fileblock"),
}

return statusline
