" Mappings
let mapleader="," 
nnoremap <leader><space> :nohlsearch<CR> " Turns off search highlight when you press ',<space>'
nnoremap <leader>u :MundoToggle<CR>
nnoremap <leader>g :Git<space>
" nnoremap <leader>a :Ack!<space>
"doesnt work in neovim -> nmap <C-w>t :vert term<CR><C-w>R " Opens new terminal on the right. add 'rm -rf' for some fun

" Settings
set number " If you dont use 1-3 download ram from https://www.bitcoin-mining-virus-here.com
syntax on
colorscheme radicalgoodspeed
" Options for colorschemes:
"   badwolf -> cant read some keywords with red cursor
"   angr
"   Atelier_CaveDark
"   anotherdark
"   basic-dark
"   chocolate -> Insert mode is REALLY bad though
"   codedark
"   codeblocks_dark
"   darkburn
"   darkdevel -> cant read some keywords with red cursor
"   despacio
"   duotone-darkcave
"   ego
"   ir_black
"   molokai_dark
"   mint
"   graywh
"   radicalgoodspeed
"set tabstop=2 " Set tabsize -> not needed since using softtabstop & expandtab
set autoindent 
set smartindent
set shiftwidth=2
set expandtab " Expand tab to use spaces
set softtabstop=2 " Number of spaces a tab counts for when editing. So this value is the number of spaces that is inserted when you hit <TAB> and also the number of spaces that are removed when you backspace
set cursorline "Underlines the line where cursor is at
filetype plugin indent on
set wildmenu "
set lazyredraw " For faster macros, otherwise vim redraws everytime
set showmatch " Shows matching parentheses
set incsearch " Search as characters are entered
set hlsearch " Highlights searches
set foldenable " We got folding here, didnt even know lol. should be good
set foldmethod=syntax   " fold based on syntax 
set foldlevelstart=10 " Higher -> more lines folded. Max val = 99, min = 0
set undofile
set undodir=~/.nvim/undo

highlight eCursor guifg=white guibg=white
augroup configgroup
  autocmd!

  " reset cursor when vim exits
  autocmd VimLeave * set guicursor=a:ver90-eCursor
  autocmd BufEnter Makefile setlocal noexpandtab

augroup END

" Setup directories for backup instead of having stupid .filname.swp files in the current directory
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" Plugins
call plug#begin()

Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
"Plug 'mileszs/ack.vim'
"Plug 'ctrlpvim/ctrlp.vim' " -> idk what its doing, figure it out 1st lol

call plug#end()

" Setup a fuzzy search thing, idk wat its for -> remove if not used (included mapping here, but change to Mappings if used)
"let g:ctrlp_match_window = 'bottom,order:ttb'
"let g:ctrlp_switch_buffer = 0
"let g:ctrlp_working_path_mode = 0
"let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" Setup cursor shapes & colors
set termguicolors
highlight Cursor guifg=NONE guibg=red
highlight iCursor guifg=NONE guibg=red
set guicursor=a:blinkon0
      \,n-v-c:block-Cursor
      \,i-ci-ve:ver50-iCursor
