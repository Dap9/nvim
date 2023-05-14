local M = {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  event = "BufReadPost",
  opts = {
    ensure_installed = { "c", "cpp", "lua", "rust", "python", "bash", "java" },
    -- ensure_installed = 'maintained', -> depretiated
    sync_install = false,
    highlight = {
      enable = true,
      -- additional_vim_regex_highlighting = true,
    },
    rainbow = {
      enable = true,
      -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
      extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = nil, -- Do not enable for files with more than n lines, int
      -- colors = {}, -- table of hex strings
      -- termcolors = {} -- table of colour name strings
    },
    indent = {
      enable = true,
      disable = {}
    },
    disable = function(lang, buf)
      local max_filesize = 100 * 1024   -- 100 KB, prevent parsing on extrememly big files
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
