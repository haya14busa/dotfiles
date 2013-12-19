" haya14busa's vimrc
" Author: haya14busa
" URL: http://haya14busa.com
" Source: https://github.com/haya14busa/dotfiles/
" Last Modified: 19 Dec 2013.
"
"=============================================================
"     __                     _____ __  __
"    / /_  ____ ___  ______ <  / // / / /_  __  ___________ _
"   / __ \/ __ `/ / / / __ `/ / // /_/ __ \/ / / / ___/ __ `/
"  / / / / /_/ / /_/ / /_/ / /__  __/ /_/ / /_/ (__  ) /_/ /
" /_/ /_/\__,_/\__, /\__,_/_/  /_/ /_.___/\__,_/____/\__,_/
"             /____/
"
"=============================================================

" NeoBundle {{{====================

filetype plugin indent off

if has('vim_starting')
    set nocompatible
    set runtimepath& runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" NeoBundle Function {{{

" MyNeoBundle {{{
command! -nargs=1
\   MyNeoBundle
\   NeoBundle <args>, {
\       "base" : "~/.vim/myplugin/",
\       "type" : "nosync",
\   }
"}}}

"}}}

NeoBundle 'Shougo/vimproc'
NeoBundleLazy 'Shougo/unite.vim'
" NeoBundle Unite plugins {{{
NeoBundleLazy 'Shougo/unite-ssh'
NeoBundleLazy 'tsukkee/unite-help'
NeoBundleLazy 'ujihisa/unite-colorscheme'
NeoBundleLazy 'mattn/unite-advent_calendar'
NeoBundleLazy 'Shougo/unite-outline'
NeoBundleLazy 'osyo-manga/unite-fold'
NeoBundleLazy 'kmnk/vim-unite-giti'
NeoBundleLazy 'thinca/vim-unite-history'
NeoBundleLazy 'osyo-manga/unite-quickfix'
"}}}
NeoBundleLazy 'Shougo/vimfiler'
NeoBundleLazy 'Shougo/vimshell'
NeoBundleLazy 'ujihisa/vimshell-ssh'
NeoBundleLazy 'Shougo/neosnippet.vim'
" Shougo/neocomplete {{{
if has('lua') && v:version >= 703
    NeoBundleLazy 'Shougo/neocomplete.vim'
else
    NeoBundleLazy 'Shougo/neocomplcache.vim'
endif
"}}}

NeoBundleLazy 'thinca/vim-quickrun'
NeoBundleLazy 'thinca/vim-scouter'
NeoBundleLazy 'thinca/vim-visualstar'
"NeoBundle 'thinca/vim-template'
" thinca/vim-ref {{{
NeoBundleLazy 'thinca/vim-ref'
NeoBundle 'mojako/ref-sources.vim'
NeoBundle 'tokuhirom/jsref'
NeoBundle 'mustardamus/jqapi'
NeoBundle 'soh335/vim-ref-jquery'
"}}}

NeoBundle 'tpope/vim-repeat'
NeoBundleLazy 'tpope/vim-commentary' "gc{motion} , \\{motion}, \\\
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-markdown'
" NeoBundle Git {{{
NeoBundle 'tpope/vim-fugitive'
NeoBundleLazy 'gregsexton/gitv'
"NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'mhinz/vim-signify'
"}}}

NeoBundleLazy 'kana/vim-smartinput'
"NeoBundleLazy 'kana/vim-smartchr'
"NeoBundle 'kana/vim-fakeclip'

NeoBundleLazy 'mattn/emmet-vim'
NeoBundleLazy 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'

"NeoBundle 'Lokaltog/vim-easymotion'
NeoBundleLazy 'haya14busa/vim-easymotion', 'lazymotion'
"MyNeoBundle 'vim-easymotion'

NeoBundleLazy 'vim-scripts/DrawIt'

" Neobundle Text Object {{{
NeoBundleLazy 'kana/vim-textobj-user'
NeoBundleLazy 'kana/vim-textobj-entire'           " ae, ie
NeoBundleLazy 'kana/vim-textobj-fold'             " az, iz
NeoBundleLazy 'kana/vim-textobj-indent'           " ai, ii
NeoBundleLazy 'kana/vim-textobj-line'             " al, il
NeoBundleLazy 'kana/vim-textobj-syntax'           " ay, iy
NeoBundleLazy 'kana/vim-textobj-django-template'  " adb, idb
NeoBundleLazy 'thinca/vim-textobj-between'        " af{char}, if{char}
NeoBundleLazy 'mattn/vim-textobj-url'             " au, iu
NeoBundleLazy 'osyo-manga/vim-textobj-multiblock' " ab, ib
NeoBundleLazy 'lucapette/vim-textobj-underscore'  " a_, i_
NeoBundleLazy 'h1mesuke/textobj-wiw'              " a,w a,e

" to surround vim objects with a pair of identical chars
NeoBundle 'tpope/vim-surround'

" Operator
NeoBundle 'kana/vim-operator-user'
NeoBundleLazy 'kana/vim-operator-replace'
"NeoBundle 'rhysd/vim-operator-surround'

"}}}

" Extend Basic Vim Commands
NeoBundle 'matchit.zip'
NeoBundleLazy 'rhysd/clever-f.vim'
NeoBundleLazy 'rhysd/accelerated-jk'
NeoBundleLazy 'deris/columnjump'
NeoBundleLazy 'osyo-manga/vim-anzu'
NeoBundle 'LeafCage/foldCC'
NeoBundleLazy 'LeafCage/yankround.vim'
"NeoBundle 'vim-scripts/Align'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundleLazy 'nathanaelkane/vim-indent-guides'
NeoBundleLazy 'davidhalter/jedi-vim'
NeoBundleLazy 'sjl/gundo.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundleLazy 'autodate.vim'

" NeoBundle Web
NeoBundleLazy 'tyru/open-browser.vim'
NeoBundleLazy 'vim-scripts/loremipsum'

" NeoBundle Lisp & Scheme
" NeoBundleLazy 'amdt/vim-niji'
NeoBundleLazy 'aharisu/vim_goshrepl'
NeoBundleLazy 'kien/rainbow_parentheses.vim'

NeoBundleLazy 'osyo-manga/vim-over' " :substitute preview
NeoBundleLazy 'Shougo/junkfile.vim' " Create temporary file for memo, testing, ...

" Neobundle Syntax {{{
NeoBundle 'scrooloose/syntastic'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'wavded/vim-stylus'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'kchmck/vim-coffee-script'
" NeoBundle for expr {{{
NeoBundleLazy 'python_fold', {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"],
      \ }}
NeoBundleLazy 'vim-scripts/CSS-one-line--multi-line-folding', {
      \ "autoload": {
      \   "filetypes": ["css"],
      \ }}
NeoBundleLazy 'vim-scripts/phpfolding.vim', {
      \ "autoload": {
      \   "filetypes": ["php"],
      \ }}
"}}}

"}}}

" NeoBundle Japanese {{{
"MyNeoBundle 'vim-migemo'
NeoBundleLazy 'haya14busa/vim-migemo'
NeoBundle 'vim-jp/vimdoc-ja' " A project which translate Vim documents into Japanese.
"NeoBundle 'tyru/eskk.vim'
"}}}

" ColorScheme {{{
NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'vim-scripts/rdark'
NeoBundle 'djjcast/mirodark'
NeoBundle 'sjl/badwolf'
"}}}

" Others {{{
NeoBundleLazy 'pentie/VimRepress' "WordPress
NeoBundleLazy 'tsukkee/lingr-vim' "Lingr
NeoBundle 'mattn/learn-vimscript'
NeoBundleLazy 'thinca/vim-prettyprint'
NeoBundleLazy 'basyura/TweetVim' " twitter client for vim
NeoBundleLazy 'basyura/twibill.vim' " twitter api wrapper like a Rubytter.rb ... maybe
NeoBundle 'bohrshaw/vim-vimperator-syntax'
NeoBundleLazy 'supermomonga/thingspast.vim'
MyNeoBundle 'vim-helloworld'
NeoBundleLazy 'vim-jp/vital.vim' " A comprehensive Vim utility functions for Vim plugins
NeoBundleLazy 't9md/vim-smalls'
" Splash {{{
NeoBundle 'thinca/vim-splash'
NeoBundle 'https://gist.github.com/OrgaChem/7649755' " vim_intro.txt
NeoBundle 'https://gist.github.com/OrgaChem/7679840' " vimorg
"let g:splash#path = '/home/haya14busa/.vim/bundle/7649755/all_your_vim_are_belong_to_us.txt'
"let g:splash#path = '/home/haya14busa/.vim/bundle/7679840/vim_org.txt'
let g:splash#path = expand('~/.vim/bundle/7679840/vim_org.txt')
"}}}

"}}}

filetype plugin indent on
" END Neobundle}}}

