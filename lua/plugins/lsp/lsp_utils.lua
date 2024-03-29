local M = {}

M.setup = function()
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

M.servers = {
  'pyright',
  'clangd',
  'rust_analyzer',
  'lua_ls',
  'bashls',
  'bufls',
  'gopls',
  -- 'java_language_server',
}

-- Look at https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
-- for a mapping between lsp server name & mason package name when adding a new LSP server
M.mason_packages = {
  'pyright',
  'clangd',
  'rust-analyzer',
  'lua-language-server',
  'bash-language-server',
  'buf-language-server',
  'gopls',
  -- 'java-language-server',
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

M.on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

return M
