--[[
Main config file for nvim configuration.

Each section is added modularly with:
    require('module_file_name')


    options: All settings for formatting nvim

    mappings: All (re)mapped keybindings

    cmds: autocmds and augroups

    plugins: plugin install + settings
        NOTE: may contain some keybindings too since they are tied with plugins
--]]

-- These options are ones that are either:
--  1. required to be set prior to plugins
--  2. options that might be overridden by plugins.
--
--  By default options should go here
require("options")

-- Sets up the plugin manager to install & setup plugins
require("config.lazy")

-- These **should not** depend on a plugin. Plugin specific keymaps should
-- be set in the conf for the plugin.
require("keymaps")

vim.api.nvim_create_autocmd("User", {
  -- Assuming that the `lazy.nvim` plugin manager is installed.
  -- It's a user event, thus done this way. I don't like it deviating
  -- from the 'event' trigger directly, but can't do much about it for now
  pattern = "VeryLazy",
  callback = function()
    require("autocmds")

    -- Override some options that might be set by a plugin.
    -- E.g. some lsps might set `softtabstop` and `shiftwidth`
    -- This will ensure that doesn't happen
    require("options_overrides")
  end
})