" Vim Setup  {{{====================

" Basic Options {{{
set encoding=utf-8
set fileformats=unix,dos,mac
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set ambiwidth=double
set autoread
set backspace=indent,eol,start
if has('unnamedplus')
  set clipboard& clipboard=unnamedplus
else
  set clipboard& clipboard+=unnamed,autoselect
endif
set cmdheight=1
set display=lastline
set grepprg=internal
set hidden
set infercase
set laststatus=2
set matchtime=3
set modeline
set noerrorbells
set novisualbell
set nrformats-=octal
set ruler
set shortmess&
set shortmess+=I
set showcmd
set showmatch
set textwidth=0
set title
set viminfo+=!
set virtualedit=block
set whichwrap=b,s,h,l,[,],<,>
set wrap
set wrapscan

" Colorscheme {{{
syntax enable
set background=dark
set t_Co=256
try
  colorscheme wombat
catch
  colorscheme desert
endtry
"}}}

" Tab Basic Settings {{{
set autoindent
set expandtab
set shiftround
set shiftwidth=4
set softtabstop=4
set tabstop=4
"}}}

" Turn off Automatically comment out when line break {{{
set formatoptions-=r
set formatoptions-=o
"}}}

" Search Basic Settings {{{
set incsearch
set ignorecase
set smartcase
set hlsearch
"}}}

" Line Basic Settings {{{
set number
"set cursorline
"}}}

" Backup Settings {{{
" Don't create backup
set nobackup
set nowritebackup
set backupdir-=.
"}}}

" Swap Settings {{{
set swapfile
set directory-=.
"}}}

" Undo Basic {{{
if v:version >= 703
  " Set undofile.
  set undofile
  set undoreload=1000
  let &undodir=&directory
endif
"}}}

" Wildmenu {{{

set wildmenu                        " Command line autocompletion
set wildmode=list:longest,full      " Shows all the options

set wildignore&
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.bak,*.?~,*.??~,*.???~,*.~      " Backup files
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.jar                            " Java archives
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.stats                          " Pylint stats

" }}}

