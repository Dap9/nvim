-- TODO: figure out how to auto load each of these files and return it instead
-- of doing this manual load & return
local M = {
  -- {
  --   "williamboman/mason.nvim",
  --   opts = {
  --     ensure_installed = { lua_language_server },
  --   }
  -- },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
	lua_ls = {
          on_attach = require("plugins.lsp.config").on_attach,
	  settings = {
	    Lua = {
	      workspace = {
		checkThirdParty = false,
	      },
	      codeLens = {
		enable = true,
	      },
	      completion = {
		callSnippet = "Replace",
	      },
	      doc = {
		privateName = { "^_" },
	      },
	      hint = {
		enable = true,
		setType = false,
		paramType = true,
		paramName = "Disable",
		semicolon = "Disable",
		arrayIndex = "Disable",
	      },
	    },
	  },
	},
      }
    },
  },
}

return M
