" haya14busa's vimrc
" Author: haya14busa
" URL: http://haya14busa.com
" Source: https://github.com/haya14busa/dotfiles/
" Last Change:2013/10/10 20:49:42 .

" NeoBundle {{{====================

set nocompatible
filetype plugin indent off

if has('vim_starting')
    set runtimepath& runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" NeoBundle Function {{{
function! s:bundle_tap(bundle) " {{{
  let s:tapped_bundle = neobundle#get(a:bundle)
  return neobundle#is_installed(a:bundle)
endfunction " }}}
function! s:bundle_config(config) " {{{
  if exists("s:tapped_bundle") && s:tapped_bundle != {}
    call neobundle#config(s:tapped_bundle.name, a:config)
  endif
endfunction " }}}
function! s:bundle_untap() " {{{
  let s:tapped_bundle = {}
endfunction " }}}
"}}}

NeoBundle 'Shougo/vimproc'
NeoBundleLazy 'Shougo/unite.vim'
" NeoBundle Unite plugins {{{
NeoBundleLazy 'Shougo/unite-ssh'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'mattn/unite-advent_calendar'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'osyo-manga/unite-fold'
NeoBundle 'kmnk/vim-unite-giti'
NeoBundle 'thinca/vim-unite-history'
"}}}
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'ujihisa/vimshell-ssh'
NeoBundleLazy 'Shougo/neosnippet.vim'
" Shougo/neocomplete {{{
if has('lua') && v:version >= 703
    NeoBundleLazy 'Shougo/neocomplete.vim'
else
    NeoBundleLazy 'Shougo/neocomplcache.vim'
endif
"}}}
NeoBundle 'thinca/vim-quickrun'
NeoBundleLazy 'thinca/vim-scouter'
NeoBundle 'thinca/vim-visualstar'
NeoBundle 'thinca/vim-template'
" thinca/vim-ref {{{
NeoBundleLazy 'thinca/vim-ref'
NeoBundle 'mojako/ref-sources.vim'
NeoBundle 'tokuhirom/jsref'
NeoBundle 'mustardamus/jqapi'
"}}}
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-markdown'
" NeoBundle Git {{{
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
"}}}
NeoBundle 'kana/vim-smartchr'
NeoBundle 'kana/vim-fakeclip'
NeoBundleLazy 'mattn/emmet-vim'
NeoBundleLazy 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
"NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'haya14busa/vim-easymotion'
" Neobundle Text Object {{{
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-entire'           " ae, ie
NeoBundle 'kana/vim-textobj-fold'             " az, iz
NeoBundle 'kana/vim-textobj-indent'           " ai, ii
NeoBundle 'kana/vim-textobj-line'             " al, il
NeoBundle 'kana/vim-textobj-syntax'           " ay, iy
NeoBundle 'kana/vim-textobj-django-template'  " adb, idb
NeoBundle 'thinca/vim-textobj-between'        " af{char}, if{char}
NeoBundle 'mattn/vim-textobj-url'             " au, ai
NeoBundle 'osyo-manga/vim-textobj-multiblock' " ab, ib
NeoBundle 'lucapette/vim-textobj-underscore'  " a_, i_
NeoBundle 'h1mesuke/textobj-wiw'              " a,w a,e

" to surround vim objects with a pair of identical chars
NeoBundle 'tpope/vim-surround'
"}}}

" Extend Basic Vim Commands
NeoBundle 'matchit.zip'
NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'osyo-manga/vim-anzu'
NeoBundle 'LeafCage/foldCC'
NeoBundle 'vim-scripts/Align'
NeoBundleLazy 'nathanaelkane/vim-indent-guides'
NeoBundleLazy "davidhalter/jedi-vim"
NeoBundleLazy "sjl/gundo.vim"
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'autodate.vim'

" NeoBundle Web
NeoBundleLazy 'tyru/open-browser.vim'
NeoBundle 'vim-scripts/loremipsum'

