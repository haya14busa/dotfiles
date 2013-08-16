set nocompatible
filetype plugin indent off

" NeoBundle "
"------------------------------------"{{{
if has('vim_starting')
    set runtimepath+=~/.vim/.bundle/neobundle.vim/
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
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Sixeight/unite-grep'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'ujihisa/vimshell-ssh'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'mattn/emmet-vim'

NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
"NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'supasorn/vim-easymotion'
NeoBundle 'othree/eregex.vim'
NeoBundle 'git://gist.github.com/411828.git', {'directory': 'endtagcomment'}
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'YankRing.vim'
NeoBundle 'css3'
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

" ColorScheme
"------------------------------------"{{{
NeoBundle 'tomasr/molokai'
NeoBundle 'altercation/vim-colors-solarized'
colorscheme molokai"}}}
"}}}

filetype plugin indent on

" release autogroup in MyAutoCmd
"------------------------------------"{{{
augroup MyAutoCmd
  autocmd!
augroup END"}}}
" Basic Options
"------------------------------------"{{{
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
set virtualedit=block
set whichwrap=b,s,h,l,[,],<,>
set wildmenu
set wrap
set wrapscan
"}}}
" Open & AutoReload .vimrc
"------------------------------------"{{{
set modeline
command! EVimrc e $MYVIMRC
command! ETabVimrc tabnew $MYVIMRC


augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

"}}}
" Useful Keymap
"------------------------------------"{{{
inoremap <silent> jj <ESC>
inoremap <silent> <C-c> <ESC>

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

cmap w!! w !sudo tee > /dev/null %

vnoremap v $h

nnoremap <Tab> %
vnoremap <Tab> %

nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

augroup SetNoPaste
  autocmd!
  autocmd InsertLeave * set nopaste
augroup END

"inoremap {} {}<LEFT>
"inoremap [] []<LEFT>
"inoremap () ()<LEFT>
"inoremap "" ""<LEFT>
"inoremap '' ''<LEFT>
"inoremap <> <><LEFT>

nnoremap <C-e> jzz
nnoremap <C-y> kzz
"}}}
" Highlight End-of-Line Whitespace
"------------------------------------"{{{
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END
"}}}
" Save Cursor Position and Fold
"------------------------------------"{{{
augroup SaveInfo
  autocmd!
  autocmd BufWinLeave *.* silent mkview!
  autocmd BufWinEnter *.* silent loadview
augroup END

"}}}
" Count Up
"------------------------------------"{{{
nnoremap <silent> co :ContinuousNumber <C-a><CR>
vnoremap <silent> co :ContinuousNumber <C-a><CR>
command! -count -nargs=1 ContinuousNumber let c = col('.')|for n in range(1, <count>?<count>-line('.'):1)|exec 'normal! j' . n . <q-args>|call cursor('.', c)|endfor
nmap ,y :YRShow<CR>"}}}
" Fold
"------------------------------------"{{{
" NeoBundle Leafcage/foldCC and Settings
"{{{
NeoBundle 'LeafCage/foldCC'
set foldenable
set foldtext=foldCC#foldtext()
set foldmethod=expr
set foldlevel=100"}}}
" Color setting for Fold
"{{{
set fillchars=vert:\|
hi Folded gui=bold term=standout ctermbg=darkgrey ctermfg=DarkBlue guibg=Grey30 guifg=Grey80
hi FoldColumn gui=bold term=standout ctermbg=darkgrey ctermfg=DarkBlue guibg=Grey guifg=DarkBlue
"}}}
" NeoBundle for expr
"{{{
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
"{{{
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
noremap [space]d zd

nnoremap <expr>l  foldclosed('.') != -1 ? 'zo' : 'l'
"}}}
" smart_foldcloser
"{{{
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
"{{{
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
"------------------------------------"{{{
" Mapping
nnoremap t; t"{{{
nnoremap t <Nop>
nnoremap tl gt
nnoremap th gT
nnoremap to :<C-u>edit<Space>
nnoremap tt :<C-u>tabnew<Space>
nnoremap <silent> td :<C-u>tabclose<CR>

nnoremap <silent> t] :buffer<CR>
nnoremap <silent> tn :bnext<CR>
nnoremap <silent> tp :bprevious<CR>
nnoremap <silent> tD :<C-u>bdelete<CR>
nnoremap <silent> tL :<C-u>buffers<CR>
"}}}
" Tab jump
for n in range(1, 9)"{{{
  execute 'nnoremap <silent> t'.n  ':<C-u>tabnext'.n.'<CR>'
endfor"}}}
" MoveToNewTab
nnoremap <silent> tm :<C-u>call MoveToNewTab()<CR>"{{{

function! MoveToNewTab()
    tab split
    tabprevious

    if winnr('$') > 1
        close
    elseif bufnr('$') > 1
        buffer #
    endif

    tabnext
endfunction"}}}
" Tab Help
"{{{
command! -nargs=? Ht  tab help <args>
command! -nargs=? Hv  vertical belowright help <args>
"}}}
" TabLine
set tabline=%!MakeTabLine()"{{{

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
" Stylus
"------------------------------------"{{{
augroup ForStylus
  autocmd!
  autocmd BufWritePost,FileWritePost *.styl silent !stylus <afile> -u nib >/dev/null
  autocmd BufRead,BufNewFile *.styl set filetype=sass
augroup END
"}}}
" CoffeeScript
"------------------------------------"{{{
augroup ForCoffeeScript
  autocmd!
  autocmd BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
  autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
  autocmd BufWritePost,FileWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!
augroup END
"}}}
" Sass
"------------------------------------"{{{
function! Sass_convert()
    let scss = expand('%:p')
    let css  = substitute(scss, 'scss$', 'css', '')
    let cmd  = printf('sass --compass -I /usr/local/lib/ruby/gems/1.9.1/gems/compass-0.12.2/frameworks/compass/stylesheets/compass %s %s', scss, css)
    let res  = system(cmd)
    if res != ''
        echo res
    endif
endfunction

au! BufWritePost *.scss call Sass_convert() "}}}
" vim-easymotion
"------------------------------------"{{{
let g:EasyMotion_leader_key = ';'
let g:EasyMotion_keys='hjklasdgyuiopqwertnmzxcvbHJKLYUIOPNMASDFG1234567890;:f'"

hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

" forked easymotion extention
let g:EasyMotion_special_select_line = 0
let g:EasyMotion_special_select_phrase = 1

"}}}
" Shougo/VimFiler
"------------------------------------"{{{
let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0"}}}
" Shougo/neocomplete
"------------------------------------"{{{
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
"------------------------------------"{{{
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
"------------------------------------""{{{
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
"------------------------------------"{{{
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
"------------------------------------"{{{
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
autocmd FileType gitv call s:my_gitv_settings()
function! s:my_gitv_settings()
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

autocmd FileType git setlocal nofoldenable foldlevel=0
function! s:toggle_git_folding()
  if &filetype ==# 'git'
    setlocal foldenable!
  endif
endfunction
"}}}
" vim-scripts/Align
"------------------------------------"{{{
NeoBundle 'vim-scripts/Align'
:let g:Align_xstrlen = 3"}}}
" nathanaelkane/vim-indent-guides
"------------------------------------"{{{
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
"------------------------------------"{{{
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
  " quickrunと被るため大文字に変更
  let g:jedi#rename_command = '<Leader>R'
  " gundoと被るため大文字に変更
  let g:jedi#goto_command = '<Leader>G'
endfunction
"}}}
" sjl/gundo
"------------------------------------"{{{
NeoBundleLazy "sjl/gundo.vim", {
      \ "autoload": {
      \   "commands": ['GundoToggle'],
      \}}
nnoremap <Leader>g :GundoToggle<CR>"}}}
" tyru/open-browser
"------------------------------------"{{{
" If it looks like URI, open an URI under cursor.
" Otherwise, search a word under cursor.
nmap <Leader>o <Plug>(openbrowser-smart-search)
" If it looks like URI, open selected URI.
" Otherwise, search selected word.
vmap <Leader>o <Plug>(openbrowser-smart-search)
"}}}
" tell-k/vim-browsereload-mac
"------------------------------------"{{{
"change this variables
let g:returnApp = "iTerm"
"}}}
"------------------------------------
"vim: foldmethod=marker