" Fold Basic Settings "{{{
set foldenable
set foldmethod=marker
set foldlevel=100
"}}}

" Open Vim help by K {{{
set keywordprg=:help
"}}}

" command-line window {{{
set cmdwinheight=3
"}}}

"}}}

" release autogroup in MyVimrc {{{
augroup MyVimrc
  autocmd!
augroup END
"}}}

" Open & AutoReload .vimrc {{{
command! EVimrc e $MYVIMRC
command! ETabVimrc tabnew $MYVIMRC

autocmd MyVimrc BufWritePost *vimrc source $MYVIMRC | setlocal foldmethod=marker
autocmd MyVimrc BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
" Reload syntax after source $MYVIMRC
" -> <C-l>
" nnoremap <Leader><Leader>s :<C-u>syntax enable<CR>
"}}}

" Useful Keymaps{{{

" Escape Keymaps {{{
inoremap <silent> jj <ESC>
"inoremap <silent> kk <ESC>
vnoremap <silent> <C-j> <ESC>
inoremap <silent> <C-c> <ESC>
"}}}

" Breakline with Enter {{{
nnoremap <CR> o<ESC>

"nnoremap <C-j> O<ESC>j
"nnoremap <C-k> k"_dd

"}}}

" For Undo Revision, Break Undo Sequence "{{{
" -> vim-smartinput
" inoremap <CR> <C-]><C-G>u<CR>
"
inoremap <C-h> <C-g>u<C-h>
inoremap <BS> <C-g>u<BS>
inoremap <Del> <C-g>u<Del>
inoremap <C-d> <C-g>u<Del>
inoremap <C-w> <C-g>u<C-w>
inoremap <C-u> <C-g>u<C-u>

"}}}

" Motion {{{
nnoremap h <Left>

nnoremap j gj
vnoremap j gj
nnoremap gj j
vnoremap gj j

nnoremap k gk
vnoremap k gk
nnoremap gk k
vnoremap gk k

nnoremap l <Right>

nnoremap - $

nnoremap <Space>j <C-f>zz
nnoremap <Space>k <C-b>zz
vnoremap <Space>j <C-f>zz
vnoremap <Space>k <C-b>zz

nnoremap <Space><Space> <C-f>zz

" Insert & Comandline Mode "{{{
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>

cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Word Motion in Insert Mode
inoremap <M-w> <S-Right>
inoremap <M-b> <S-Left>
"}}}

"}}}

" Paste in insert  and Ex mode"{{{
inoremap <C-y> <C-r>+
" TODO: i_C-y is conflicted with emmet
inoremap <C-y><C-y> <C-r>+

cnoremap <C-y> <C-r>+
"}}}

" Window {{{
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

nnoremap <S-Right> :<C-u>vertical resize +2<CR>
nnoremap <S-Left> :<C-u>vertical resize -2<CR>
nnoremap <S-Up> :<C-u>resize +1<CR>
nnoremap <S-Down> :<C-u>resize -1<CR>
"}}}

" Command line History {{{
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
"}}}

" Save as root"{{{
cmap w!! w !sudo tee > /dev/null %
"}}}

" From the cursor to the end of line {{{
" Select from cursor position to end of line
vnoremap v $h
" Yank from cursor position to end of line
nnoremap Y y$
"}}}

" Scroll {{{
nnoremap <C-e> <C-e>j
nnoremap <C-y> <C-y>k
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
"}}}

" Spelling Keymaps {{{
set spelllang+=cjk
" turn on the spell checking and set the English language
nnoremap <Leader>se :set spell spelllang=en,cjk<CR>
" turn off the spell checking
nnoremap <Leader>so :set nospell <CR>
" jump to the next bad spell word
nnoremap <Leader>sn ]s
" suggest words
nnoremap <Leader>sp z=
" jump to the next bad spell word and suggests a correct one
nnoremap <Leader>sc ]sz=
" add word to the dictionary
nnoremap <Leader>sa zg

" }}}

" Vertical Paste"{{{
vnoremap <C-p> I<C-r>"<ESC><ESC>
"}}}

" Get info"{{{
" get the total of lines, words, chars and bytes (and for the current position)
nnoremap <Leader>gi g<C-G>
"}}}

" Relative Number "{{{
nnoremap <Leader><Leader>r :<C-u>set relativenumber!<CR>
"}}}

" Repeat on every line {{{
" repeat last command for each line of a visual selection
vnoremap . :normal .<CR>
" replay @q macro for each line of a visual selection
vnoremap @q :normal @q<CR>
"}}}

" Search {{{
" always 'very magic'
nnoremap / /\v
" search within visual block
vnoremap / <esc>/\v%V

nnoremap & :&&<CR>
xnoremap & :&&<CR>
"}}}

" select last inserted text
nnoremap gV `[v`]


" Don't use register by x
nnoremap x "_x

" Keymap candidate
" n
" ---
" K
" U
" S
" X
" <C-e>
" <C-y>

"}}}


" set nopaste when Insertleave"{{{
autocmd MyVimrc InsertLeave * set nopaste
"}}}

" Show invisibles {{{

" Shortcut to rapidly toggle `set list`
nnoremap <silent> <Leader>l :<C-u>set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"Invisible character colors
hi NonText guifg=#4a4a59
hi SpecialKey guifg=#4a4a59

" Highlight End-of-Line Whitespace {{{
autocmd MyVimrc VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
autocmd MyVimrc VimEnter,WinEnter * match TrailingSpaces /\s\+$/
"}}}

"}}}

" Save Cursor Position and Fold {{{
autocmd MyVimrc BufWinLeave *.* silent mkview!
autocmd MyVimrc BufWinEnter *.* silent loadview

"}}}

" Count Up Function {{{
nnoremap <silent> co :ContinuousNumber <C-a><CR>
vnoremap <silent> co :ContinuousNumber <C-a><CR>
command! -count -nargs=1 ContinuousNumber let c = col('.')|for n in range(1, <count>?<count>-line('.'):1)|exec 'normal! j' . n . <q-args>|call cursor('.', c)|endfor
"}}}

" Add Endtagcomment function {{{

" Description"{{{
" Before
" <div id="hoge" class="fuga">
" ...
" </div>
"
" After
" <div id="hoge" class="fuga">
" ...
" <!-- /div#hoge.fuga --></div>
"}}}

function! Endtagcomment()"{{{
    let reg_save = @@

    try
        silent normal vaty
    catch
        execute "normal \<Esc>"
        echohl ErrorMsg
        echo 'no match html tags'
        echohl None
        return
    endtry

    let html = @@

    let start_tag = matchstr(html, '\v(\<.{-}\>)')
    let tag_name  = matchstr(start_tag, '\v([a-zA-Z]+)')

    let id = ''
    let id_match = matchlist(start_tag, '\vid\=["'']([^"'']+)["'']')
    if exists('id_match[1]')
        let id = '#' . id_match[1]
    endif

    let class = ''
    let class_match = matchlist(start_tag, '\vclass\=["'']([^"'']+)["'']')
    if exists('class_match[1]')
        let class = '.' . join(split(class_match[1], '\v\s+'), '.')
    endif

    execute "normal `>va<\<Esc>`<"

    let comment = g:endtagcommentFormat
    let comment = substitute(comment, '{%tag_name}', tag_name, 'g')
    let comment = substitute(comment, '{%id}', id, 'g')
    let comment = substitute(comment, '{%class}', class, 'g')
    let @@ = comment

    normal ""P

    let @@ = reg_save
endfunction"}}}

let g:endtagcommentFormat = '<!-- /{%tag_name}{%id}{%class} -->'
nnoremap ,t :<C-u>call Endtagcomment()<CR>

"}}}

" Fold {{{

" Leafcage/foldCC Settings {{{
set foldtext=foldCC#foldtext()
"}}}

" Color setting for Fold {{{
set fillchars=vert:\|

"hi Folded gui=bold term=standout ctermbg=darkgrey ctermfg=DarkBlue guibg=Grey30 guifg=Grey80
"hi FoldColumn gui=bold term=standout ctermbg=darkgrey ctermfg=DarkBlue guibg=Grey guifg=DarkBlue

"}}}

" Change Keymap for Fold {{{
noremap [fold] <nop>
nmap <Space> [fold]

noremap [fold]j zj
noremap [fold]k zk
noremap [fold]n ]z
noremap [fold]p [z
"noremap [fold]h zc
noremap <silent>[fold]h :<C-u>call <SID>smart_foldcloser()<CR>
noremap [fold]l zo
noremap [fold]L zO
noremap [fold]a za
noremap [fold]m zM
noremap [fold]i zMzvzz
noremap [fold]r zR
noremap [fold]f zf
noremap [fold]g :<C-u>echo FoldCCnavi()<CR>
noremap [fold]d zd

nnoremap <expr>l  foldclosed('.') != -1 ? 'zo' : 'l'

nnoremap  [fold][     :<C-u>call <SID>put_foldmarker(0)<CR>
nnoremap  [fold]]     :<C-u>call <SID>put_foldmarker(1)<CR>
"}}}

" smart_foldcloser {{{
function! s:smart_foldcloser()
  if foldlevel('.') == 0
    norm! zM
    return
  endif

  let foldc_lnum = foldclosed('.')
  norm! zc
  if foldc_lnum == -1
    return
  endif

  if foldclosed('.') != foldc_lnum
    return
  endif
  norm! zM
endfunction
"}}}

" put foldmarker {{{
function! s:put_foldmarker(foldclose_p)
  let crrstr = getline('.')
  let padding = crrstr=='' ? '' : crrstr=~'\s$' ? '' : ' '
  let [cms_start, cms_end] = ['', '']
  let outside_a_comment_p = synIDattr(synID(line('.'), col('$')-1, 1), 'name') !~? 'comment'
  if outside_a_comment_p
    let cms_start = matchstr(&cms,'\V\s\*\zs\.\+\ze%s')
    let cms_end = matchstr(&cms,'\V%s\zs\.\+')
  endif
  let fmr = split(&fmr, ',')[a:foldclose_p]. (v:count ? v:count : '')
  exe 'norm! A'. padding. cms_start. fmr. cms_end
endfunction
"}}}

"}}}

" Tab {{{

" Tab KeyMaps {{{
nnoremap t; t
nmap t <nop>
"nnoremap [tab] <nop>
"nnoremap t [tab]
nnoremap tl gt
nnoremap th gT
nnoremap to :<C-u>edit<Space>
nnoremap tt :<C-u>tabnew<Space>
nnoremap <silent> td :<C-u>tabclose<CR>

nnoremap <silent> t] :<C-u>buffer<CR>
nnoremap <silent> tn :<C-u>bnext<CR>
nnoremap <silent> tp :<C-u>bprevious<CR>
nnoremap <silent> tD :<C-u>bdelete<CR>
nnoremap <silent> tL :<C-u>buffers<CR>
"}}}

" Tab jump {{{
for n in range(1, 9)
  execute 'nnoremap <silent> t'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
"}}}

" MoveToNewTab {{{
nnoremap <silent> tm :<C-u>call MoveToNewTab()<CR>

function! MoveToNewTab()
    tab split
    tabprevious

    if winnr('$') > 1
        close
    elseif bufnr('$') > 1
        buffer #
    endif

    tabnext
endfunction
"}}}

" Tab Help {{{
command! -nargs=? Ht  tab help <args>
command! -nargs=? Hv  vertical belowright help <args>
nnoremap <Space>t :<C-u>tab help<Space>
nnoremap <Space>v :<C-u>vertical belowright help<Space>
"}}}

" TabLine {{{
set tabline=%!MakeTabLine()

function! MakeTabLine()
    let s = ''

    for n in range(1, tabpagenr('$'))
        if n == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif

        let s .= '%' . n . 'T'

        let s .= ' %{MakeTabLabel(' . n . ')} '

        let s .= '%#TabLineFill#%T'
        let s .= '|'
    endfor

    let s .= '%#TabLineFill#%T'
    let s .= '%=%#TabLine#'
    let s .= '%{fnamemodify(getcwd(), ":~:h")}%<'
    return s
endfunction

function! MakeTabLabel(n)
    let bufnrs = tabpagebuflist(a:n)
    let bufnr = bufnrs[tabpagewinnr(a:n) - 1]

    let bufname = bufname(bufnr)
    if bufname == ''
        let bufname = '[No Name]'
    else
        let bufname = fnamemodify(bufname, ":t")
    endif

    let no = len(bufnrs)
    if no == 1
        let no = ''
    endif

    let mod = len(filter(bufnrs, 'getbufvar(v:val, "&modified")')) ? '+' : ''
    let sp = (no . mod) == '' ? '' : ' '

    let s = no . mod . sp . bufname
    return s
endfunction"}}}

"}}}

" Create Directory Automatically {{{
autocmd MyVimrc BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)  " {{{
    if !isdirectory(a:dir) && (a:force ||
    \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction  " }}}
"}}}

" Git Setting {{{
" for git mergetool
if &diff
  noremap <Leader>1 :diffget LOCAL<CR>
  noremap <Leader>2 :diffget BASE<CR>
  noremap <Leader>3 :diffget REMOTE<CR>
  noremap <Leader>u :<C-u>diffupdate<CR>
  noremap u u:<C-u>diffupdate<CR>
endif

" Spell check in git commit
autocmd MyVimrc FileType gitcommit setlocal nofoldenable spell
" Enter Insert mode in git commit
autocmd MyVimrc VimEnter COMMIT_EDITMSG if getline(1) == '' | execute 1 | startinsert | endif

" git blame {{{
function! s:git_blame(fname, ...)
    execute 'lcd' fnamemodify(a:fname, ':p:h')
    let range = (a:0==0 ? line('.') : a:1.','.a:2)
    let errfmt = &errorformat
    set errorformat=.*
    cgetexpr system('git blame -L '.range.' '.fnamemodify(a:fname, ':p'))
    let &errorformat = errfmt
    Unite quickfix -no-start-insert
endfunction
command! -nargs=0 GitBlameThisLine call <SID>git_blame(expand('%'))
command! -range GitBlameRange call <SID>git_blame(expand('%'), <line1>, <line2>)
nnoremap <silent><Leader>gb :<C-u>GitBlameThisLine<CR>
vnoremap <silent><Leader>gb :GitBlameRange<CR>
"}}}

"}}}

" Filetypes "{{{====================

" Stylus {{{
autocmd MyVimrc BufRead,BufNewFile,BufReadPre *.styl setlocal filetype=sass
autocmd MyVimrc FileType sass     setlocal sw=2 sts=2 ts=2 et
autocmd MyVimrc BufWritePost,FileWritePost *.styl silent !stylus <afile> -u nib >/dev/null
"}}}

" CoffeeScript {{{
autocmd MyVimrc BufRead,BufNewFile,BufReadPre *.coffee   setlocal filetype=coffee
autocmd MyVimrc FileType coffee     setlocal sw=2 sts=2 ts=2 et
autocmd MyVimrc BufWritePost,FileWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!
"}}}

" Sass {{{
function! Sass_convert()
    let scss = expand('%:p')
    let css  = substitute(scss, 'scss$', 'css', '')
    let cmd  = printf('sass --compass -i /usr/local/lib/ruby/gems/1.9.1/gems/compass-0.12.2/frameworks/compass/stylesheets/compass %s %s', scss, css)
    let res  = system(cmd)
    if res != ''
        echo res
    endif
endfunction

autocmd MyVimrc BufWritePost *.scss call Sass_convert()
"}}}


"}}}

" end vim setup}}}

" Plugin settings {{{==============

" Sample
" if neobundle#tap('sample') " {{{
"   call neobundle#config({
"         \   'autoload' : {
"         \     'unite_sources' : [
"         \       'help',
"         \     ],
"         \   }
"         \ })
"
"   function! neobundle#tapped.hooks.on_source(bundle)
"   endfunction
"
"   call neobundle#untap()
" endif " }}}

" shougo/vimproc"{{{
if neobundle#tap('vimproc') "{{{
  call neobundle#config({
       \ 'build' : {
       \     'windows' : 'make -f make_mingw32.mak',
       \     'cygwin'  : 'make -f make_cygwin.mak',
       \     'mac'     : 'make -f make_mac.mak',
       \     'unix'    : 'make -f make_unix.mak',
       \    },
       \ })
  call neobundle#untap()
endif "}}}
"}}}

" Shougo/unite.vim"{{{
if neobundle#tap('unite.vim') "{{{
  " Config"{{{
  call neobundle#config({
        \   'depends': ['Shougo/vimproc'],
        \   'autoload' : {
        \     'commands' : [
        \       {
        \         'name' : 'Unite',
        \         'complete' : 'customlist,unite#complete_source'
        \       },
        \       'UniteWithCursorWord',
        \       'UniteWithInput'
        \     ]
        \   }
        \ })"}}}

  " Settings"{{{
  function! neobundle#tapped.hooks.on_source(bundle)
    let g:unite_kind_jump_list_after_jump_scroll=0
    let g:unite_enable_start_insert = 0
    let g:unite_source_rec_min_cache_files = 1000
    let g:unite_source_rec_max_cache_files = 5000
    let g:unite_source_file_mru_long_limit = 6000
    let g:unite_source_file_mru_limit = 300
    let g:unite_source_directory_mru_long_limit = 6000
    let g:unite_prompt = '❯ '
  endfunction"}}}

  " Unite {{{
  nnoremap [unite] <Nop>
  xnoremap [unite] <Nop>
  nmap ; [unite]
  xmap ; [unite]

  " Source
  nnoremap <silent> [unite]; :<C-u>Unite source -vertical -silent -start-insert<CR>

  " Buffer
  nnoremap <silent> [unite]b :<C-u>Unite -silent buffer file_mru bookmark<CR>
  " File List
  nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -silent -buffer-name=files file<CR>

  " Recent File
  "nnoremap <silent> [unite]m :<C-u>Unite -silent file_mru<CR>

  " Register List
  " nnoremap <silent> [unite]r :<C-u>Unite -silent -buffer-name=register register<CR>

  " Restore Unite
  nnoremap <silent> [unite]r         :<C-u>UniteResume<CR>

  " Yank History
  let g:unite_source_history_yank_enable = 1
  nnoremap <silent> [unite]y :<C-u>Unite -silent history/yank<CR>

  " Show Mapping List
  nnoremap <silent> [unite]ma :<C-u>Unite -silent mapping<CR>

  " Show Message
  nnoremap <silent> [unite]me :<C-u>Unite -silent output:message<CR>

  " Jump (mnemonic : <C-o> jump to Older cursor position)
  nnoremap <silent> [unite]<C-o> :<C-u>Unite -silent change jump<CR>

  " Grep
  nnoremap <silent> [unite]g :<C-u>Unite -silent -no-quit grep<CR>

  " Open plugin directory by t
  call unite#custom#alias('directory', 'tabopen', 'tabvimfiler')

  " Unite Plugin Settings
  "-Unite Plugin Settings--------------"{{{
  " Execute help.
  nnoremap [unite]h  :<C-u>Unite -silent -start-insert -buffer-name=help help<CR>
  " Execute help by cursor keyword.
  nnoremap <silent> [unite]gh  :<C-u>UniteWithCursorWord -silent help<CR>
  " Outeline
  nnoremap <silent> [unite]o :<C-u>Unite -silent outline -vertical -winwidth=40 -no-start-insert<CR>
  " Fold
  nnoremap <silent> [unite]<Space> :<C-u>Unite -silent fold -vertical -winwidth=40 -no-start-insert<CR>
  " Unite Beautiful Atack
  nnoremap [unite]C :<C-u>Unite -auto-preview colorscheme<CR>
  "}}}
  "}}}

  call neobundle#untap()
endif "}}}
"}}}

" unite-sources {{{
" tsukkee/unite-help {{{
if neobundle#tap('unite-help') " {{{
  call neobundle#config({
        \   'autoload' : {
        \     'unite_sources' : [
        \       'help'
        \     ],
        \   }
        \ })
  call neobundle#untap()
endif " }}}
"}}}
" ujihisa/unite-colorscheme {{{
if neobundle#tap('unite-colorscheme') " {{{
  call neobundle#config({
        \   'autoload' : {
        \     'unite_sources' : [
        \       'colorscheme'
        \     ],
        \   }
        \ })
  call neobundle#untap()
endif " }}}
"}}}
" mattn/unite-advent_calendar {{{
if neobundle#tap('unite-advent_calendar') " {{{
  call neobundle#config({
        \   'autoload' : {
        \     'unite_sources' : [
        \       'advent_calendar'
        \     ],
        \   }
        \ })
  call neobundle#untap()
endif " }}}
"}}}
" Shougo/unite-outline {{{
if neobundle#tap('unite-outline') " {{{
  call neobundle#config({
        \   'autoload' : {
        \     'unite_sources' : [
        \       'outline'
        \     ],
        \   }
        \ })
  call neobundle#untap()
endif " }}}
"}}}
" osyo-manga/unite-fold {{{
if neobundle#tap('unite-fold') " {{{
  call neobundle#config({
        \   'autoload' : {
        \     'unite_sources' : [
        \       'fold'
        \     ],
        \   }
        \ })
  call neobundle#untap()
endif " }}}
"}}}
" kmnk/vim-unite-giti {{{
if neobundle#tap('vim-unite-giti') " {{{
  call neobundle#config({
        \   'autoload' : {
        \     'unite_sources' : [
        \       'giti'
        \     ],
        \   }
        \ })
  call neobundle#untap()
endif " }}}
"}}}
" thinca/vim-unite-history {{{
if neobundle#tap('vim-unite-history') " {{{
  call neobundle#config({
        \   'autoload' : {
        \     'unite_sources' : [
        \       'history'
        \     ],
        \   }
        \ })
  call neobundle#untap()
endif " }}}
"}}}
" osyo-manga/unite-quickfix {{{
if neobundle#tap('unite-quickfix') " {{{
  call neobundle#config({
        \   'autoload' : {
        \     'unite_sources' : [
        \       'quickfix'
        \     ],
        \   }
        \ })
  call neobundle#untap()
endif " }}}
"}}}
" End unite-sources}}}

" Shougo/unite-ssh"{{{
if neobundle#tap('unite-ssh') "{{{
  call neobundle#config({
        \   'autoload' : {
        \     'filetypes' : 'vimshell',
        \   }
        \ })
  call neobundle#untap()
endif "}}}
"}}}

" Shougo/VimFiler {{{
if neobundle#tap('vimfiler') "{{{
  call neobundle#config({
        \   'autoload' : {
        \     'commands' : [
        \       'VimFiler',
        \       'VimFilerTab',
        \       'VimFilerBufferDir',
        \     ]
        \   }
        \ })
  function! neobundle#tapped.hooks.on_source(bundle)
  endfunction
  let g:vimfiler_as_default_explorer=1
  let g:vimfiler_safe_mode_by_default=0
  nnoremap <silent> ;vf :VimFilerBufferDir -split -simple -no-quit -winwidth=32<CR>
  nnoremap <silent> ;vt :VimFilerBufferDir -tab<CR>

  "autocmd FileType vimfiler nmap <buffer><silent><Tab> <Plug>(vimfiler_choose_action)
  call neobundle#untap()
endif "}}}
"}}}

" Shougo/vimshell {{{
if neobundle#tap('vimshell') "{{{
  call neobundle#config({
        \   'depends': ['Shougo/vimproc'],
        \   'autoload' : {
        \     'commands' : [
        \       'VimShell',
        \       'VimShellTab',
        \       'VimShellBufferDir',
        \     ]
        \   }
        \ })
  function! neobundle#tapped.hooks.on_source(bundle)
    "let g:vimshell_prompt_expr = 'getcwd()." > "'
    "let g:vimshell_prompt_pattern = '^\f\+ > '

    " Use current directory as vimshell prompt.
    let g:vimshell_prompt_expr =
              \ 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
    let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '
  endfunction

  call neobundle#untap()
endif "}}}
"}}}


" Shougo/neosnippet.vim"{{{
if neobundle#tap('neosnippet.vim') "{{{
  call neobundle#config({
        \   'depends' : ['honza/vim-snippets'],
        \   'autoload' : {
        \     'insert' : 1,
        \   }
        \ })

  function! neobundle#tapped.hooks.on_source(bundle)
    " Tell Neosnippet about the other snippets
    " let g:neosnippet#snippets_directory=s:bundle_root . '/vim-snippets/snippets'
  endfunction

  " Plugin key-mappings.
  "imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  "smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  "xmap <C-k>     <Plug>(neosnippet_expand_target)
  " SuperTab like snippets behavior.
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<TAB>"
  " For snippet_complete marker.
  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif
  " Enable snipMate compatibility feature.
  let g:neosnippet#enable_snipmate_compatibility = 1


  call neobundle#untap()
endif "}}}
"}}}

" Shougo/neocomplete.vim"{{{
if neobundle#tap('neocomplete.vim') "{{{
  call neobundle#config({
        \   'autoload' : {
        \     'insert' : 1,
        \   }
        \ })
  function! neobundle#tapped.hooks.on_source(bundle)
    let g:neocomplete#enable_at_startup = 1
    let s:hooks = neobundle#get_hooks("neocomplete.vim")
    let g:acp_enableAtStartup = 0
    let g:neocomplet#enable_smart_case = 1
    let g:neocomplete#enable_fuzzy_completion = 1
  endfunction
  call neobundle#untap()
endif "}}}
"}}}

" Shougo/neocomplcache.vim"{{{
if neobundle#tap('neocomplcache.vim') "{{{
  call neobundle#config({
        \   'autoload' : {
        \     'insert' : 1,
        \   }
        \ })
  let g:neocomplcache_enable_at_startup = 1
  let s:hooks = neobundle#get_hooks('neocomplcache.vim')
  function! s:hooks.on_source(bundle)
      let g:acp_enableAtStartup = 0
      let g:neocomplcache_enable_smart_case = 1
  endfunction
  call neobundle#untap()
endif "}}}
"}}}

" thinca/vim-quickrun {{{
if neobundle#tap('vim-quickrun') "{{{
  call neobundle#config({
        \   'autoload' : {
        \     'commands' : 'QuickRun',
        \     'mappings' : '[<Plug>(quickrun)]',
        \   }
        \ })
  function! neobundle#tapped.hooks.on_source(bundle)
    let g:quickrun_config = {
    \   "_" : {
    \       "runner" : "vimproc",
    \       "runner/vimproc/updatetime" : 60
    \   },
    \}
    let g:quickrun_config.markdown = {
    \ 'type': 'markdown/pandoc',
    \ 'cmdopt': '-s',
    \ 'outputter': 'browser'
    \ }
  endfunction
  nnoremap <Leader>q  <Nop>
  nnoremap <silent><Leader>qr :<C-u>QuickRun<CR>
  vnoremap <silent><Leader>qr :QuickRun<CR>
  call neobundle#untap()
endif "}}}
"}}}

" thinca/vim-scouter"{{{
if neobundle#tap('vim-scouter') "{{{
  call neobundle#config({
        \   'autoload' : {
        \     'commands' : 'Scouter',
        \   }
        \ })
  call neobundle#untap()
endif "}}}
"}}}

" thinca/vim-template {{{
if neobundle#tap('vim-template') "{{{
  autocmd MyVimrc User plugin-template-loaded call s:template_keywords()
  function! s:template_keywords()
      silent! %s/<+DATE+>/\=strftime('%Y-%m-%d')/g
      silent! %s/<+FILENAME+>/\=expand('%:r')/g
  endfunction

  autocmd MyVimrc User plugin-template-loaded
      \   if search('<+CURSOR+>')
      \ |   silent! execute 'normal! "_da>'
      \ | endif

  call neobundle#untap()
endif "}}}
"}}}

" thinca/vim-ref {{{
if neobundle#tap('vim-ref') "{{{
  call neobundle#config({
        \   'autoload' : {
        \     'commands' :
        \       [{'name': 'Ref',
        \         'complete': 'customlist,ref#complete'},
        \       'RefHistory']
        \   }
        \ })
  function! neobundle#tapped.hooks.on_source(bundle)
    let g:ref_jquery_doc_path = $HOME . '/.vim/.bundle/jqapi'
    let g:ref_javascript_doc_path = $HOME . '/.vim/.bundle/jsref/htdocs'
    let g:ref_wikipedia_lang = ['ja', 'en']
    let g:ref_use_cache = 1
    let g:ref_source_webdict_sites = {
    \   'je': {
    \     'url': 'http://eow.alc.co.jp/search?q=%s&ref=sa',
    \   },
    \   'ej': {
    \     'url': 'http://eow.alc.co.jp/search?q=%s&ref=sa',
    \   },
    \   'etm': {
    \     'url': 'http://home.alc.co.jp/db/owa/etm_sch?stg=1&instr=%s',
    \   },
    \   'wiki': {
    \     'url': 'http://ja.wikipedia.org/wiki/%s',
    \   },
    \ }
    let g:ref_alc_encoding = 'shift-jis'
  endfunction
  call neobundle#untap()
endif "}}}
"}}}

" gregsexton/gitv {{{
if neobundle#tap('gitv') "{{{
  call neobundle#config({
    \ 'autoload': {
    \   'commands' : ['Gitv']
    \   }
    \ })
  call neobundle#untap()
endif "}}}
"}}}

" tpope/vim-fugitive {{{
if neobundle#tap('vim-fugitive') "{{{
  "call neobundle#config({
  "  \ 'autoload': {
  "  \   'commands' : ['Gstatus', 'Gcommit', 'Gwrite', 'Gdiff', 'Gblame', 'Git', 'Ggrep']
  "  \   },
  "  \ })

  call neobundle#untap()
endif "}}}
"}}}

" mattn/emmet-vim"{{{
if neobundle#tap('emmet-vim') "{{{
  call neobundle#config({
        \   'autoload' : {
        \     'filetypes' : [
        \       'html',
        \       'xhttml',
        \       'css',
        \       'sass',
        \       'styl',
        \       'xml',
        \       'xls',
        \       'markdown'
        \     ]},
        \ })
  call neobundle#untap()
endif "}}}
"}}}

" mattn/gist-vim"{{{
if neobundle#tap('gist-vim') "{{{
  call neobundle#config({
        \   'autoload' : {
        \     'commands' : [
        \       'Gist',
        \     ]},
        \ })
  call neobundle#untap()
endif "}}}
"}}}

" vim-easymotion {{{
if neobundle#tap('vim-easymotion') "{{{
  call neobundle#config({
        \   'autoload' : {
        \     'mappings' : [['sxno', '<Plug>(easymotion-']],
        \   }
        \ })
  function! neobundle#tapped.hooks.on_source(bundle) "{{{
  endfunction "}}}

    " Do not mapping automatically
    let g:EasyMotion_keys='hklyuiopnm,qwertzxcvbasdgjf;'
    let g:EasyMotion_leader_key = ';'

    " EasyMotion Mapping {{{
    let g:EasyMotion_do_mapping = 0
    nmap s <Plug>(easymotion-s)
    vmap s <Plug>(easymotion-s)
    omap z <Plug>(easymotion-s)
    map ;j <Plug>(easymotion-j)
    map ;k <Plug>(easymotion-bd-jk)
    "map ;t <Plug>(easymotion-t)
    map ;w <Plug>(easymotion-bd-w)
    map ;e <Plug>(easymotion-bd-e)
    map ;n <Plug>(easymotion-bd-n)
    "}}}

    " EasyMotion Config {{{
    " smartcase
    let g:EasyMotion_smartcase = 1
    " keep cursor column
    let g:EasyMotion_startofline = 0
    " Don't skip folded line
    let g:EasyMotion_skipfoldedline = 0
    " pseudo-migemo
    let g:EasyMotion_use_migemo = 1
    "}}}

    " EasyMotion Special Function {{{
    omap L <Plug>(easymotion-special-l)
    omap P <Plug>(easymotion-special-p)
    xmap L <Plug>(easymotion-special-l)
    xmap P <Plug>(easymotion-special-p)
    nmap dP d<Plug>(easymotion-special-p)
    nmap yP y<Plug>(easymotion-special-p)
    nmap dL d<Plug>(easymotion-special-l)
    nmap yL y<Plug>(easymotion-special-l)
    "}}}

    " " EasyMotion User {{{
    " "map ;u :<C-u>call EasyMotion#User(substitute(@/,'\\v','','') . '\|easymotion',0,2)<CR>
    " " JK start of line, cursor colum, end of line
    " let s:re = '^\(\w\|\s*\zs\|$\)' . '\|' . '\(\%' . virtcol('.') . 'v\)' . '\|' . '$'
    " " exec "map  ;1 :<C-u>call EasyMotion#User('" . s:re . "',0,2)<CR>"
    " " exec "xmap  ;1 :<C-u>call EasyMotion#User('" . s:re . "',1,2)<CR>"
    " call EasyMotion#UserMapping(
    "   \   '^\(\w\|\s*\zs\|$\)' . '\|' . '\(\%' . virtcol('.') . 'v\)' . '\|' . '$'
    "   \ , ';1',2)
    " "unlet re
    " "}}}

    " Highlight"{{{
    " hi link EasyMotionTarget ErrorMsg
    " hi link EasyMotionShade  Comment
    " hi link EasyMotionTarget2First MatchParen
    " hi link EasyMotionTarget2Second MatchParen
    "}}}
  call neobundle#untap()
endif "}}}
"}}}

" TextObject Keymaps{{{

if neobundle#tap('vim-textobj-entire') " {{{
  call neobundle#config({
        \ 'depends' : 'kana/vim-textobj-user',
        \ 'autoload' : {
        \       'mappings' : [['xo', 'ae'], ['xo', 'ie']]
        \   }
        \ })

  function! neobundle#tapped.hooks.on_source(bundle)
  endfunction

 call neobundle#untap()
endif " }}}
if neobundle#tap('vim-textobj-fold') " {{{
  call neobundle#config({
        \ 'depends' : 'kana/vim-textobj-user',
        \ 'autoload' : {
        \       'mappings' : [['xo', 'az'], ['xo', 'iz']]
        \   }
        \ })

  function! neobundle#tapped.hooks.on_source(bundle)
  endfunction

 call neobundle#untap()
endif " }}}
if neobundle#tap('vim-textobj-indent') " {{{
  call neobundle#config({
        \ 'depends' : 'kana/vim-textobj-user',
        \ 'autoload' : {
        \       'mappings' : [['xo', 'ai'], ['xo', 'aI'], ['xo', 'ii'], ['xo', 'iI']]
        \   }
        \ })

  function! neobundle#tapped.hooks.on_source(bundle)
  endfunction

 call neobundle#untap()
endif " }}}
if neobundle#tap('vim-textobj-line') " {{{
  call neobundle#config({
        \ 'depends' : 'kana/vim-textobj-user',
        \ 'autoload' : {
        \       'mappings' : [['xo', 'al'], ['xo', 'il']]
        \   }
        \ })

  function! neobundle#tapped.hooks.on_source(bundle)
  endfunction

 call neobundle#untap()
endif " }}}
if neobundle#tap('vim-textobj-syntax') " {{{
  call neobundle#config({
        \ 'depends' : 'kana/vim-textobj-user',
        \ 'autoload' : {
        \       'mappings' : [['xo', 'ay'], ['xo', 'iy']]
        \   }
        \ })

  function! neobundle#tapped.hooks.on_source(bundle)
  endfunction

 call neobundle#untap()
endif " }}}
if neobundle#tap('vim-textobj-django-template') " {{{
  call neobundle#config({
        \ 'depends' : 'kana/vim-textobj-user',
        \ 'autoload' : {
        \       'mappings' : [['xo', 'adb'], ['xo', 'idb']]
        \   }
        \ })

  function! neobundle#tapped.hooks.on_source(bundle)
  endfunction

 call neobundle#untap()
endif " }}}
if neobundle#tap('vim-textobj-between') " {{{
  call neobundle#config({
        \ 'depends' : 'kana/vim-textobj-user',
        \ 'autoload' : {
        \       'mappings' : [['xo', 'af'], ['xo', 'if'], ['xo', '<Plug>(textobj-between-']]
        \   }
        \ })

  function! neobundle#tapped.hooks.on_source(bundle)
  endfunction

 call neobundle#untap()
endif " }}}
if neobundle#tap('vim-textobj-url') " {{{
  call neobundle#config({
        \ 'depends' : 'kana/vim-textobj-user',
        \ 'autoload' : {
        \       'mappings' : [['xo', 'au'], ['xo', 'iu']]
        \   }
        \ })

  function! neobundle#tapped.hooks.on_source(bundle)
  endfunction

 call neobundle#untap()
endif " }}}
if neobundle#tap('vim-textobj-multiblock') " {{{
  call neobundle#config({
        \ 'depends' : 'kana/vim-textobj-user',
        \ 'autoload' : {
        \       'mappings' : [['xo', 'ab'], ['xo', 'ib'], ['xo', '<Plug>(textobj-multiblock-']]
        \   }
        \ })
  omap ib <Plug>(textobj-multiblock-i)
  omap ab <Plug>(textobj-multiblock-a)
  vmap ib <Plug>(textobj-multiblock-i)
  vmap ab <Plug>(textobj-multiblock-a)
  function! neobundle#tapped.hooks.on_source(bundle)
  endfunction

 call neobundle#untap()
endif " }}}
if neobundle#tap('vim-textobj-underscore') " {{{
  call neobundle#config({
        \ 'depends' : 'kana/vim-textobj-user',
        \ 'autoload' : {
        \       'mappings' : [['xo', 'a_'], ['xo', 'i_']]
        \   }
        \ })
  function! neobundle#tapped.hooks.on_source(bundle)
  endfunction
 call neobundle#untap()
endif " }}}
if neobundle#tap('textobj-wiw') " {{{
  call neobundle#config({
        \ 'depends' : 'kana/vim-textobj-user',
        \ 'autoload' : {
        \       'mappings' : [['xo', 'a,w'], ['xo', 'i,w']]
        \   }
        \ })

  function! neobundle#tapped.hooks.on_source(bundle)
  endfunction

 call neobundle#untap()
