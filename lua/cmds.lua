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

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})
