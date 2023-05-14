let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim/lua/plugins/heirline
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 init.lua
badd +1 ~/.config/nvim/lua/plugins/heirline/mode.lua
badd +1 filename.lua
badd +19 pos.lua
badd +1 ~/.config/nvim/lua/plugins/heirline/colors.lua
badd +76 lsp-info.lua
badd +55 git-info.lua
badd +1 term://~/.config/nvim/lua/plugins/heirline//44346:/usr/bin/fish
argglobal
%argdel
$argadd init.lua
set stal=2
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit init.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 36 + 37) / 75)
exe 'vert 1resize ' . ((&columns * 93 + 141) / 282)
exe '2resize ' . ((&lines * 35 + 37) / 75)
exe 'vert 2resize ' . ((&columns * 93 + 141) / 282)
exe '3resize ' . ((&lines * 36 + 37) / 75)
exe 'vert 3resize ' . ((&columns * 188 + 141) / 282)
exe '4resize ' . ((&lines * 35 + 37) / 75)
exe 'vert 4resize ' . ((&columns * 94 + 141) / 282)
exe '5resize ' . ((&lines * 35 + 37) / 75)
exe 'vert 5resize ' . ((&columns * 93 + 141) / 282)
argglobal
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=10
setlocal fml=1
setlocal fdn=20
setlocal fen
1
normal! zo
let s:l = 4 - ((3 * winheight(0) + 18) / 36)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4
normal! 031|
wincmd w
argglobal
if bufexists(fnamemodify("~/.config/nvim/lua/plugins/heirline/colors.lua", ":p")) | buffer ~/.config/nvim/lua/plugins/heirline/colors.lua | else | edit ~/.config/nvim/lua/plugins/heirline/colors.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.config/nvim/lua/plugins/heirline/colors.lua
endif
balt init.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=10
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 15 - ((14 * winheight(0) + 17) / 35)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 15
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("filename.lua", ":p")) | buffer filename.lua | else | edit filename.lua | endif
if &buftype ==# 'terminal'
  silent file filename.lua
endif
balt pos.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=10
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 18) / 36)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("lsp-info.lua", ":p")) | buffer lsp-info.lua | else | edit lsp-info.lua | endif
if &buftype ==# 'terminal'
  silent file lsp-info.lua
endif
balt filename.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=10
setlocal fml=1
setlocal fdn=20
setlocal fen
3
normal! zo
3
normal! zc
let s:l = 76 - ((75 * winheight(0) + 17) / 35)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 76
normal! 014|
wincmd w
argglobal
if bufexists(fnamemodify("git-info.lua", ":p")) | buffer git-info.lua | else | edit git-info.lua | endif
if &buftype ==# 'terminal'
  silent file git-info.lua
endif
balt lsp-info.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=10
setlocal fml=1
setlocal fdn=20
setlocal fen
2
normal! zo
let s:l = 1 - ((0 * winheight(0) + 17) / 35)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
3wincmd w
exe '1resize ' . ((&lines * 36 + 37) / 75)
exe 'vert 1resize ' . ((&columns * 93 + 141) / 282)
exe '2resize ' . ((&lines * 35 + 37) / 75)
exe 'vert 2resize ' . ((&columns * 93 + 141) / 282)
exe '3resize ' . ((&lines * 36 + 37) / 75)
exe 'vert 3resize ' . ((&columns * 188 + 141) / 282)
exe '4resize ' . ((&lines * 35 + 37) / 75)
exe 'vert 4resize ' . ((&columns * 94 + 141) / 282)
exe '5resize ' . ((&lines * 35 + 37) / 75)
exe 'vert 5resize ' . ((&columns * 93 + 141) / 282)
tabnext
edit ~/.config/nvim/lua/plugins/heirline/mode.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 141 + 141) / 282)
exe 'vert 2resize ' . ((&columns * 140 + 141) / 282)
argglobal
balt filename.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=10
setlocal fml=1
setlocal fdn=20
setlocal fen
1
normal! zo
let s:l = 2 - ((1 * winheight(0) + 36) / 72)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 2
normal! 016|
wincmd w
argglobal
if bufexists(fnamemodify("term://~/.config/nvim/lua/plugins/heirline//44346:/usr/bin/fish", ":p")) | buffer term://~/.config/nvim/lua/plugins/heirline//44346:/usr/bin/fish | else | edit term://~/.config/nvim/lua/plugins/heirline//44346:/usr/bin/fish | endif
if &buftype ==# 'terminal'
  silent file term://~/.config/nvim/lua/plugins/heirline//44346:/usr/bin/fish
endif
balt ~/.config/nvim/lua/plugins/heirline/mode.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=10
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 9 - ((8 * winheight(0) + 36) / 72)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 9
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 141 + 141) / 282)
exe 'vert 2resize ' . ((&columns * 140 + 141) / 282)
tabnext 1
set stal=1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
