set nocompatible
filetype plugin indent off

" NeoBundle
"-NeoBundle--------------------------"{{{
if has('vim_starting')
    set runtimepath& runtimepath+=~/.vim/.bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/.bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin'  : 'make -f make_cygwin.mak',
      \     'mac'     : 'make -f make_mac.mak',
      \     'unix'    : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'mattn/unite-advent_calendar'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'osyo-manga/unite-fold'
NeoBundle 'kmnk/vim-unite-giti'

NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell', {
      \ "depends": ["Shougo/vimproc"],
      \ }
NeoBundle 'ujihisa/vimshell-ssh'

NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'mattn/emmet-vim'

NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
"NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'supasorn/vim-easymotion'
NeoBundle 'git://gist.github.com/411828.git', {'directory': 'endtagcomment'}
NeoBundle 'pangloss/vim-javascript'
"NeoBundle 'YankRing.vim'
NeoBundle 'wavded/vim-stylus'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'tpope/vim-haml'
NeoBundle 'vim-scripts/loremipsum'
NeoBundle 'matchit.zip'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'kana/vim-fakeclip'
NeoBundle 'pentie/VimRepress'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tell-k/vim-browsereload-mac'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tsukkee/lingr-vim'
NeoBundle 'thinca/vim-scouter'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'thinca/vim-visualstar'
NeoBundle 'thinca/vim-ref'
NeoBundle 'mojako/ref-sources.vim'
NeoBundle 'mustardamus/jqapi'
NeoBundle 'tokuhirom/jsref'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'osyo-manga/vim-anzu'

" Neobundle Text Object
"-Neobundle Text Object--------------"{{{
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-entire'
NeoBundle 'kana/vim-textobj-fold'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'kana/vim-textobj-line'
NeoBundle 'kana/vim-textobj-syntax'
NeoBundle 'kana/vim-textobj-django-template'
NeoBundle 'thinca/vim-textobj-between'
NeoBundle 'mattn/vim-textobj-url'
NeoBundle 'osyo-manga/vim-textobj-multiblock'
NeoBundle 'lucapette/vim-textobj-underscore'
NeoBundle 'h1mesuke/textobj-wiw'
"}}}

"}}}
filetype plugin indent on
" ColorScheme
"-ColorScheme------------------------"{{{
NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'altercation/vim-colors-solarized'
colorscheme molokai
"}}}
" Basic Options
"-Basic Options----------------------"{{{
set encoding=utf-8
set fileformats=unix,dos,mac
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
syntax on
set ambiwidth=double
set autoread
set backspace=indent,eol,start
set clipboard& clipboard+=unnamed,autoselect
set cmdheight=1
set display=lastline
set grepprg=internal
set hidden
set history=100
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
set wildmenu
set wrap
set wrapscan

" Tab Settings
"-Tab Settings-----------------------"{{{
set autoindent
set expandtab
set softtabstop=4
set shiftwidth=4
set tabstop=4
"}}}
" Search Settings
"-Search Settings--------------------"{{{
set incsearch
set ignorecase
set smartcase
set hlsearch
" Unhighlight by <Esc>*2
"nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>
"nnoremap n nzz
"nnoremap N Nzz
" -> osyo-manga/vim-anzu

" Search select words in visualmode
" vnoremap * "zy:let @/ = @z<CR>n
" -> thinca/vim-visualstar

"}}}
" Line Settings
"-Line Settings----------------------"{{{
set number
"set cursorline
"}}}
" Backup Settings
"-Backup Settings--------------------"{{{
" Don't create backup
set nobackup
set nowritebackup
set backupdir-=.
"}}}
" Swap Settings
"-Swap Settings----------------------"{{{
set swapfile
set directory-=.
"}}}
"}}}
" release autogroup in MyAutoCmd
"-release autogroup in MyAutoCmd-----"{{{
augroup MyAutoCmd
  autocmd!
augroup END"}}}
" Open & AutoReload .vimrc
"-Open & AutoReload .vimrc-----------"{{{
command! EVimrc e $MYVIMRC
command! ETabVimrc tabnew $MYVIMRC

augroup reload-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END
"}}}
" Useful Keymap
"-Useful Keymap----------------------"{{{
" Escape keymaps
"-Escape keymaps---------------------"{{{
inoremap <silent> jj <ESC>
inoremap <silent> kk <ESC>
vnoremap <silent> <C-j> <ESC>
inoremap <silent> <C-c> <ESC>
"}}}

nnoremap ZZ <Nop>
nnoremap <CR> o<ESC>

" Motion
"-Motion-----------------------------"{{{
nnoremap h <Left>
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap l <Right>

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>

cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
"}}}

" Command line History
"-Command line History---------------"{{{
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
"}}}


" Sudo write
cmap w!! w !sudo tee > /dev/null %

" From the cursor to the end of line
"-From the cursor to the end of line-"{{{
" Select from cursor position to end of line
vnoremap v $h
" Yank from cursor position to end of line
nnoremap Y y$
"}}}

" for Matchit
"-for Matchit------------------------"{{{
"nnoremap <Tab> %
"vnoremap <Tab> %
map <Tab> %
"}}}

nnoremap ,y :<C-u>YRShow<CR>

" Window
"-Window-----------------------------"{{{
"nnoremap s <C-w>
"
"nnoremap <S-Right> :<C-u>vertical resize +2<CR>
"nnoremap <S-Left> :<C-u>vertical resize -2<CR>
"nnoremap <S-Up> :<C-u>resize +1<CR>
"nnoremap <S-Down> :<C-u>resize -1<CR>
"}}}

" set nopaste when Insertleave
autocmd MyAutoCmd InsertLeave * set nopaste


"inoremap {} {}<LEFT>
"inoremap [] []<LEFT>
"inoremap () ()<LEFT>
"inoremap "" ""<LEFT>
"inoremap '' ''<LEFT>
"inoremap <> <><LEFT>

" Scroll
"-Scroll-----------------------------"{{{
nnoremap <C-e> <C-e>j
nnoremap <C-y> <C-y>k
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
"}}}

"}}}
" Show invisibles
"-Show invisibles--------------------"{{{
" Shortcut to rapidly toggle `set list`
nnoremap <Leader>l :<C-u>set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
"Invisible character colors
hi NonText guifg=#4a4a59
hi SpecialKey guifg=#4a4a59
"}}}
" TextObject
"-TextObject-------------------------"{{{
" thinca/vim-textobj-between
omap if <Plug>(textobj-between-i)
omap af <Plug>(textobj-between-a)
vmap if <Plug>(textobj-between-i)
vmap af <Plug>(textobj-between-a)
" osyo-manga/vim-textobj-multiblock
omap ib <Plug>(textobj-multiblock-i)
omap ab <Plug>(textobj-multiblock-a)
vmap ib <Plug>(textobj-multiblock-i)
vmap ab <Plug>(textobj-multiblock-a)
" Number Text Object
"-Number Text Object-----------------"{{{
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
" Highlight End-of-Line Whitespace
"-Highlight End-of-Line Whitespace---"{{{
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END
"}}}
" Save Cursor Position and Fold
"-Save Cursor Position and Fold------"{{{
augroup SaveInfo
  autocmd!
  autocmd BufWinLeave *.* silent mkview!
  autocmd BufWinEnter *.* silent loadview
augroup END

"}}}
" Count Up Function
"-Count Up Function------------------"{{{
nnoremap <silent> co :ContinuousNumber <C-a><CR>
vnoremap <silent> co :ContinuousNumber <C-a><CR>
command! -count -nargs=1 ContinuousNumber let c = col('.')|for n in range(1, <count>?<count>-line('.'):1)|exec 'normal! j' . n . <q-args>|call cursor('.', c)|endfor
"}}}
" Fold
"-Fold-------------------------------"{{{
" Leafcage/foldCC Settings
"-Leafcage/foldCC Settings-----------"{{{
NeoBundle 'LeafCage/foldCC'
set foldenable
set foldtext=foldCC#foldtext()
set foldmethod=expr
set foldlevel=100"}}}
" Color setting for Fold
"-Color setting for Fold-------------"{{{
set fillchars=vert:\|
"hi Folded gui=bold term=standout ctermbg=darkgrey ctermfg=DarkBlue guibg=Grey30 guifg=Grey80
"hi FoldColumn gui=bold term=standout ctermbg=darkgrey ctermfg=DarkBlue guibg=Grey guifg=DarkBlue
"}}}
" NeoBundle for expr
"-NeoBundle for expr-----------------"{{{
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
" Change Keymap for Fold
"-Change Keymap for Fold-------------"{{{
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
noremap [space]g :<C-u>echo FoldCCnavi()<CR>
noremap [space]d zd

nnoremap <expr>l  foldclosed('.') != -1 ? 'zo' : 'l'
"}}}
" smart_foldcloser
"-smart_foldcloser-------------------"{{{
nnoremap <silent><C-_> :<C-u>call <SID>smart_foldcloser()<CR>
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
" put foldmarker
"-put foldmarker---------------------"{{{
nnoremap <silent><C-_> :<C-u>call <SID>smart_foldcloser()<CR>
nnoremap  z[     :<C-u>call <SID>put_foldmarker(0)<CR>
nnoremap  z]     :<C-u>call <SID>put_foldmarker(1)<CR>
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
" Tab
"-Tab--------------------------------"{{{
" Mapping
"-Mapping----------------------------"{{{
nnoremap t; t
nnoremap t <Nop>
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
" Tab jump
"-Tab jump---------------------------"{{{
for n in range(1, 9)
  execute 'nnoremap <silent> t'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
"}}}
" MoveToNewTab
"-MoveToNewTab-----------------------"{{{
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
" Tab Help
"-Tab Help---------------------------"{{{
command! -nargs=? Ht  tab help <args>
command! -nargs=? Hv  vertical belowright help <args>
nnoremap <Space><Space> :<C-u>tab help<Space>
nnoremap <Space>v :<C-u>vertical belowright help<Space>
"}}}
" TabLine
"-TabLine----------------------------"{{{
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
" Create Directory Automatically
"-Create Directory Automatically-----"{{{
augroup vimrc-auto-mkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)  " {{{
    if !isdirectory(a:dir) && (a:force ||
    \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction  " }}}
augroup END
nnoremap <Leader>s :<C-u>syntax on<CR>
"}}}
" Add Endtagcomment
"-Add Endtagcomment------------------"{{{
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
" Stylus
"-Stylus-----------------------------"{{{
augroup ForStylus
  autocmd!
  autocmd BufRead,BufNewFile,BufReadPre *.styl set filetype=sass
  autocmd FileType sass     setlocal sw=2 sts=2 ts=2 et
  autocmd BufWritePost,FileWritePost *.styl silent !stylus <afile> -u nib >/dev/null
augroup END
"}}}
" CoffeeScript
"-CoffeeScript-----------------------"{{{
augroup ForCoffeeScript
  autocmd!
  autocmd BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
  autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
  autocmd BufWritePost,FileWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!
augroup END
"}}}
" Sass
"-Sass-------------------------------"{{{
function! Sass_convert()
    let scss = expand('%:p')
    let css  = substitute(scss, 'scss$', 'css', '')
    let cmd  = printf('sass --compass -I /usr/local/lib/ruby/gems/1.9.1/gems/compass-0.12.2/frameworks/compass/stylesheets/compass %s %s', scss, css)
    let res  = system(cmd)
    if res != ''
        echo res
    endif
endfunction

autocmd MyAutoCmd BufWritePost *.scss call Sass_convert() "}}}
" Plugin Settings
"-Plugin Settings--------------------"{{{
" vim-easymotion
"-vim-easymotion---------------------"{{{
let g:EasyMotion_leader_key = ';'
let g:EasyMotion_keys='hjklasdyuiopqwergtnmzxcvb;f'
"----------------------------------------
" [easymotion]s : Find Key
" [easymotion]j : Line Downward
" [easymotion]k : Line Upward
" [easymotion]n : Search
" [easymotion]N : Search backward
" [easymotion]w : Beginning of word
" [easymotion]e : End of word
" [easymotion]ge: End of word backward
"----------------------------------------

hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment
hi link EasyMotionTarget2First MoreMsg
hi link EasyMotionTarget2Second MoreMsg

" forked easymotion extention
let g:EasyMotion_special_select_line = 0
let g:EasyMotion_special_select_phrase = 0

" Disable for Unite Mapping
let g:EasyMotion_mapping_f = '_f'
let g:EasyMotion_mapping_F = '_F'
let g:EasyMotion_mapping_t = '_t'
let g:EasyMotion_mapping_T = '_T'
let g:EasyMotion_mapping_W = '_W'
let g:EasyMotion_mapping_b = '_b'
let g:EasyMotion_mapping_B = '_B'
let g:EasyMotion_mapping_E = '_E'
let g:EasyMotion_mapping_gE = '_gE'

"}}}
" Shougo/VimFiler
"-Shougo/VimFiler--------------------"{{{
let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0"}}}
" Shougo/neocomplete
"-Shougo/neocomplete-----------------"{{{
if has('lua') && v:version >= 703
    NeoBundleLazy "Shougo/neocomplete.vim", {
        \ "autoload": {
        \   "insert": 1,
        \ }}
    let g:neocomplete#enable_at_startup = 1
    let s:hooks = neobundle#get_hooks("neocomplete.vim")
    function! s:hooks.on_source(bundle)
        let g:acp_enableAtStartup = 0
        let g:neocomplet#enable_smart_case = 1
    endfunction
else
    NeoBundleLazy "Shougo/neocomplcache.vim", {
        \ "autoload": {
        \   "insert": 1,
        \ }}
    let g:neocomplcache_enable_at_startup = 1
    let s:hooks = neobundle#get_hooks("neocomplcache.vim")
    function! s:hooks.on_source(bundle)
        let g:acp_enableAtStartup = 0
        let g:neocomplcache_enable_smart_case = 1
    endfunction
endif
"}}}
" Shougo/neosnippet
"-Shougo/neosnippet------------------"{{{
NeoBundleLazy "Shougo/neosnippet.vim", {
      \ "depends": ["honza/vim-snippets"],
      \ "autoload": {
      \   "insert": 1,
      \ }}
let s:hooks = neobundle#get_hooks("neosnippet.vim")
function! s:hooks.on_source(bundle)
  " Plugin key-mappings.
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)
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
endfunction
"}}}
" thinca/vim-quickrun
"-thinca/vim-quickrun----------------""{{{
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

"}}}
" thinca/vim-template
"-thinca/vim-template----------------"{{{
NeoBundle 'thinca/vim-template'
autocmd MyAutoCmd User plugin-template-loaded call s:template_keywords()
function! s:template_keywords()
    silent! %s/<+DATE+>/\=strftime('%Y-%m-%d')/g
    silent! %s/<+FILENAME+>/\=expand('%:r')/g
endfunction

autocmd MyAutoCmd User plugin-template-loaded
    \   if search('<+CURSOR+>')
    \ |   silent! execute 'normal! "_da>'
    \ | endif"}}}
" gregsexton/gitv
"-gregsexton/gitv--------------------"{{{
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
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
"}}}
" vim-scripts/Align
"-vim-scripts/Align------------------"{{{
NeoBundle 'vim-scripts/Align'
:let g:Align_xstrlen = 3"}}}
" nathanaelkane/vim-indent-guides
"-nathanaelkane/vim-indent-guides----"{{{
NeoBundle 'nathanaelkane/vim-indent-guides'
let s:hooks = neobundle#get_hooks("vim-indent-guides")
function! s:hooks.on_source(bundle)
  let g:indent_guides_guide_size = 1
  let g:indent_guides_auto_colors = 0
  let g:indent_guides_color_change_percent = 80
  " hi IndentGuidesOdd  ctermbg=darkgrey
  " hi IndentGuidesEven ctermbg=darkgrey
  IndentGuidesEnable
endfunction
"}}}
" jedi-vim
"-jedi-vim---------------------------"{{{
NeoBundleLazy "davidhalter/jedi-vim", {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"],
      \ },
      \ "build": {
      \   "mac": "pip install jedi",
      \   "unix": "pip install jedi",
      \ }}
let s:hooks = neobundle#get_hooks("jedi-vim")
function! s:hooks.on_source(bundle)
  " jediにvimの設定を任せると'completeopt+=preview'するので
  " 自動設定機能をOFFにし手動で設定を行う
  let g:jedi#auto_vim_configuration = 0
  " 補完の最初の項目が選択された状態だと使いにくいためオフにする
  let g:jedi#popup_select_first = 0
  let g:jedi#popup_on_dot = 0
  " quickrunと被るため大文字に変更
  let g:jedi#rename_command = '<Leader>R'
  " gundoと被るため大文字に変更
  let g:jedi#goto_assignments_command = '<Leader>G'
endfunction
"}}}
" sjl/gundo
"-sjl/gundo--------------------------"{{{
NeoBundleLazy "sjl/gundo.vim", {
      \ "autoload": {
      \   "commands": ['GundoToggle'],
      \}}
nnoremap <Leader>g :<C-u>GundoToggle<CR>"}}}
" tyru/open-browser
"-tyru/open-browser------------------"{{{
" If it looks like URI, open an URI under cursor.
" Otherwise, search a word under cursor.
nmap <Leader>o <Plug>(openbrowser-smart-search)
" If it looks like URI, open selected URI.
" Otherwise, search selected word.
vmap <Leader>o <Plug>(openbrowser-smart-search)
"}}}
" tell-k/vim-browsereload-mac
"-tell-k/vim-browsereload-mac--------"{{{
"change this variables
let g:returnApp = "iTerm"
"}}}
" lightline.vim
"-lightline.vim----------------------"{{{
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
"}}}
" vim-ref
"-vim-ref----------------------------"{{{
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
"}}}
" osyo-manga/vim-anzu
"-osyo-manga/vim-anzu----------------"{{{
"nmap n <Plug>(anzu-n-with-echo)zz
"nmap N <Plug>(anzu-N-with-echo)zz
nmap n zz<Plug>(anzu-n)
nmap N zz<Plug>(anzu-N)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)

" clear status
"nnoremap <Esc><Esc> :call anzu#clear_search_status()<CR>
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>

augroup vim-anzu
" Clear hit count when nokeyinput, move window, or move tab
    autocmd!
    autocmd CursorHold,CursorHoldI,WinLeave,TabLeave * call anzu#clear_search_status()
augroup END
"}}}
" Unite
"-Unite------------------------------"{{{
nnoremap [unite] <Nop>
xnoremap [unite] <Nop>
nmap ; [unite]
xmap ; [unite]

" Source
nnoremap <silent> [unite]; :<C-u>Unite source -start-insert<CR>
" Buffer
"nnoremap [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]b :<C-u>Unite buffer file_mru bookmark<CR>
" File List
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" Recent File
"nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
" Register List
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
" Yank History
let g:unite_source_history_yank_enable = 1
nnoremap <silent> [unite]y :<C-u>Unite history/yank<CR>
" Show Mapping List
nnoremap <silent> [unite]ma :<C-u>Unite mapping<CR>
" Show Message
nnoremap <silent> [unite]me :<C-u>Unite output:message<CR>
" Jump (mnemonic : <C-o> jump to Older cursor position)
nnoremap <silent> [unite]<C-o> :<C-u>Unite change jump<CR>

" Unite Plugin Settings
"-Unite Plugin Settings--------------"{{{
" Execute help.
nnoremap [unite]h  :<C-u>Unite -start-insert help<CR>
" Execute help by cursor keyword.
nnoremap <silent> [unite]gh  :<C-u>UniteWithCursorWord help<CR>
" Outeline
nnoremap <silent> [unite]o :<C-u>Unite outline -start-insert -resume<CR>
" Fold
nnoremap <silent> [unite]<Space> :<C-u>Unite fold<CR>

"}}}
"/plugin }}}
"------------------------------------
"vim: foldmethod=marker
