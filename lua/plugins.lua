-- Bootstraps packer to ensure its installed on 1st setup if packer hasnt
-- already been installed
local install_path =
    vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  Packer_bootstrap = vim.fn.system({ 'git', 'clone', '--depth', '1',
    'https://github.com/wbthomason/packer.nvim', install_path })
end


-- Needed to use packer as it is added by default as opt 1st time
vim.cmd([[packadd packer.nvim]])
local load = require('packer').startup(function(use)
  -- Allows packer to manage itself
  use { 'wbthomason/packer.nvim' }

  -- Helps traverse undo tree
  -- REQUIRES pynvim (pip)
  use { 'simnalamburt/vim-mundo' }

  -- Git wrapper for vim
  -- TODO: Fix git msgs not being colored
  use { 'tpope/vim-fugitive' }

  -- Adds current modifications to gutter
  use { 'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup();
    end
  }

  -- Fancy commenting shortcuts
  use { 'preservim/nerdcommenter' }

  -- Fancy status bar
  --[[
     [ use {
     [   'vim-airline/vim-airline',
     [   'vim-airline/vim-airline-themes'
     [ }
     ]]
  use { "feline-nvim/feline.nvim" }
  use { 'nvim-tree/nvim-web-devicons' }

  -- lsp
  use {
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'saadparwaiz1/cmp_luasnip',
    'L3MON4D3/LuaSnip'
  }

  -- treesitter
  -- TODO: fix returns not being highlighted
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- REQUIRES: `ripgrep` (apt)
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- Colorschemes I like
  -- Feels too bright
  -- use { 'Mofiqul/dracula.nvim', }
  -- use { 'gosukiwi/vim-atom-dark', }
  -- Seems to be bugged for treesitter, `return` is never highlighted
  -- use { 'svjunic/RadicalGoodSpeed.vim', }
  -- use { 'joshdick/onedark.vim', }
  -- use { 'NLKNguyen/papercolor-theme', }
  -- use { 'morhetz/gruvbox', }
  -- use { 'bluz71/vim-moonfly-colors' }
  --[[
  ?? idk why this one is here, it just looks funny
     use {
       'vim-scripts/greenvision'
     }
   --]]
  -- use { 'tomasr/molokai' }
  use { 'Yazeed1s/oh-lucy.nvim' }
  use { 'AlexvZyl/nordic.nvim' }
  use { 'kartikp10/noctis.nvim', requires = { 'rktjmp/lush.nvim' } }
  use { 'sam4llis/nvim-tundra' }
  use { 'catppuccin/nvim',
    as = 'catppuccin',
    config = function()
      vim.g.catppuccin_flavour = 'mocha'
      require("catppuccin").setup({
        integrations = {
          mason = true,
        }
        --[[
           [ color_overrides = {
           [   all = {
           [     crust = "#000000",
           [   },
           [ }
           ]]
      })
    end
  }

  use { "anuvyklack/windows.nvim",
    requires = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim"
    },
    config = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false
      require('windows').setup({
        autowidth = {
          enable = false
        }
      })
    end
  }

  use {
    'stevearc/aerial.nvim',
    config = function()
      require('aerial').setup({
        on_attach = function(bufnr)
          -- Toggle the aerial window with <leader>a
          vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>a',
            '<cmd>AerialToggle left<CR>', {})
          -- Jump forwards/backwards with '{' and '}'
          vim.api.nvim_buf_set_keymap(bufnr, 'n', '{',
            '<cmd>AerialPrev<CR>', {})
          vim.api.nvim_buf_set_keymap(bufnr, 'n', '}',
            '<cmd>AerialNext<CR>', {})
          -- Jump up the tree with '[[' or ']]'
          vim.api.nvim_buf_set_keymap(bufnr, 'n', '[[',
            '<cmd>AerialPrevUp<CR>', {})
          vim.api.nvim_buf_set_keymap(bufnr, 'n', ']]',
            '<cmd>AerialNextUp<CR>', {})
        end
      })
    end
  }

  use { "m4xshen/smartcolumn.nvim" }

  if Packer_bootstrap then
    require('packer').sync()
  end
end)

-- colorscheme setup in options

-- airline config USING feline NOW
-- vim.g.airline_theme = 'minimalist'
-- Required to be enabled before calling setup()

vim.o.termguicolors = true
local ctp_feline = require('catppuccin.groups.integrations.feline')
ctp_feline.setup({
  sett = {
    show_modified = true
  }
})
require("feline").setup({
  components = ctp_feline.get(),
})

-- nerdcommenter config
vim.g.NERDCreateDefaultMappings = 1;
vim.g.NERDCommentEmptyLines = 1;
vim.g.NerdTrimTrailingWhitespace = 1;
vim.g.NERDSpaceDelims = 1;


-- Treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "cpp", "lua", "rust", "python", "bash", "java" },
  -- ensure_installed = 'maintained', -> depretiated
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
    disable = {}
  }
}

-- LSP settigs
-- Include the servers you want to have installed by default below
local servers = {
  'pyright',
  'clangd',
  'rust_analyzer',
  'lua_ls',
  'bashls',
  'bufls'
}

require("mason").setup({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})

require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true
})


-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local lspconfig = require('lspconfig')

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl',
    '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', [[<cmd>lua vim.lsp.buf.format()<CR>]], opts)
end

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
for _, lsp in ipairs(servers) do
  if lsp == 'clangd' then
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
    }
  else
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
end

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs( -4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable( -1) then
        luasnip.jump( -1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

require('smartcolumn').setup()


return load;
