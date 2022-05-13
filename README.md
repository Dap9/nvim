# Setup for neovim

## Mappings

### Short forms / Expantions
`<A-?>` -> `Alt + ?`

`<C-?>` -> `Ctrl + ?`

`<S-?>` -> `Shift + ?`

`<CR>` -> `Carriage Return`

`<leader>` -> `,`.

### Basic

 - `<leader><space>` -> unhighlights searches, since they stay highlighted & can get annoying...

### Moving between windows
 - `<A-h>` -> move to left window (from terminal)
 - `<A-j>` -> move to below window (from terminal)
 - `<A-k>` -> move to above window (from terminal)
 - `<A-l>` -> move to right window (from terminal)
 - `<A-Left>` -> move to left window (from terminal)
 - `<A-Down>` -> move to below window (from terminal)
 - `<A-Up>` -> move to above window (from terminal)
 - `<A-Right>` -> move to right window (from terminal)

### Easier window resizing
 - `<C-Up>` -> `resize -2`
 - `<C-Down>` -> `resize +2`
 - `<C-Left>` -> `vertical resize -2`
 - `<C-Right>` -> `vertical resize +2`

### Mundo
 - `<leader>u` -> toggle Mundo

### Vim-fugitive
 - `<leader>g` -> `:Git `
 - `<leader>ga` -> `:Git add `
 - `<leader>gc` -> `:Git commit -m `
 - `<leader>gg` -> show git graph

### LSP
NOTE: These only work if an LSP server is running for the active buffer

 - `<space>e` -> show lsp diagnostics
 - `<space>q` -> show lsp diagnostic list
 - `[d` -> go to previous lsp diagnostic
 - `]d` -> go to next lsp diagnostic
 - `gD` -> go to declaration of item under cursor
 - `gd` -> go to definition of item under cursor
 - `K` -> show info about item under cursor
 - `<C-k>` -> shows signature of function (seems to only work after entering at least 1 parameter)
 - `<leader>wa` -> add workspace folder
 - `<leader>wr` -> remove workspace folder
 - `<leader>D` -> list workspace folders
 - `<leader>rn` -> rename all occurances of item under cursor
 - `<leader>ca` -> show code actions possible
 - `gr` -> list all references of item under cursor
 - `<leader>f` -> format buffer

### NVIM-CMP

 - `<C-p>` -> select previous item
 - `<C-n>` -> select next item
 - `<C-d>` -> scroll docs backwards
 - `<C-f>` -> scroll docs forwards
 - `<C-Space>` -> complete item
 - `<C-e>` -> close autocomplete window
 - `<CR>` -> confirm suggested completion & replace
 - `<Tab>` -> select next item or expand/jump
 - `<S-Tab>` -> select previous item or jump back

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
 - TreeSitter