endif " }}}

" Number Text Object {{{
onoremap n :<c-u>call <SID>NumberTextObject(0)<cr>
xnoremap n :<c-u>call <SID>NumberTextObject(0)<cr>
onoremap an :<c-u>call <SID>NumberTextObject(1)<cr>
xnoremap an :<c-u>call <SID>NumberTextObject(1)<cr>
onoremap in :<c-u>call <SID>NumberTextObject(1)<cr>
xnoremap in :<c-u>call <SID>NumberTextObject(1)<cr>

function! s:NumberTextObject(whole)
    normal! v

    while getline('.')[col('.')] =~# '\v[0-9]'
        normal! l
    endwhile

    if a:whole
        normal! o

        while col('.') > 1 && getline('.')[col('.') - 2] =~# '\v[0-9]'
            normal! h
        endwhile
    endif
endfunction
"}}}

" kana/vim-operator-replace "{{{
if neobundle#tap('vim-operator-replace') "{{{
  call neobundle#config({
        \ 'depends' : 'kana/vim-operator-user',
        \   'autoload' : {
        \     'mappings' : '<Plug>(operator-replace)'
        \   }
        \ })
  map ;R  <Plug>(operator-replace)
  function! neobundle#tapped.hooks.on_source(bundle)
  endfunction

 call neobundle#untap()
endif "}}}
"}}}

" rhysd/vim-operator-surround {{{
if neobundle#tap('vim-operator-surround') " {{{
  "call neobundle#config({
  "      \   'autoload' : {
  "      \     'commands' : 'JunkfileOpen',
  "      \     'unite_sources' : ['junkfile', 'junkfile/new'],
  "      \   }
  "      \ })
  " map <silent>gy <Plug>(operator-surround-append)
  " map <silent>gd <Plug>(operator-surround-delete)
  " map <silent>gc <Plug>(operator-surround-replace)
  map <silent>ys <Plug>(operator-surround-append)
  map <silent>ds <Plug>(operator-surround-delete)
  map <silent>cs <Plug>(operator-surround-replace)
  nmap <silent>yss V<Plug>(operator-surround-append)
  nmap <silent>dss V<Plug>(operator-surround-delete)
  nmap <silent>css V<Plug>(operator-surround-replace)
  call neobundle#untap()
endif " }}}
"}}}

"}}}

" vim-scripts/Align {{{
if neobundle#tap('Align') "{{{
  function! neobundle#tapped.hooks.on_source(bundle)
    let g:Align_xstrlen = 3
  endfunction
  nnoremap <Leader>acl :<C-u>AlignCtrl l<CR>
  nnoremap <Leader>acr :<C-u>AlignCtrl r<CR>
  nnoremap <Leader>acc :<C-u>AlignCtrl c<CR>
  call neobundle#untap()
endif "}}}
"}}}

" osyo-manga/vim-anzu search{{{
if neobundle#tap('vim-anzu') "{{{
  call neobundle#config({
        \   'autoload' : {
        \     'mappings' : ['<Plug>(anzu-'],
        \   }
        \ })
  "call neobundle#config({'autoload': {'mappings': ['<Plug>(anzu-', '<Plug>(anzu-jump-n)<Plug>', '<Plug>(anzu-jump-N)<Plug>']}})
  nmap n <Plug>(anzu-n)zzzv
  nmap N <Plug>(anzu-N)zzzv
  nmap * <Plug>(anzu-star-with-echo)
  nmap # <Plug>(anzu-sharp-with-echo)
  " clear status
  "nnoremap <Esc><Esc> :call anzu#clear_search_status()<CR>
  "nnoremap <silent><Esc><Esc> :<C-u>nohlsearch<CR>
  nnoremap <silent><C-l>
        \ :<C-u>nohlsearch<CR>
        \ :syntax enable<CR><C-l>

  " Clear hit count when nokeyinput, move window, or move tab
  autocmd MyVimrc CursorHold,CursorHoldI,WinLeave,TabLeave
      \   * call anzu#clear_search_status()
  call neobundle#untap()
