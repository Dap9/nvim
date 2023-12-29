local M = {
  {
    "neovim/nvim-lspconfig",
    event = 'BufReadPre',
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function(_, _)
      local lsp_utils = require("plugins.lsp.lsp_utils")
      local mason_lspconfig = require("mason-lspconfig")
      local lspconfig = require("lspconfig")

      lsp_utils.setup()

      mason_lspconfig.setup({
        ensure_installed = lsp_utils.servers
      })

      mason_lspconfig.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            on_attach = lsp_utils.on_attach,
            capabilities = lsp_utils.capabilities,
          })
        end,
        ['clangd'] = function()
          local capabilities_cpp = lsp_utils.capabilities
          capabilities_cpp.offsetEncoding = { "uts-16" }
          lspconfig.clangd.setup({
            on_attach = lsp_utils.on_attach,
            capabilities = capabilities_cpp,
            filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
          })
        end,
        ['lua_ls'] = function()
          local lua_rtp = vim.split(package.path, ';')
          table.insert(lua_rtp, 'lua/?.lua')
          table.insert(lua_rtp, 'lua/?/init.lua')
          lspconfig.lua_ls.setup({
            on_attach = lsp_utils.on_attach,
            capabilities = lsp_utils.capabilities,
            settings = {
              Lua = {
                runtime = {
                  -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                  version = 'LuaJIT',
                  -- Setup your lua path
                  path = lua_rtp,
                },
                diagnostics = {
                  -- Get the language server to recognize the `vim` global
                  globals = { 'vim' },
                },
                workspace = {
                  -- Make the server aware of Neovim runtime files
                  library = vim.api.nvim_get_runtime_file('', true),
                  checkThirdParty = false,
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                  enable = false,
                },
              },
            },
          })
        end,
        ['rust_analyzer'] = function()
          lspconfig.rust_analyzer.setup({
            on_attach = lsp_utils.on_attach,
            capabilities = lsp_utils.capabilities,
            settings = {
              ["rust-analyzer"] = {
                imports = {
                  granularity = {
                    group = "module",
                  },
                  prefix = "self",
                },
                cargo = {
                  buildScripts = {
                    enable = true,
                  },
                },
                procMacro = {
                  enable = true
                },
              }
            }
          })
        end,
      })
    end
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {
      ui = {
        border = "rounded",
        icons = {
          server_installed = "✓",
          server_pending = "➜",
          server_uninstalled = "✗"
        },
      },
      config = function(_, opts)
        require("mason").setup(opts)
        local lsp_utils = require("lsp_utils")
        local mr = require("mason-registry")
        local packages = lsp_utils.mason_packages
        local function ensure_installed()
          for _, package in ipairs(packages) do
            local p = mr.get_package(package)
            if not p:is_installed() then
              p:install()
            end
          end
        end
        if mr.refresh then
          mr.refresh(ensure_installed)
        else
          ensure_installed()
        end
      end
    },
  }
}

return M
