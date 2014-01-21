set ambiwidth=double

set showtabline=2
" set imdisable
" Hide toolbar and menus.
" Scrollbar is always off.
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=t
set guioptions-=b
" Not guitablabel.
set guioptions-=e
" Confirm without window.
set guioptions+=c

set guioptions+=M
set guioptions-=a
set guioptions-=g

" Don't flick cursor.
set guicursor&
set guicursor+=a:blinkon0

set winaltkeys=no


set antialias
set tabstop=4
set visualbell t_vb=
" set cursorline
" set columns=80
" set lines=35
" フォント設定
" For Ubuntu
if has('mac')
    set guifontwide=Ricty-Regular:h18
    set guifont=Ricty-Regular:h18
else
    set guifontwide=Ricty-Regular\ 12
    set guifont=Ricty\ 12
endif
