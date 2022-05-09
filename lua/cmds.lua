vim.api.nvim_set_hl(0, "eCursor", { fg = "white", bg = "white" });
-- Reset cursor when exiting nvim
vim.api.nvim_create_augroup("resetCursor", {});
vim.api.nvim_create_autocmd(
  { "VimLeave" }, {
  pattern = { "*" },
  command = [[set guicursor=a:ver90-eCursor]],
  group = "resetCursor"
  }
);

-- Auto do PackerCompile after writing to plugins.lua
vim.api.nvim_create_augroup("packer_user_config", {});
vim.api.nvim_create_autocmd(
  { "BufWritePost" },
  {
    pattern = "plugins.lua",
    command = [[source <afile> | PackerCompile]],
    group = "packer_user_config"
  }
);
