local M = {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ty = {
          on_attach = require("plugins.lsp.config").on_attach,
        },
        ruff = {
          cmd = { "uv", "run", "ruff", "server" },
          mason = false,
          on_attach = function(client, _)
            client.server_capabilities.hoverProvider = false
            local options_overrides = require("config.options_overrides")
            local buf_path = vim.api.nvim_buf_get_name(0)

            -- Try pyproject.toml first
            local pyproject = options_overrides.find_upwards(buf_path, "pyproject.toml")
            if pyproject and vim.fn.filereadable(pyproject) == 1 then
              local indent = options_overrides.parse_pyproject_toml(pyproject)
              if indent then
                options_overrides.override_tabwidth(indent)
                return
              end
            end

            -- Fallback: try ruff.toml
            local ruff = options_overrides.find_upwards(buf_path, "ruff.toml")
            if ruff and vim.fn.filereadable(ruff) == 1 then
              local indent = options_overrides.parse_ruff_toml(ruff)
              if indent then
                options_overrides.override_tabwidth(indent)
                return
              end
            end

            -- Fallback: try .ruff.toml
            ruff = options_overrides.find_upwards(buf_path, ".ruff.toml")
            if ruff and vim.fn.filereadable(ruff) == 1 then
              local indent = options_overrides.parse_ruff_toml(ruff)
              if indent then
                options_overrides.override_tabwidth(indent)
                return
              end
            end

            -- No configuration found — use default settings
            vim.notify("No formatter indent setting found; using default tab width.", vim.log.levels.INFO)
          end,
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
      formatters_by_ft = {
        python = {
          "ruff_fix",
          "ruff_format",
          "ruff_organize_imports",
        },
      },
      formatters = {
        ruff_fix = {
          command = "uv",
          prepend_args = { "run", "--no-sync", "ruff" },
        },
        ruff_format = {
          command = "uv",
          prepend_args = { "run", "--no-sync", "ruff" },
        },
        ruff_organize_imports = {
          command = "uv",
          prepend_args = { "run", "--no-sync", "ruff" },
        },
      },
    },
  },
}

return M
