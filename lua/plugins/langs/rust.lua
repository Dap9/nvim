local M = {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rust_analyzer = {
          on_attach = function()
            require("plugins.lsp.config").on_attach()

            -- This functionality is to get around https://github.com/rust-lang/rust-analyzer/issues/1191
            -- Find the Cargo.toml and check rustfmt.toml for the indent value
            local option_overrides = require("config.options_overrides")

            local buf_path = vim.api.nvim_buf_get_name(0)
            local cargo_toml = option_overrides.find_upwards(buf_path, "Cargo.toml")
            if not cargo_toml then
              return
            end

            local project_dir = vim.fs.dirname(cargo_toml)
            local rustfmt_path = project_dir .. "/rustfmt.toml"
            if vim.fn.filereadable(rustfmt_path) == 0 then
              rustfmt_path = project_dir .. "/.rustfmt.toml"
            end

            if vim.fn.filereadable(rustfmt_path) == 1 then
              local indent = option_overrides.parse_rustfmt_toml(rustfmt_path)
              option_overrides.override_tabwidth(indent)
            end
          end,
        },
      },
    },
  },
}

return M