"}}}
endif "}}}

" nathanaelkane/vim-indent-guides {{{
if neobundle#tap('vim-indent-guides') "{{{
  call neobundle#config({
        \   'autoload' : {
        \     'commands' : [
        \       'IndentGuidesToggle',
        \     ]},
        \ })
  function! neobundle#tapped.hooks.on_source(bundle)
    let g:indent_guides_enable_on_vim_startup = 0
    let g:indent_guides_guide_size = 1
    let g:indent_guides_auto_colors = 1
    let g:indent_guides_color_change_percent = 20
    let g:indent_guides_default_mapping = 0
  endfunction
  autocmd MyVimrc VimEnter,Colorscheme *
        \   :hi IndentGuidesOdd  ctermbg=darkgrey
  autocmd MyVimrc VimEnter,Colorscheme *
        \   :hi IndentGuidesEven ctermbg=grey
  nnoremap <Leader>i :<C-u>IndentGuidesToggle<CR>
  call neobundle#untap()
endif "}}}
"}}}

" jedi-vim {{{
if neobundle#tap('jedi-vim') "{{{
  call neobundle#config({
        \ "autoload": {
        \   "filetypes": ["python", "python3", "djangohtml"],
        \ },
        \ "build": {
        \   "mac": "pip install jedi",
        \   "unix": "pip install jedi",
        \ }})
  function! neobundle#tapped.hooks.on_source(bundle) "{{{
    " Disable automatically set completeopt+=preview
    let g:jedi#auto_vim_configuration = 0
    " Disable automatically select the first entry that pops up
    let g:jedi#popup_select_first = 0
    " Disable automatically starts completion upon typing a period
    let g:jedi#popup_on_dot = 0
    " For quickrun
    let g:jedi#rename_command = '<Leader>R'
    " For gundo
    let g:jedi#goto_assignments_command = '<Leader>G'
    let g:jedi#completions_command = "<C-N>"
  endfunction "}}}
  call neobundle#untap()
