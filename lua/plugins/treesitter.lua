local M = {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile", "VeryLazy" },
  -- load treesitter early when opening a file from the cmdline
  lazy = vim.fn.argc(-1) == 0,
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  opts = {
    ensure_installed = {
      "c",
      "cpp",
      "lua",
      "rust",
      "python",
      "bash",
      "java",
      "cmake",
      "javascript",
      "typescript",
      "go",
      "fish",
      "markdown",
    },
    sync_install = false,
    highlight = {
      enable = true,
      -- additional_vim_regex_highlighting = true,
    },
    indent = {
      enable = true,
      disable = {}
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<A-t>",
        node_incremental = "<A-t>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    }
    -- disable = function(lang, buf)
    --   local max_filesize = 100 * 1024 -- 100 KB, prevent parsing on extrememly big files
    --   local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    --   if ok and stats and stats.size > max_filesize then
    --     return true
    --   end
    -- end,
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)

    -- The kind of folding used for the current window.  Possible values:
    -- |fold-manual|	manual	    Folds are created manually.
    -- |fold-indent|	indent	    Lines with equal indent form a fold.
    -- |fold-expr|	expr	    'foldexpr' gives the fold level of a line.
    -- |fold-marker|	marker	    Markers are used to specify folds.
    -- |fold-syntax|	syntax	    Syntax highlighting items specify folds.
    -- |fold-diff|	diff	    Fold text that is not changed.
    vim.o.foldmethod = 'expr';

    vim.o.foldexpr = [[v:lua.vim.treesitter.fodexpr()]];
  end,
}

return M
