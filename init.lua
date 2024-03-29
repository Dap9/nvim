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

require('options')
require('plugin_manager')

vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
        require("cmds")
        require("mappings")
    end,
})
