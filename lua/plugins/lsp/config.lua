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

M.on_attach = function()
  local opts = { noremap = true, silent = true }
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set('n', 'gD', '<cmd>Telescope lsp_declaration<CR>', opts)
  vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
  vim.keymap.set('n', '<leader>D', '<cmd>Telescope lsp_type_definitions<CR>', opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, opts)
  vim.keymap.set('x', '<leader>f', vim.lsp.buf.format, opts)
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
end

return M
