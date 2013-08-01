set nocompatible
filetype plugin indent off

"------------------------------------
" NeoBundle
"------------------------------------
if has('vim_starting')
	set runtimepath+=~/.vim/.bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/.bundle/'))

NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/vimproc.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/Sixeight/unite-grep.git'
NeoBundle 'git://github.com/tpope/vim-surround.git'
NeoBundle 'git://github.com/tpope/vim-repeat.git'
NeoBundle 'git://github.com/ujihisa/unite-colorscheme.git'
NeoBundle 'git://github.com/ujihisa/vimshell-ssh.git'
NeoBundle 'git://github.com/altercation/vim-colors-solarized.git'
NeoBundle 'git://github.com/kana/vim-smartchr.git'
NeoBundle 'git://github.com/mattn/zencoding-vim.git'
NeoBundle 'git://github.com/mattn/gist-vim.git'
NeoBundle 'git://github.com/mattn/webapi-vim.git'
NeoBundle 'git://github.com/Lokaltog/vim-easymotion.git'
NeoBundle 'git://github.com/othree/eregex.vim.git'
NeoBundle 'git://gist.github.com/411828.git', {'directory': 'endtagcomment'}
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'LeafCage/foldCC'
NeoBundle 'vim-scripts/CSS-one-line--multi-line-folding'
NeoBundle 'YankRing.vim'
NeoBundle 'python_fold'
NeoBundle 'css3'
NeoBundle 'wavded/vim-stylus'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'tpope/vim-haml'
NeoBundle 'vim-scripts/loremipsum'
NeoBundle 'matchit.zip'
NeoBundle 'vim-scripts/phpfolding.vim'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tomasr/molokai'
NeoBundle 'kana/vim-fakeclip'
"------------------------------------

filetype plugin indent on

"------------------------------------
" release autogroup in MyAutoCmd
"------------------------------------
augroup MyAutoCmd
  autocmd!
augroup END

"------------------------------------
" Options
"------------------------------------
set encoding=utf-8
set fileformats=unix,dos,mac
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
syntax on
set ambiwidth=double
set autoindent
set autoread
set backspace=indent,eol,start
set clipboard=unnamed
set clipboard+=autoselect
set cmdheight=1
set display=lastline
set grepprg=internal
set hlsearch
set hidden
set history=100
set incsearch
set infercase
set laststatus=3
set matchtime=3
set nobackup
set noerrorbells
set expandtab
set ignorecase
set smartcase
set noswapfile
set novisualbell
set nowritebackup
set nrformats-=octal
set number
set ruler
set shiftwidth=4
set shortmess+=I
set showcmd
set showmatch
set softtabstop=4
set tabstop=4
set textwidth=0
set title
set whichwrap=b,s,[,],<,>
set wildmenu
set wrap
set wrapscan
nmap n nzz
nmap N Nzz
nnoremap ZZ <Nop>
nnoremap <CR> o<ESC>
nnoremap h <Left>
nnoremap j gj
nnoremap k gk
nnoremap l <Right>
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>

colorscheme delek

set fillchars=vert:\|
hi Folded gui=bold term=standout ctermbg=LightGrey ctermfg=DarkBlue guibg=Grey30 guifg=Grey80
hi FoldColumn gui=bold term=standout ctermbg=LightGrey ctermfg=DarkBlue guibg=Grey guifg=DarkBlue

"------------------------------------
" Useful Keymap
"------------------------------------
inoremap <silent> jj <ESC>
inoremap <silent> <C-a> <ESC>

cmap w!! w !sudo tee > /dev/null %

vnoremap v $h

nnoremap <Tab> %
vnoremap <Tab> %

nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

autocmd InsertLeave * set nopaste

"inoremap {} {}<LEFT>
"inoremap [] []<LEFT>
"inoremap () ()<LEFT>
"inoremap "" ""<LEFT>
"inoremap '' ''<LEFT>
"inoremap <> <><LEFT>


"------------------------------------
" Save Cursor Position
"------------------------------------
autocmd BufWinLeave ?* silent mkview
autocmd BufWinEnter ?* silent loadview

"------------------------------------
" Count Up
"------------------------------------
nnoremap <silent> co :ContinuousNumber <C-a><CR>
vnoremap <silent> co :ContinuousNumber <C-a><CR>
command! -count -nargs=1 ContinuousNumber let c = col('.')|for n in range(1, <count>?<count>-line('.'):1)|exec 'normal! j' . n . <q-args>|call cursor('.', c)|endfor
nmap ,y :YRShow<CR>

"------------------------------------
" Fold
"------------------------------------
set foldmethod=syntax
set foldlevel=100
set foldtext=FoldCCtext()

noremap [space] <nop>
nmap <Space> [space]

noremap [space]j zj
noremap [space]k zk
noremap [space]n ]z
noremap [space]p [z
noremap [space]h zc
noremap [space]l zo
noremap [space]L zO
noremap [space]a za
noremap [space]m zM
noremap [space]i zMzv
noremap [space]r zR
noremap [space]f zf
noremap [space]g :echo FoldCCnavi()<CR>

"------------------------------------
" Stylus
"------------------------------------
autocmd BufWritePost,FileWritePost *.styl silent !stylus <afile> -u /usr/local/lib/node_modules/nib/ >/dev/null

autocmd BufRead,BufNewFile *.styl set filetype=sass

"------------------------------------
" Easy motion
"------------------------------------
let g:EasyMotion_leader_key = 'f'
let g:EasyMotion_keys='hjklasdgyuiopqwertnmzxcvbHJKLYUIOPNMASDFG1234567890;:f'

"------------------------------------
" VimFiler
"------------------------------------
let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0

"------------------------------------
" sass
"------------------------------------
function! Sass_convert()
    let scss = expand('%:p')
    let css  = substitute(scss, 'scss$', 'css', '')
    "let cmd  = printf('sass --compass -I /usr/local/lib/ruby/gems/1.9.1/gems/compass-0.12.2/frameworks/compass/stylesheets/compass %s %s', scss, css)
    let cmd  = printf('sass --compass -I /usr/local/lib/ruby/gems/1.9.1/gems/compass-0.12.2/frameworks/compass/stylesheets/compass %s %s', scss, css)
    let res  = system(cmd)
    if res != ''
        echo res
    endif
endfunction

au! BufWritePost *.scss call Sass_convert() 

"------------------------------------
" Tab
"------------------------------------
nnoremap t; t
nnoremap t <Nop>
nnoremap tl gt
nnoremap th gT
nnoremap to :<C-u>edit<Space>
nnoremap tt :<C-u>tabnew<Space>
nnoremap <silent> td :<C-u>tabclose<CR>

" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> t'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
"------------------------------------

