# Setup for neovim

## Mappings

The leader maps to `,`.

The following mappings exist:
 - `<leader><space>` -> unhighlights searches, since they stay highlighted & can get annoying...
 - `<leader>u` -> toggle Mundo
 - `<leader>g` -> `:Git `
 - `<leader>ga` -> `:Git add `
 - `<leader>gc` -> `:Git commit -m `
 - `<leader>gg` -> show git graph

 - `

## Options

## Plugins

Plugins are managed with [`packer.nvim`](https://github.com/wbthomason/packer.nvim) -- also manages itself

Basic usage:

```
-- You must run this or `PackerSync` whenever you make changes to your plugin configuration
-- Regenerate compiled loader file
:PackerCompile

-- Remove any disabled or unused plugins
:PackerClean

-- Clean, then install missing plugins
:PackerInstall

-- Clean, then update and install plugins
:PackerUpdate

-- Perform `PackerUpdate` and then `PackerCompile`
:PackerSync

-- Loads opt plugin immediately
:PackerLoad optional-plugin-name(s)
```

Currently using the following plugins:
 - Mundo
 - Fugitive
 - GitSigns
   - requires Plenary
 - NerdCommenter
 - Vim-Airline
   - Vim-Airline(-themes)
 - LSP Config
   - nvim-lsp-installer
   - nvim-cmp
   - cmp-nvim-lsp
   - cmp_luasnip
   - LuaSnip
