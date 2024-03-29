 -- Integration with tmux

 local M = {
   'aserowy/tmux.nvim',
   lazy = false,
   opts = {
     navigation = {
       enable_default_keybindings = false,
       cycle_navigation = false,
     },
     resize = {
       enable_default_keybindings = false,
     },
   },
   config = function(_, opts)
     require("tmux").setup(opts)
   end
   ,
 }

 -- return M

 return M
