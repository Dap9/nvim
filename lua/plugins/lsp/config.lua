local M = {}

-- Look at https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
-- for a mapping between lsp server name & mason package name when adding a new LSP server
M.servers = {
  'basedpyright',
  'clangd',
  'rust_analyzer',
  'lua_ls',
  'bashls',
  'bashls',
  'gopls',
  'neocmake',
  'markdown_oxide',
  -- 'pylsp',
  -- 'java_language_server',
}

return M
