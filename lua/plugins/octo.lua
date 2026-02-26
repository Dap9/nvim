local function open_in_tab(_, item)
  if item.file then
    vim.cmd("tabedit " .. item.file)
  end
end

local M = {
  "pwntester/octo.nvim",
  cmd = "Octo",
  config = function(_, opts)
    require("octo").setup(opts)
    local cmds = require("octo.commands").commands
    local utils = require("octo.utils")
    setmetatable(cmds.pr, {
      __call = function(_)
        utils.get_pull_request_for_current_branch(function(pr)
          vim.cmd("tabedit " .. utils.get_pull_request_uri(pr.number, pr.repo))
        end)
      end,
    })
  end,
  opts = {
    picker = "snacks",
    enable_builtin = true,
    picker_config = {
      snacks = {
        actions = {
          issues = {
            { name = "confirm", fn = open_in_tab, lhs = "<CR>", desc = "Open in tab", mode = { "n", "i" } },
          },
          pull_requests = {
            { name = "confirm", fn = open_in_tab, lhs = "<CR>", desc = "Open in tab", mode = { "n", "i" } },
          },
          notifications = {
            { name = "confirm", fn = open_in_tab, lhs = "<CR>", desc = "Open in tab", mode = { "n", "i" } },
          },
          search = {
            { name = "confirm", fn = open_in_tab, lhs = "<CR>", desc = "Open in tab", mode = { "n", "i" } },
          },
        },
      },
    },
  },
  keys = {
    {
      "<leader>oi",
      "<CMD>Octo issue list<CR>",
      desc = "List GitHub Issues",
    },
    {
      "<leader>op",
      "<CMD>Octo pr list<CR>",
      desc = "List GitHub PullRequests",
    },
    {
      "<leader>od",
      "<CMD>Octo discussion list<CR>",
      desc = "List GitHub Discussions",
    },
    {
      "<leader>on",
      "<CMD>Octo notification list<CR>",
      desc = "List GitHub Notifications",
    },
    {
      "<leader>os",
      function()
        require("octo.utils").create_base_search_command { include_current_repo = true }
      end,
      desc = "Search GitHub",
    },
    {
      "<leader>oc",
      "<CMD>Octo pr create draft<CR>",
      desc = "Create Draft PR",
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "folke/snacks.nvim",
    "nvim-tree/nvim-web-devicons",
  },
}

return M