endif "}}}
"}}}

" sjl/gundo.vim" {{{
if neobundle#tap('gundo.vim') "{{{
  call neobundle#config({
        \ "autoload": {
        \   "commands": ['GundoToggle'],
        \}})
  nnoremap <Leader>g :<C-u>GundoToggle<CR>
  call neobundle#untap()
endif "}}}
"}}}

" tyru/open-browser {{{
if neobundle#tap('open-browser.vim') "{{{
  call neobundle#config({
        \ 'autoload' : {
        \   'mappings' : '<Plug>(openbrowser-smart-search)',
        \   'commands' : [
        \     'OpenBrowserSmartSearch',
        \     'OpenBrowser',
        \   ]},
        \ })
  " If it looks like URI, open an URI under cursor.
  " Otherwise, search a word under cursor.
  nmap <Leader>o <Plug>(openbrowser-smart-search)
  " If it looks like URI, open selected URI.
  " Otherwise, search selected word.
  vmap <Leader>o <Plug>(openbrowser-smart-search)
  call neobundle#untap()
endif "}}}
"}}}

" lightline.vim {{{
if neobundle#tap('lightline.vim') "{{{

    let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {
        \   'n' : 'N',
        \   'i' : 'I',
        \   'R' : 'R',
        \   'v' : 'V',
        \   'V' : 'V-L',
        \   'c' : 'COMMAND',
        \   "\<C-v>": 'V-B',
        \   's' : 'SELECT',
        \   'S' : 'S-L',
        \   "\<C-s>": 'S-B',
        \   '?': '      '
        \ },
        \ 'active': {
        \   'left': [
        \       [ 'mode', 'paste' ],
        \       [ 'fugitive','filename', 'anzu'],
        \   ],
        \   'right': [
        \       [ 'lineinfo', 'syntastic' ],
        \       [ 'percent' ],
        \       [ 'absolutepath', 'filetype'],
        \   ]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode',
        \   'syntastic': 'SyntasticStatuslineFlag',
        \   'anzu': 'anzu#search_status',
        \ }
        \ }
        "\ 'separator': { 'left': '⮀', 'right': '⮂' },
        "\ 'subseparator': { 'left': '⮁', 'right': '⮃' }
  function! neobundle#tapped.hooks.on_source(bundle) "{{{
    let g:unite_force_overwrite_statusline=0
    let g:vimfiler_force_overwrite_statusline=0
    let g:vimshell_force_overwrite_statusline=0
  endfunction "}}}

  function! MyModified() "{{{
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
  endfunction "}}}

  function! MyReadonly() "{{{
    return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
  endfunction "}}}

  function! MyFilename() "{{{
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
          \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
          \  &ft == 'unite' ? unite#get_status_string() :
          \  &ft == 'vimshell' ? vimshell#get_status_string() :
          \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
          \ ('' != MyModified() ? ' ' . MyModified() : '')
  endfunction "}}}

  function! MyFugitive() "{{{
    try
      if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
        return fugitive#head()
      endif
    catch
    endtry
    return ''
  endfunction "}}}

  function! MyFileformat() "{{{
    return winwidth('.') > 70 ? &fileformat : ''
  endfunction "}}}

  function! MyFiletype() "{{{
    return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
  endfunction "}}}

  function! MyFileencoding() "{{{
    return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
  endfunction "}}}

  function! MyMode() "{{{
    return winwidth('.') > 60 ? lightline#mode() : ''
  endfunction "}}}

  call neobundle#untap()
