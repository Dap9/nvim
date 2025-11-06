-- This entire config is **HEAVILY** taken from LazyVim. Almost all of it.
local M = {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    local ts = require("nvim-treesitter")
    if not ts.get_installed then
      vim.health.error("Please restart Neovim and run `:TSUpdate` to use the `nvim-treesitter` **main** branch.")
      return
    end

    local ts_utils = require("plugins.treesitter.utils")
    ts_utils.build(function()
      ts.update(nil, { summary = true })
    end)
  end,
  event = { "BufReadPost", "BufNewFile", "VeryLazy" },
  -- load treesitter early when opening a file from the cmdline
  lazy = vim.fn.argc(-1) == 0,
  branch = "main",
  cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
  ---@alias plugins.treesitter.TSFeat { enable?: boolean, disable?: string[] }
  ---@class plugins.treesitter.TSConfig: TSConfig
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
      "tsx",
      "go",
      "fish",
      "markdown",
      "cuda",
      "disassembly",
      "graphql",
      "llvm",
      "nasm",
      "powershell",
      "tmux",
      "toml",
      "yaml",
      "dockerfile",
      "sql",
      "starlark",
      "systemverilog",
      "objdump",
      "asm",
      "arduino",
      "gitignore",
      "gitcommit",
      "make",
      "gdscript",
      "regex",
    },
    ---@type plugins.treesitter.TSFeat
    highlight = {
      enable = true,
    },
    ---@type plugins.treesitter.TSFeat
    indent = {
      enable = true,
    },
    ---@type plugins.treesitter.TSFeat
    folds = {
      enable = true,
    },
  },

  ---@param opts plugins.treesitter.TSConfig
  config = function(_, opts)
    local ts = require("nvim-treesitter")
    local ts_utils = require("plugins.treesitter.utils")

    setmetatable(require("nvim-treesitter.install"), {
      __newindex = function(_, k)
        if k == "compilers" then
          vim.schedule(function()
            vim.health.report_error({
              "Setting custom compilers for `nvim-treesitter` is no longer supported.",
              "",
              "For more info, see:",
              "- [compilers](https://docs.rs/cc/latest/cc/#compile-time-requirements)",
            })
          end)
        end
      end,
    })

    -- some quick sanity checks
    if not ts.get_installed then
      return vim.health.error("Please use `:Lazy` and update `nvim-treesitter`")
    elseif type(opts.ensure_installed) ~= "table" then
      return vim.health.error("`nvim-treesitter` opts.ensure_installed must be a table")
    end

    -- setup treesitter
    ts.setup(opts)
    ts_utils.get_installed(true) -- initialize the installed langs

    -- install missing parsers
    local install = vim.tbl_filter(function(lang)
      return not ts_utils.have(lang)
    end, opts.ensure_installed or {})
    if #install > 0 then
      ts_utils.build(function()
        ts.install(install, { summary = true }):await(function()
          ts_utils.get_installed(true) -- refresh the installed langs
        end)
      end)
    end

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("lazyvim_treesitter", { clear = true }),
      callback = function(ev)
        local ft, lang = ev.match, vim.treesitter.language.get_lang(ev.match)
        if not ts_utils.have(ft) then
          return
        end

        ---@param feat string
        ---@param query string
        local function enabled(feat, query)
          local f = opts[feat] or {} ---@type plugins.treesitter.TSFeat
          return f.enable ~= false
            and not (type(f.disable) == "table" and vim.tbl_contains(f.disable, lang))
            and ts_utils.have(ft, query)
        end

        -- highlighting
        if enabled("highlight", "highlights") then
          pcall(vim.treesitter.start, ev.buf)
        end

        -- indents
        -- TODO: These are currently fucked. Issue i found for this: https://github.com/nvim-treesitter/nvim-treesitter/issues/1136
        -- if enabled("indent", "indents") then
        --   vim.api.nvim_set_option_value("indentexpr", "v:lua.ts_utils.indentexpr()", { scope = "local" })
        -- end

        -- folds
        if enabled("folds", "folds") then
          vim.api.nvim_set_option_value("foldmethod", "expr", { scope = "local" })
          vim.api.nvim_set_option_value("foldexpr", "v:lua.ts_utils.foldexpr()", { scope = "local" })
        end
      end,
    })
  end,
}

return M
