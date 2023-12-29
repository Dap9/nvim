local M = {
  'nvim-treesitter/nvim-treesitter',
  -- dependencies = {
  --   "HiPhish/nvim-ts-rainbow2",
  -- },
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = { "c", "cpp", "lua", "rust", "python", "bash", "java" },
    sync_install = false,
    highlight = {
      enable = true,
      -- additional_vim_regex_highlighting = true,
    },
    -- rainbow = {
    --   enable = true,
    --   -- Which query to use for finding delimiters
    --   query = 'rainbow-parens',
    --   -- Highlight the entire buffer all at once
    --   strategy = require('ts-rainbow').strategy.global,
    -- },
    indent = {
      enable = true,
      disable = {}
    },
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB, prevent parsing on extrememly big files
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}

return M