endif "}}}
"}}}

" autodate.vim {{{
if neobundle#tap('autodate.vim') "{{{
  call neobundle#config({
        \   'autoload' : {
        \     'filetypes' : 'vim',
        \   }
        \ })
  function! neobundle#tapped.hooks.on_source(bundle) "{{{
  endfunction "}}}
    let autodate_format = '%d %3m %Y'
    let autodate_keyword_pre = 'Last \%(Change\|Modified\):'
  call neobundle#untap()
endif "}}}
"}}}

" eskk.vim {{{
if neobundle#tap('eskk.vim') "{{{
  function! neobundle#tapped.hooks.on_source(bundle) "{{{
    let g:eskk#directory = "~/.eskk"
    let g:eskk#dictionary = {
      \   'path': "~/.skk-jisyo",
      \   'sorted': 0,
      \   'encoding': 'utf-8',
      \   }
    let g:eskk#large_dictionary = {
      \   'path': "~/.eskk/SKK-JISYO.L",
      \   'sorted': 1,
      \   'encoding': 'euc-jp',
      \   }
    let g:eskk#enable_completion = 1
  endfunction "}}}
  imap <C-j> <Plug>(eskk:toggle)
  cmap <C-j> <Plug>(eskk:toggle)
endif "}}}
"}}}

" clever-f.vim {{{
if neobundle#tap('clever-f.vim') "{{{
  call neobundle#config({
        \   'autoload' : {
        \     'mappings' : [['sxno','<Plug>(clever-f-']],
        \   }
        \ })
  function! neobundle#tapped.hooks.on_source(bundle) "{{{
    let g:clever_f_use_migemo = 1
    let g:clever_f_smart_case = 1
  endfunction "}}}
  map f <Plug>(clever-f-f)
  map F <Plug>(clever-f-F)
endif "}}}
"}}}

" accelerated-jk {{{
if neobundle#tap('accelerated-jk') "{{{
  call neobundle#config({
        \   'autoload' : {
        \     'mappings' : [['sxno','<Plug>(accelerated_jk_']],
        \   }
        \ })
  function! neobundle#tapped.hooks.on_source(bundle) "{{{
    let g:accelerated_jk_acceleration_table=[7,52,57]
  endfunction "}}}
  nmap j <Plug>(accelerated_jk_gj)
  nmap k <Plug>(accelerated_jk_gk)
endif "}}}
"}}}

