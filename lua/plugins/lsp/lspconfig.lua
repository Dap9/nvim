local M = {
  "neovim/nvim-lspconfig",
  event = {
    "BufReadPost",
    "BufNewFile",
    "BufWritePre",
  },
  dependencies = {
    "williamboman/mason.nvim",
    -- LazyVim does this. Not sure why
    { "mason-org/mason-lspconfig.nvim", config = function() end },
    "saghen/blink.cmp",
  },

  opts = {
    -- options for vim.diagnostic.config()
    ---@type vim.diagnostic.Opts
    diagnostics = {
      underline = true,
      virtual_text = {
        source = "if_many",
        severity = {
          min = vim.diagnostic.severity.ERROR,
        },
      },
      -- signs = {},
      -- float = {},
      update_in_insert = true,
      -- severity_sort = {},
    },
    inlay_hints = {
      enabled = true,
    },
    -- Codelens allows displays of contextual info. E.g. show number of references,
    -- run a test in the source code
    codelens = {
      enabled = true,
    },

    -- Any global capabilities can be put here
    capabilities = {},

    -- LSP Server Settings
    ---@type table<string, vim.lsp.Config|boolean>
    servers = {},

    -- you can do any additional lsp server setup here
    -- return true if you don't want this server to be setup with lspconfig
    ---@module "lspconfig"
    ---@type table<string, fun(server:string, opts: vim.lsp.Config):boolean?>
    setup = {
      -- example to setup with typescript.nvim
      -- tsserver = function(_, opts)
      --   require("typescript").setup({ server = opts })
      --   return true
      -- end,
      -- Specify * to use this function as a fallback for any server
      -- ["*"] = function(server, opts) end,
    },
  },

  config = vim.schedule_wrap(function(_, opts)
    vim.diagnostic.config(vim.deepcopy(opts.diagnostics))
    vim.lsp.inlay_hint.enable(opts.inlay_hints.enabled)

    local mason_lspconfig = require("mason-lspconfig")

    local servers = opts.servers

    -- get all the servers that are available through mason-lspconfig
    local all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings").get_mason_map().lspconfig_to_package)
    local mason_exclude = {}

    local capabilities =
      vim.tbl_deep_extend("force", {}, require("blink.cmp").get_lsp_capabilities() or {}, opts.capabilities or {})

    vim.lsp.config("*", { capabilities = capabilities })

    ---@return boolean? exclude automatic setup
    local function configure(server)
      local server_opts = servers[server]
      server_opts = server_opts == true and {} or (not server_opts) and { enabled = false } or server_opts

      if server_opts.enabled == false then
        mason_exclude[#mason_exclude + 1] = server
        return
      end

      local use_mason = server_opts.mason ~= false and vim.tbl_contains(all_mslp_servers, server)
      local setup = opts.setup[server] or opts.setup["*"]
      if setup and setup(server, server_opts) then
        mason_exclude[#mason_exclude + 1] = server
      else
        vim.lsp.config(server, server_opts)
        if not use_mason then
          vim.lsp.enable(server)
        end
      end
      return use_mason
    end

    local install = vim.tbl_filter(configure, vim.tbl_keys(opts.servers))
    mason_lspconfig.setup({
      ensure_installed = install,
      automatic_enable = { exclude = mason_exclude },
    })
  end),
}

return M