" Neobundle Syntax {{{
NeoBundle 'scrooloose/syntastic'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'wavded/vim-stylus'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'kchmck/vim-coffee-script'
" NeoBundle for expr {{{
NeoBundleLazy "python_fold", {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"],
      \ }}
NeoBundleLazy "vim-scripts/CSS-one-line--multi-line-folding", {
      \ "autoload": {
      \   "filetypes": ["css"],
      \ }}
NeoBundleLazy "vim-scripts/phpfolding.vim", {
      \ "autoload": {
      \   "filetypes": ["php"],
      \ }}
"}}}

"}}}

" NeoBundle Japanese {{{
NeoBundle 'migemo', {'type':'nosync','base':'~/.vim/bundle/manual'}
NeoBundle 'tyru/eskk.vim'
"}}}

" ColorScheme {{{
NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'altercation/vim-colors-solarized'
"}}}

" Others"{{{
NeoBundle 'pentie/VimRepress' "WordPress
NeoBundle 'tsukkee/lingr-vim' "Lingr
NeoBundle 'mattn/learn-vimscript'
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
set clipboard& clipboard+=unnamed,autoselect
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
set virtualedit=block
set whichwrap=b,s,h,l,[,],<,>
set wrap
set wrapscan

" Colorscheme {{{
syntax enable
set background=dark
set t_Co=256
colorscheme molokai
"}}}

" Tab Basic Settings {{{
set autoindent
set expandtab
set softtabstop=4
set shiftwidth=4
set tabstop=4
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

"}}}

" release autogroup in MyAutoCmd {{{
augroup MyAutoCmd
  autocmd!
augroup END
"}}}

" Open & AutoReload .vimrc {{{
command! EVimrc e $MYVIMRC
command! ETabVimrc tabnew $MYVIMRC

augroup Reloadvimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | setlocal foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END
" Reload syntax after source $MYVIMRC
nnoremap <Leader>ss :<C-u>syntax on<CR>
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
" for Undo Revision
inoremap <CR> <C-g>u<CR>
"}}}

" Motion {{{
nnoremap h <Left>
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap l <Right>

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
"}}}

" Paste in insert  and Ex mode"{{{
inoremap <C-y> <C-r>"
cnoremap <C-y> <C-r>"
"}}}

" Window {{{
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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

" turn on the spell checking and set the English language
nnoremap <Leader>se :set spell spelllang=en<CR>
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

"}}}


" set nopaste when Insertleave"{{{
autocmd MyAutoCmd InsertLeave * set nopaste
"}}}

" Show invisibles {{{

" Shortcut to rapidly toggle `set list`
nnoremap <Leader>l :<C-u>set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"Invisible character colors
hi NonText guifg=#4a4a59
hi SpecialKey guifg=#4a4a59

" Highlight End-of-Line Whitespace {{{
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END
"}}}

"}}}

" Save Cursor Position and Fold {{{
augroup SaveInfo
  autocmd!
  autocmd BufWinLeave *.* silent mkview!
  autocmd BufWinEnter *.* silent loadview
augroup END

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
augroup AutoMkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)  " {{{
    if !isdirectory(a:dir) && (a:force ||
    \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction  " }}}
augroup END
"}}}

" Filetypes "{{{====================

" Stylus {{{
augroup StylusAutocmd
  autocmd!
  autocmd BufRead,BufNewFile,BufReadPre *.styl setlocal filetype=sass
  autocmd FileType sass     setlocal sw=2 sts=2 ts=2 et
  autocmd BufWritePost,FileWritePost *.styl silent !stylus <afile> -u nib >/dev/null
augroup END
"}}}

" CoffeeScript {{{
augroup CoffeeAutocmd
  autocmd!
  autocmd BufRead,BufNewFile,BufReadPre *.coffee   setlocal filetype=coffee
  autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
  autocmd BufWritePost,FileWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!
augroup END
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

augroup sassautocmd
    autocmd bufwritepost *.scss call Sass_convert()
augroup end
"}}}


"}}}

" end vim setup}}}

" plugin settings {{{====================

" shougo/vimproc"{{{
if s:bundle_tap('vimproc') "{{{
  call s:bundle_config({
       \ 'build' : {
       \     'windows' : 'make -f make_mingw32.mak',
       \     'cygwin'  : 'make -f make_cygwin.mak',
       \     'mac'     : 'make -f make_mac.mak',
       \     'unix'    : 'make -f make_unix.mak',
       \    },
       \ })
  call s:bundle_untap()
endif "}}}
"}}}

" Shougo/unite.vim"{{{
if s:bundle_tap('unite.vim') "{{{
  " Config"{{{
  call s:bundle_config({
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
  function! s:tapped_bundle.hooks.on_source(bundle)
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
  nnoremap <silent> [unite]; :<C-u>Unite source -silent -start-insert<CR>

  " Buffer
  nnoremap <silent> [unite]b :<C-u>Unite -silent buffer file_mru bookmark<CR>
  " File List
  nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -silent -buffer-name=files file<CR>

  " Recent File
  "nnoremap <silent> [unite]m :<C-u>Unite -silent file_mru<CR>

  " Register List
  nnoremap <silent> [unite]r :<C-u>Unite -silent -buffer-name=register register<CR>

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

  " Unite Plugin Settings
  "-Unite Plugin Settings--------------"{{{
  " Execute help.
  nnoremap [unite]h  :<C-u>Unite -silent -start-insert -buffer-name=help help<CR>
  " Execute help by cursor keyword.
  nnoremap <silent> [unite]gh  :<C-u>UniteWithCursorWord -silent help<CR>
  " Outeline
  nnoremap <silent> [unite]o :<C-u>Unite -silent outline -start-insert -resume<CR>
  " Fold
  nnoremap <silent> [unite]<Space> :<C-u>Unite -silent fold<CR>

  "}}}
  "}}}

  call s:bundle_untap()
endif "}}}
"}}}

" Shougo/unite-ssh"{{{
if s:bundle_tap('unite-ssh') "{{{
  call s:bundle_config({
        \   'autoload' : {
        \     'filetypes' : 'vimshell',
        \   }
        \ })
  call s:bundle_untap()
endif "}}}
"}}}

" Shougo/VimFiler {{{
if s:bundle_tap('vimfiler') "{{{
  call s:bundle_config({
        \   'autoload' : {
        \     'commands' : [
        \       'VimFiler',
        \       'VimFilerTab',
        \       'VimFilerBufferDir',
        \     ]
        \   }
        \ })
  let g:vimfiler_as_default_explorer=1
  let g:vimfiler_safe_mode_by_default=0
  call s:bundle_untap()
endif "}}}
"}}}

" Shougo/vimshell {{{
if s:bundle_tap('vimshell') "{{{
  call s:bundle_config({
        \   'depends': ['Shougo/vimproc'],
        \   'autoload' : {
        \     'commands' : [
        \       'VimShell',
        \       'VimShellTab',
        \       'VimShellBufferDir',
        \     ]
        \   }
        \ })
  "let g:vimshell_prompt_expr = 'getcwd()." > "'
  "let g:vimshell_prompt_pattern = '^\f\+ > '

  " Use current directory as vimshell prompt.
  let g:vimshell_prompt_expr =
            \ 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
  let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '
  call s:bundle_untap()
endif "}}}
"}}}


" Shougo/neosnippet.vim"{{{
if s:bundle_tap('neosnippet.vim') "{{{
  call s:bundle_config({
        \   'depends' : ['honza/vim-snippets'],
        \   'autoload' : {
        \     'insert' : 1,
        \   }
        \ })
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
  " Tell Neosnippet about the other snippets
  " let g:neosnippet#snippets_directory=s:bundle_root . '/vim-snippets/snippets'

  call s:bundle_untap()
endif "}}}
"}}}

" Shougo/neocomplete.vim"{{{
if s:bundle_tap('neocomplete.vim') "{{{
  call s:bundle_config({
        \   'autoload' : {
        \     'insert' : 1,
        \   }
        \ })
  function! s:tapped_bundle.hooks.on_source(bundle)
    let g:neocomplete#enable_at_startup = 1
    let s:hooks = neobundle#get_hooks("neocomplete.vim")
    let g:acp_enableAtStartup = 0
    let g:neocomplet#enable_smart_case = 1
  endfunction
  call s:bundle_untap()
endif "}}}
"}}}

" Shougo/neocomplcache.vim"{{{
if s:bundle_tap('neocomplcache.vim') "{{{
  call s:bundle_config({
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
  call s:bundle_untap()
endif "}}}
"}}}

" thinca/vim-quickrun {{{
if s:bundle_tap('vim-quickrun') "{{{
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
  call s:bundle_untap()
endif "}}}

"}}}

" thinca/vim-scouter"{{{
if s:bundle_tap('vim-scouter') "{{{
  call s:bundle_config({
        \   'autoload' : {
        \     'commands' : 'Scouter',
        \   }
        \ })
  call s:bundle_untap()
endif "}}}
"}}}

" thinca/vim-template {{{
if s:bundle_tap('vim-template') "{{{
  autocmd MyAutoCmd User plugin-template-loaded call s:template_keywords()
  function! s:template_keywords()
      silent! %s/<+DATE+>/\=strftime('%Y-%m-%d')/g
      silent! %s/<+FILENAME+>/\=expand('%:r')/g
  endfunction

  autocmd MyAutoCmd User plugin-template-loaded
      \   if search('<+CURSOR+>')
      \ |   silent! execute 'normal! "_da>'
      \ | endif

  call s:bundle_untap()
endif "}}}
"}}}

" thinca/vim-ref {{{
if s:bundle_tap('vim-ref') "{{{
  call s:bundle_config({
        \   'autoload' : {
        \     'commands' : 'Ref',
        \   }
        \ })
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
  call s:bundle_untap()
endif "}}}
"}}}

" gregsexton/gitv {{{
if s:bundle_tap('gitv') "{{{
  autocmd MyAutoCmd FileType gitv call s:my_gitv_settings()
  function! s:my_gitv_settings()
    setlocal iskeyword&
    setlocal iskeyword+=/,-,.
    nnoremap <silent><buffer> C :<C-u>Git checkout <C-r><C-w><CR>

    nnoremap <buffer> <Space>rb :<C-u>Git rebase <C-r>=GitvGetCurrentHash()<CR><Space>
    nnoremap <buffer> <Space>R :<C-u>Git revert <C-r>=GitvGetCurrentHash()<CR><CR>
    nnoremap <buffer> <Space>h :<C-u>Git cherry-pick <C-r>=GitvGetCurrentHash()<CR><CR>
    nnoremap <buffer> <Space>rh :<C-u>Git reset --hard <C-r>=GitvGetCurrentHash()<CR>

    nnoremap <silent><buffer> t :<C-u>windo call <SID>toggle_git_folding()<CR>1<C-w>w
  endfunction

  function! s:gitv_get_current_hash()
    return matchstr(getline('.'), '\[\zs.\{7\}\ze\]$')
  endfunction

  autocmd MyAutoCmd FileType git setlocal nofoldenable foldlevel=0
  function! s:toggle_git_folding()
    if &filetype ==# 'git'
      setlocal foldenable!
    endif
  endfunction

  call s:bundle_untap()
endif "}}}

"}}}

" mattn/emmet-vim"{{{
if s:bundle_tap('emmet-vim') "{{{
  call s:bundle_config({
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
  call s:bundle_untap()
endif "}}}
"}}}

" mattn/gist-vim"{{{
if s:bundle_tap('gist-vim') "{{{
  call s:bundle_config({
        \   'autoload' : {
        \     'commands' : [
        \       'Gist',
        \     ]},
        \ })
  call s:bundle_untap()
endif "}}}
"}}}

" vim-easymotion {{{
if s:bundle_tap('vim-easymotion') "{{{
    let g:EasyMotion_leader_key = ';'
    let g:EasyMotion_keys='hklyuiopnm,qwertzxcvbasdgjf;'
    " Shortcut!
    " let g:EasyMotion_mapping_s = 's'
    " let g:EasyMotion_mapping_S = 'S'
    nmap s ;s
    imap <C-d> <C-o>;s
    vmap s ;s
    nmap S ;S
    vmap S ;S
    "nnoremap ;l :call EasyMotion#JK(0,2)<CR>

    " Highlight"{{{
    hi link EasyMotionTarget ErrorMsg
    hi link EasyMotionShade  Comment
    hi link EasyMotionTarget2First MatchParen
    hi link EasyMotionTarget2Second MatchParen
    "}}}

    " forked easymotion extention"{{{
    let g:EasyMotion_special_select_line = 1
    let g:EasyMotion_special_select_phrase = 1

    let g:EasyMotion_special_mapping_l = 'L'
    let g:EasyMotion_special_mapping_p = 'p'

    " keep cursor column
    let g:EasyMotion_startofline = 0

    " smartcase
    let g:EasyMotion_smartcase = 1

    " Don't skip folded line
    let g:EasyMotion_skipfoldedline = 0

    "}}}

    " Change mapping for Unite"{{{
    let g:EasyMotion_mapping_f = ';,f'
    let g:EasyMotion_mapping_F = ';,F'
    let g:EasyMotion_mapping_W = ';,W'
    let g:EasyMotion_mapping_b = ';,b'
    let g:EasyMotion_mapping_B = ';,B'
    let g:EasyMotion_mapping_E = ';,E'
    let g:EasyMotion_mapping_gE = ';,gE'
    "}}}

  call s:bundle_untap()
endif "}}}
"}}}

" TextObject Keymaps{{{

" thinca/vim-textobj-between"{{{
if s:bundle_tap('vim-textobj-between') "{{{
  omap if <Plug>(textobj-between-i)
  omap af <Plug>(textobj-between-a)
  vmap if <Plug>(textobj-between-i)
  vmap af <Plug>(textobj-between-a)
  call s:bundle_untap()
endif "}}}
"}}}

" osyo-manga/vim-textobj-multiblock"{{{
if s:bundle_tap('vim-textobj-multiblock') "{{{
  omap ib <Plug>(textobj-multiblock-i)
  omap ab <Plug>(textobj-multiblock-a)
  vmap ib <Plug>(textobj-multiblock-i)
  vmap ab <Plug>(textobj-multiblock-a)
  call s:bundle_untap()
endif "}}}
"}}}

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

"}}}

" vim-scripts/Align {{{
if s:bundle_tap('Align') "{{{
  let g:Align_xstrlen = 3
  nnoremap <Leader>acl :<C-u>AlignCtrl l<CR>
  nnoremap <Leader>acr :<C-u>AlignCtrl r<CR>
  nnoremap <Leader>acc :<C-u>AlignCtrl c<CR>
  call s:bundle_untap()
endif "}}}
"}}}

" osyo-manga/vim-anzu search{{{
if s:bundle_tap('vim-anzu') "{{{
  nmap n zz<Plug>(anzu-n)
  nmap N zz<Plug>(anzu-N)
  nmap * <Plug>(anzu-star-with-echo)
  nmap # <Plug>(anzu-sharp-with-echo)
  " clear status
  "nnoremap <Esc><Esc> :call anzu#clear_search_status()<CR>
  "nnoremap <silent><Esc><Esc> :<C-u>nohlsearch<CR>
  nnoremap <silent><C-l> :<C-u>nohlsearch<CR><C-l>

  augroup VimAnzu
  " Clear hit count when nokeyinput, move window, or move tab
      autocmd!
      autocmd CursorHold,CursorHoldI,WinLeave,TabLeave
        \   * call anzu#clear_search_status()
  augroup END
  call s:bundle_untap()
"}}}
endif "}}}

" nathanaelkane/vim-indent-guides {{{
if s:bundle_tap('vim-indent-guides') "{{{
  call s:bundle_config({
        \   'autoload' : {
        \     'commands' : [
        \       'IndentGuidesToggle',
        \     ]},
        \ })
  let g:indent_guides_enable_on_vim_startup = 0
  let g:indent_guides_guide_size = 1
  let g:indent_guides_auto_colors = 1
  let g:indent_guides_color_change_percent = 20
  let g:indent_guides_default_mapping = 0
  augroup VimIndentGuides
      autocmd!
      autocmd VimEnter,Colorscheme *
        \   :hi IndentGuidesOdd  ctermbg=darkgrey
      autocmd VimEnter,Colorscheme *
        \   :hi IndentGuidesEven ctermbg=grey
  augroup END
  nnoremap <Leader>i :<C-u>IndentGuidesToggle<CR>
  call s:bundle_untap()
endif "}}}
"}}}

" jedi-vim {{{
if s:bundle_tap('jedi-vim') "{{{
  call s:bundle_config({
        \ "autoload": {
        \   "filetypes": ["python", "python3", "djangohtml"],
        \ },
        \ "build": {
        \   "mac": "pip install jedi",
        \   "unix": "pip install jedi",
        \ }})
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
  call s:bundle_untap()
endif "}}}
"}}}

" sjl/gundo.vim" {{{
if s:bundle_tap('gundo.vim') "{{{
  call s:bundle_config({
        \ "autoload": {
        \   "commands": ['GundoToggle'],
        \}})
  nnoremap <Leader>g :<C-u>GundoToggle<CR>
  call s:bundle_untap()
endif "}}}
"}}}

" tyru/open-browser {{{
if s:bundle_tap('open-browser.vim') "{{{
  call s:bundle_config({
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
  call s:bundle_untap()
endif "}}}
"}}}

" lightline.vim {{{
if s:bundle_tap('lightline.vim') "{{{
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
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

  function! MyModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
  endfunction

  function! MyReadonly()
    return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
  endfunction

  function! MyFilename()
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
          \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
          \  &ft == 'unite' ? unite#get_status_string() :
          \  &ft == 'vimshell' ? vimshell#get_status_string() :
          \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
          \ ('' != MyModified() ? ' ' . MyModified() : '')
  endfunction

  function! MyFugitive()
    try
      if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
        return fugitive#head()
      endif
    catch
    endtry
    return ''
  endfunction

  function! MyFileformat()
    return winwidth('.') > 70 ? &fileformat : ''
  endfunction

  function! MyFiletype()
    return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
  endfunction

  function! MyFileencoding()
    return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
  endfunction

  function! MyMode()
    return winwidth('.') > 60 ? lightline#mode() : ''
  endfunction

  let g:unite_force_overwrite_statusline=0
  let g:vimfiler_force_overwrite_statusline=0
  let g:vimshell_force_overwrite_statusline=0

  call s:bundle_untap()
endif "}}}
"}}}

" autodate.vim {{{
if s:bundle_tap('autodate.vim') "{{{
  let autodate_format = '%Y/%m/%d %H:%M:%S '
  call s:bundle_untap()
endif "}}}
"}}}

" eskk.vim {{{
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
"}}}

" End plugins }}}

"------------------------------------
" vim: expandtab softtabstop=2 shiftwidth=2 foldmethod=marker

