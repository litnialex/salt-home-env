set nocompatible        " Use Vim defaults (much better!)
set ai                  " Always set auto-indenting on
set history=50          " keep 50 lines of command history
"set encoding=utf-8
set nowrap
set hlsearch
set ignorecase
set smartcase
set tabstop=2
set shiftwidth=2
set expandtab
syntax on
"set formatoptions=ro
set mouse-=a
set confirm
set colorcolumn=88

"NETRW management
let g:netrw_liststyle = 3 "3: tree style listing
let g:netrw_banner = 0 "0: suppress the banner
let g:netrw_winsize = 20 "specify initial size of new windows in percent
let g:netrw_preview = 1 "1: preview window shown in a vertically split window.
let g:netrw_browse_split = 4 "act like P when opening file by <cr>
let g:netrw_fastbrowse = 0
let g:netrw_list_hide='.*\.swp$'
"let g:netrw_altv = 0 "0: open at left 1: open at right (with 'v')
"let g:netrw_alto = 1 "0: open at top; 1: open at bottom (with 'o')" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
