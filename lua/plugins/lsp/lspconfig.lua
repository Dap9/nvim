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
    { "williamboman/mason-lspconfig.nvim", config = function() end },
    "saghen/blink.cmp",
  },

  opts = {
    -- options for vim.diagnostic.config()
    ---@type vim.diagnostic.Opts
    diagnostics = {
      underline = true,
      virtual_text = {
	source = "if_many",
      },
      -- signs = {},
      -- float = {},
      update_in_insert = true,
      -- severity_sort = {},
    },
    inlay_hints = {
      enabled = true,
    },

    -- Any global capabilities can be put here
    capabilities = {},

    -- LSP Server Settings
    ---@type lspconfig.options
    servers = {},

    -- you can do any additional lsp server setup here
    -- return true if you don't want this server to be setup with lspconfig
    ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
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

  config = function(_, opts)
    local config = require("plugins.lsp.config");
    local mason_lspconfig = require("mason-lspconfig");

    local servers = opts.servers;

    -- get all the servers that are available through mason-lspconfig
    all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package);

    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      require("blink.cmp").get_lsp_capabilities() or {},
      opts.capabilities or {}
    );

    local setup = function(server)
      local server_opts = vim.tbl_deep_extend(
        "force",
        vim.deepcopy(capabilities),
        servers[server] or {}
      );

      if server_opts.enabled == false then
        return;
      end

      if opts.setup[server] then
        if opts.setup[server](server, server_opts) then
            return
          end
        elseif opts.setup["*"] then
          if opts.setup["*"](server, server_opts) then
            return
          end
      end
      require("lspconfig")[server].setup(server_opts)
    end

    local ensure_installed = {} ---@type string[]

    for server, server_opts in pairs(servers) do
      if server_opts then
        server_opts = server_opts == true and {} or server_opts
        if server_opts.enabled ~= false then
          -- run manual setup if mason=false or if this is a server that cannot
          -- be installed with mason-lspconfig
          if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end
    end

    mason_lspconfig.setup({
      ensure_installed = ensure_installed,
      automatic_installation = true,
      handlers = {
        setup
      },
    });
  end,
}

return M