" vim-smartinput {{{
if neobundle#tap('vim-smartinput') "{{{
  call neobundle#config({
        \   'autoload' : {
        \     'insert' : 1,
        \   }
        \ })
  " Clear Default Rules
  call smartinput#clear_rules()
  " Space in Bracket "{{{
  call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')
  call smartinput#define_rule({
              \   'at'    : '(\%#)',
              \   'char'  : '<Space>',
              \   'input' : '<Space><Space><Left>',
              \   })

  call smartinput#define_rule({
              \   'at'    : '( \%# )',
              \   'char'  : '<BS>',
              \   'input' : '<Del><BS>',
              \   })
  "}}}

  " Delete EOL Space "{{{
  call smartinput#define_rule({
              \   'at'    : '\s\+\%#',
              \   'char'  : '<CR>',
              \   'input' :
                \ "<C-o>:call setline('.', substitute(getline('.'), '\\s\\+$', '', ''))<CR><C-]><C-G>u<CR>",
              \   })
  "}}}

endif
"}}}
"}}}

" vim-smartchr {{{
if neobundle#tap('vim-smartchr') "{{{
  call neobundle#config({
        \   'autoload' : {
        \     'insert' : 1,
        \   }
        \ })
  " TODO: Good Settings
  "inoremap <expr> = smartchr#loop(' = ', ' == ', '=')
  "inoremap <expr> > smartchr#loop(' > ', ' >> ', '>')
  "inoremap <expr> < smartchr#loop(' < ', ' << ', '<')
  "inoremap <expr> & smartchr#loop(' & ', ' && ', '&')
  "inoremap <expr> <Bar> smartchr#loop(' | ', ' || ', '|')

  "inoremap <expr> + smartchr#loop(' + ', '++', '+')
  "inoremap <expr> - smartchr#loop(' - ', '--', '-')
  "inoremap <expr> * smartchr#loop(' * ', '*')

endif "}}}
"}}}

" columnjump {{{
if neobundle#tap('columnjump') "{{{
  call neobundle#config({
        \   'autoload' : {
        \     'mappings' : [['sxno','<Plug>(columnjump-']],
        \   }
        \ })
  nmap <C-k> <Plug>(columnjump-backward)
  nmap <C-j> <Plug>(columnjump-forward)
endif "}}}
"}}}

" amdt/vim-niji "{{{
if neobundle#tap('vim-niji') "{{{
  call neobundle#config({
        \   'autoload' : {
        \     'filetypes' : [
        \       'scheme',
        \       'clojure',
        \       'lisp'
        \     ]},
        \ })
  function! neobundle#tapped.hooks.on_source(bundle) "{{{
    let g:loaded_niji = 0
  endfunction "}}}
  call neobundle#untap()
endif "}}}
"}}}

" aharisu/vim_goshrepl "{{{
if neobundle#tap('vim_goshrepl') "{{{
  call neobundle#config({
        \   'autoload' : {
        \     'filetypes' : [
        \       'scheme',
        \       'clojure',
        \       'lisp'
        \     ]},
        \ })
  call neobundle#untap()
endif "}}}
"}}}

" kien/rainbow_parentheses.vim "{{{
if neobundle#tap('rainbow_parentheses.vim') "{{{
  call neobundle#config({
        \   'autoload' : {
        \     'filetypes' : [
        \       'scheme',
        \       'clojure',
        \       'lisp'
        \     ]},
        \ })
  " Scheme {{{
  autocmd MyVimrc BufRead,BufNewFile,BufReadPre *.scm
          \ RainbowParenthesesLoadRound
  autocmd MyVimrc BufWinEnter *.scm
          \ RainbowParenthesesToggle
  " }}}
  " n -> niji
  nnoremap <silent> <Leader><Leader>n
        \ :RainbowParenthesesLoadRound<CR>
        \ :RainbowParenthesesLoadSquare<CR>
        \ :RainbowParenthesesLoadBraces<CR>
        \ :RainbowParenthesesLoadChevrons<CR>
        \ :RainbowParenthesesToggleAll<CR>
  call neobundle#untap()
endif "}}}
"}}}

" mhinz/vim-signify "{{{
if neobundle#tap('vim-signify') "{{{
  nmap ;J <plug>(signify-next-hunk)
  nmap ;K <plug>(signify-prev-hunk)
  call neobundle#untap()
endif "}}}
"}}}

" migemo "{{{
if neobundle#tap('vim-migemo') "{{{
  call neobundle#config({
        \   'autoload' : {
        \     'commands' : [
        \       'Migemo',
        \     ]
        \   }
        \ })
  noremap g/ :<C-u>Migemo<CR>
  call neobundle#untap()
endif "}}}
"}}}

" osyo-manga/vim-over {{{
if neobundle#tap('vim-over') "{{{
  call neobundle#config({
        \   'autoload' : {
        \     'commands' : [
        \       'OverCommandLine',
        \     ]
        \   }
        \ })
  call neobundle#untap()
endif "}}}
"}}}

" Leafcage/yankround {{{
if neobundle#tap('yankround.vim') "{{{
  call neobundle#config({
        \   'autoload' : {
        \     'mappings' : ['<Plug>(yankround-'],
        \   }
        \ })
	nmap p <Plug>(yankround-p)
	nmap P <Plug>(yankround-P)
	nmap <C-p> <Plug>(yankround-prev)
	nmap <C-n> <Plug>(yankround-next)
  call neobundle#untap()
endif "}}}
"}}}

" basyura/TweetVim {{{
if neobundle#tap('TweetVim') "{{{
  call neobundle#config({
        \   'depends' :
        \     ['basyura/twibill.vim',
        \      'tyru/open-browser.vim',
        \     ],
        \   'autoload' : {
        \     'commands' :
        \         ['TweetVimHomeTimeline',
        \          'TweetVimMentions',
        \          'TweetVimSay',
        \          'TweetVimUserTimeline',
        \          'TweetVimUserStream']
        \   }
        \ })
  function! neobundle#tapped.hooks.on_source(bundle) "{{{
    let g:tweetvim_display_icon=1
    autocmd FileType tweetvim setlocal nonumber
  endfunction "}}}
  call neobundle#untap()
endif "}}}
"}}}

" vim-script/DrawIt {{{
if neobundle#tap('DrawIt') " {{{
  call neobundle#config({
        \   'autoload' : {
        \     'commands' : [
        \       'DrawIt',
        \     ],
        \   }
        \ })

  function! neobundle#tapped.hooks.on_source(bundle)
  endfunction

  call neobundle#untap()
endif " }}}
"}}}

" pentie/VimRepress {{{
if neobundle#tap('VimRepress') " {{{
  call neobundle#config({
        \   'autoload' : {
        \     'commands' : [
        \       'BlogNew','BlogList'
        \     ],
        \   }
        \ })

  function! neobundle#tapped.hooks.on_source(bundle)
  endfunction

  call neobundle#untap()
endif " }}}
"}}}

" tsukkee/lingr-vim {{{
if neobundle#tap('lingr-vim') " {{{
  call neobundle#config({
        \   'autoload' : {
        \     'commands' : [
        \       'LingrLaunch'
        \     ],
        \   }
        \ })

  function! neobundle#tapped.hooks.on_source(bundle)
  endfunction

  call neobundle#untap()
endif " }}}
"}}}

" thinca/vim-scouter {{{
if neobundle#tap('vim-scouter') " {{{
  call neobundle#config({
        \   'autoload' : {
        \     'commands' : [
        \       'Scouter'
        \     ],
        \   }
        \ })
  call neobundle#untap()
endif " }}}
"}}}

" thinca/vim-visualstar {{{
if neobundle#tap('vim-visualstar') " {{{
  call neobundle#config({
        \   'autoload' : {
        \     'mappings' : ['<Plug>(visualstar-'],
        \   }
        \ })
  vmap <silent>*  <Plug>(visualstar-*)N
  call neobundle#untap()
endif " }}}
"}}}

" tpope/vim-commentary {{{
if neobundle#tap('vim-commentary') " {{{
  call neobundle#config({
        \   'autoload' : {
        \     'mappings' : ['\\'],
        \   }
        \ })
  call neobundle#untap()
endif " }}}
"}}}


" vim-scripts/loremipsum {{{
if neobundle#tap('loremipsum') " {{{
  call neobundle#config({
        \   'autoload' : {
        \     'commands' : [
        \       'Loremipsum'
        \     ],
        \   }
        \ })
  call neobundle#untap()
endif " }}}
"}}}

" Shougo/junkfile.vim {{{
if neobundle#tap('junkfile.vim') " {{{
  call neobundle#config({
        \   'autoload' : {
        \     'commands' : 'JunkfileOpen',
        \     'unite_sources' : ['junkfile', 'junkfile/new'],
        \   }
        \ })
  call neobundle#untap()
endif " }}}
"}}}

" thinca/vim-prettyprint {{{
if neobundle#tap('vim-prettyprint') " {{{
  call neobundle#config({
        \   'autoload' : {
        \     'commands' : 'PP',
        \   }
        \ })
  call neobundle#untap()
endif " }}}
"}}}

" End plugins }}}

"------------------------------------
" vim: expandtab softtabstop=2 shiftwidth=2 foldmethod=marker
