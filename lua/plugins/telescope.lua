local M = {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {
      [[,ff]],
      function()
        return require('telescope.builtin').find_files({
          hidden = true,
        });
      end
    },
    { [[,fg]], function() return require('telescope.builtin').live_grep() end },
    { [[,fb]], function() return require('telescope.builtin').buffers() end },
    { [[,fs]], function() return require('telescope.builtin').grep_string() end },
    { [[,m]],  function() return require('telescope.builtin').man_pages({ sections = { "1", "2", "3" } }) end },
    { [[,ss]], function() return require('telescope.builtin').spell_suggest() end },
    { [[,fr]], function() return require('telescope.builtin').resume() end },
    { [[,fp]], function() return require('telescope.builtin').registers() end },
  },
  cmd = "Telescope",
}

return M
