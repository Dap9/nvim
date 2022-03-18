-- Reset cursor when exiting nvim
vim.cmd([[
    highlight eCursor guifg=while guibg=white
    augroup configgroup
        autocmd!

        autocmd VimLeave * set guicursor=a:ver90-eCursor
    augroup END
]]);

-- Auto do PackerCompile after writing to plugins.lua
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
