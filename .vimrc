" haya14busa's vimrc
" Author: haya14busa
" URL: http://haya14busa.com
" Source: https://github.com/haya14busa/dotfiles/
" Last Modified: 10 Feb 2014.
"=============================================================
"     __                     _____ __  __
"    / /_  ____ ___  ______ <  / // / / /_  __  ___________ _
"   / __ \/ __ `/ / / / __ `/ / // /_/ __ \/ / / / ___/ __ `/
"  / / / / /_/ / /_/ / /_/ / /__  __/ /_/ / /_/ (__  ) /_/ /
" /_/ /_/\__,_/\__, /\__,_/_/  /_/ /_.___/\__,_/____/\__,_/
"             /____/
"
"=============================================================

" Startup {{{======================
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

" release autogroup in MyVimrc {{{
augroup MyVimrc
  autocmd!
augroup END
" https://github.com/rhysd/dotfiles/blob/master/vimrc
command! -nargs=* Autocmd autocmd MyVimrc <args>
command! -nargs=* AutocmdFT autocmd MyVimrc FileType <args>
function! s:hl_my_autocmd()
  highlight def link myVimAutocmd vimAutoCmd
  syntax match vimAutoCmd /\<\(Autocmd\|AutocmdFT\)\>/
endfunction
Autocmd VimEnter,WinEnter,ColorScheme *vimrc call s:hl_my_autocmd()
"}}}

" Echo startup time on start {{{
if has('vim_starting') && has('reltime')
  " Shell: vim --startuptime {filename} -q; vim {filename}
  " vim --cmd 'profile start profile.txt' --cmd 'profile file $HOME/.vimrc' +q && vim profile.txt
  let s:startuptime = reltime()
    Autocmd VimEnter * let s:startuptime = reltime(s:startuptime) | redraw
    \ | echomsg 'startuptime: ' . reltimestr(s:startuptime)
endif
"}}}
"}}}

" NeoBundle {{{====================

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
command! -nargs=1
\   MyNeoBundleLazy
\   NeoBundle <args>, {
\       "base" : "~/.vim/myplugin/",
\       "type" : "nosync",
\       "lazy" : 1,
\   }
"}}}
"}}}

" Synthesis {{{
" Unite {{{
NeoBundleLazy 'Shougo/unite.vim'

" NeoBundleLazy 'tsukkee/unite-help'
NeoBundleLazy 'Shougo/unite-help'
NeoBundleLazy 'ujihisa/unite-colorscheme'
NeoBundleLazy 'Shougo/unite-outline'
NeoBundleLazy 'osyo-manga/unite-fold'
NeoBundleLazy 'kmnk/vim-unite-giti'
NeoBundleLazy 'thinca/vim-unite-history'
NeoBundleLazy 'osyo-manga/unite-quickfix'
"}}}
NeoBundleLazy 'Shougo/vimfiler.vim'
NeoBundleLazy 'Shougo/vimshell.vim'

"}}}

" Writing {{{
" Shougo/neocomplete {{{
if has('lua') && v:version >= 703
    NeoBundleLazy 'Shougo/neocomplete.vim'
else
    NeoBundleLazy 'Shougo/neocomplcache.vim'
endif
"}}}
NeoBundleLazy 'Shougo/neosnippet.vim'
MyNeoBundle 'haya14busa-snippets'
NeoBundleLazy 'mattn/emmet-vim'
NeoBundleLazy 'deris/vim-rengbang' " vim plugin for sequencial numbering with pattern
NeoBundleLazy 'h1mesuke/vim-alignta'
NeoBundleLazy 'autodate.vim'
NeoBundleLazy 'tyru/caw.vim' " sophisticated comment plugin
"}}}

" Development {{{
NeoBundleLazy 'thinca/vim-quickrun'
NeoBundleLazy 'scrooloose/syntastic'
NeoBundleLazy 'koron/codic-vim' " Codic vim plugin
NeoBundleLazy 'rhysd/unite-codic.vim' " A unite.vim source for codic-vim.
"}}}

" Library {{{
NeoBundle 'Shougo/vimproc'
NeoBundle 'mattn/webapi-vim'
NeoBundleLazy 'vim-jp/vital.vim' " A comprehensive Vim utility functions for Vim plugins
NeoBundle 'osyo-manga/vital-over'
"}}}

" Document {{{
NeoBundleLazy 'thinca/vim-ref'
NeoBundle 'mojako/ref-sources.vim'
NeoBundle 'tokuhirom/jsref'
NeoBundle 'mustardamus/jqapi'
NeoBundle 'soh335/vim-ref-jquery'
"}}}

" Extend Basic Vim Commands {{{
" Matching
NeoBundle 'matchit.zip'
" Yank
NeoBundleLazy 'LeafCage/yankround.vim'
" Undo
NeoBundleLazy 'sjl/gundo.vim'
" Visual mode
NeoBundleLazy 'kana/vim-niceblock'
" Search
NeoBundleLazy 'thinca/vim-visualstar'
NeoBundleLazy 'osyo-manga/vim-anzu'
NeoBundleLazy 'osyo-manga/vim-over' " :substitute preview
"}}}

" Motion {{{
MyNeoBundleLazy 'vim-easymotion'
MyNeoBundleLazy 'vim-easyoperator-line'
MyNeoBundleLazy 'vim-easyoperator-phrase'
MyNeoBundleLazy 'vim-lazy-lines'
NeoBundleLazy 'rhysd/accelerated-jk'
"}}}

" Text Object {{{
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
NeoBundle 'tpope/vim-repeat'

" Operator
NeoBundleLazy 'kana/vim-operator-user'
NeoBundleLazy 'kana/vim-operator-replace'
"NeoBundle 'rhysd/vim-operator-surround'

"}}}

" Git {{{
NeoBundle 'tpope/vim-fugitive'
NeoBundleLazy 'gregsexton/gitv'
NeoBundle 'mhinz/vim-signify'

NeoBundleLazy 'thinca/vim-openbuf'
NeoBundleLazy 'Shougo/vim-vcs', {
      \ 'depends' : 'thinca/vim-openbuf',
      \ 'autoload' : {'commands' : 'Vcs'},
      \ }
"}}}

" UI {{{
NeoBundle 'itchyny/lightline.vim'
NeoBundleLazy 'nathanaelkane/vim-indent-guides'
NeoBundleLazy 't9md/vim-quickhl' " quickly highlight <cword> or visually selected word
" }}}

" Utility {{{
" NeoBundle 'kana/vim-submode' " Vim plugin: Create your own submodes
NeoBundle 'thinca/vim-submode', {
      \ 'rev' : 'my-master',
      \ 'name' : 'vim-submode',
      \ }
NeoBundleLazy 'tyru/open-browser.vim'
"}}}

" Application {{{
NeoBundleLazy 'itchyny/calendar.vim' " A calendar application for Vim
"}}}

" Memo {{{
NeoBundleLazy 'mattn/gist-vim'
NeoBundleLazy 'Shougo/junkfile.vim' " Create temporary file for memo, testing, ...
"}}}

" Filetype {{{
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'wavded/vim-stylus'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'othree/html5.vim'
NeoBundle 'plasticboy/vim-markdown'

" Python {{{
NeoBundleLazy 'davidhalter/jedi-vim'
NeoBundleLazy 'heavenshell/vim-pydocstring'
NeoBundleLazy 'tell-k/vim-autopep8'
NeoBundleLazy 'hynek/vim-python-pep8-indent'
"}}}

" Scheme {{{
NeoBundleLazy 'aharisu/vim_goshrepl'
NeoBundleLazy 'kien/rainbow_parentheses.vim'
" }}}
"}}}

" Fold {{{
NeoBundle 'LeafCage/foldCC'
NeoBundleLazy 'tmhedberg/SimpylFold' "for Python
NeoBundleLazy 'vim-scripts/CSS-one-line--multi-line-folding'
"}}}

" Japanese {{{
" NeoBundleLazy 'haya14busa/vim-migemo' "use migemo of easymotion
NeoBundle 'vim-jp/vimdoc-ja' " A project which translate Vim documents into Japanese.
" NeoBundle 'tyru/skk.vim'
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
NeoBundle 'cocopon/iceberg.vim' " A dark color scheme for Vim, came from Antarctica
NeoBundle 'reedes/vim-colors-pencil'
"}}}

" Vim script {{{
MyNeoBundle 'vim-helloworld'
NeoBundle 'mattn/learn-vimscript'
NeoBundleLazy 'thinca/vim-prettyprint'
NeoBundleLazy 'tyru/capture.vim' " Show Ex command output in buffer
NeoBundleLazy 'kana/vim-vspec' " Vim plugin: Testing framework for Vim script
NeoBundleLazy 'thinca/vim-editvar' " Edits vim variable in buffer.
NeoBundleLazy 'tyru/restart.vim' " Restart your gVim
NeoBundleLazy 'thinca/vim-ft-help_fold', {
      \ 'filetypes' : 'help'
      \ }
"}}}

" Others {{{
NeoBundleLazy 'pentie/VimRepress' "WordPress
NeoBundleLazy 'basyura/TweetVim' " twitter client for vim
NeoBundleLazy 'basyura/twibill.vim' " twitter api wrapper like a Rubytter.rb ... maybe
NeoBundleLazy 'basyura/J6uil.vim'
NeoBundle 'bohrshaw/vim-vimperator-syntax'
NeoBundleLazy 'supermomonga/thingspast.vim'
NeoBundleLazy 'rbtnn/puyo.vim'
NeoBundleLazy 'thinca/vim-scouter'
"}}}

filetype plugin indent on

" END NeoBundle}}}

" Vim Setup  {{{====================

" Basic Options {{{
if exists('&ambiwidth')
" For Ubuntu: gnome-terminal, terminator, guake
"   /bin/sh -c "VTE_CJK_WIDTH=1 terminator -m"
"   /bin/sh -c "VTE_CJK_WIDTH=1 gnome-terminal --disable-factory"
"   /bin/sh -c "VTE_CJK_WIDTH=1 guake"
"   https://gist.github.com/sgk/5991138
  set ambiwidth=double "Use twice the width of ASCII characters for Multibyte
endif
set autoread "Automatically read file again which has been changed outside of Vim
set backspace=indent,eol,start "Working of <BS>,<Del>,CTRL-W,CTRL-U
if has('unnamedplus')
  set clipboard& clipboard=unnamedplus "uses the clipboard register '+'
else
  set clipboard& clipboard+=unnamed,autoselect
endif
set cmdheight=1 "Number of screen lines to use for the command-line
set cmdwinheight=5 "Number of screen lines to use for the command-line window
set display=lastline "Display as much as possible of the last line
set encoding=utf-8 "Sets the character encoding used inside Vim
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis "A list of character encodings
set fileformats=unix,dos,mac "This gives the end-of-line (<EOL>) formats
set formatoptions-=r,o " Turn off Automatically comment out when line break
set grepprg=internal "Program to use for the :grep command
set helpheight=12 " Minimal initial height of the help window
set hidden "Display another buffer when current buffer isn't saved.
set history=1024 "Amount of Command history
set infercase "Ignore case on insert completion.
set keywordprg=:help " Open Vim internal help by K command
set laststatus=2 "Always display statusline
set matchpairs& matchpairs+=<:> "Characters that form pairs
set matchtime=3 "Tenths of a second to show the matching paren
set modeline "Set Vim local buffer option to specific file
set noerrorbells "Don't ring the bell for error messages
set novisualbell "Don't use visual bell instead of beeping
set nrformats-=octal "Bases Vim will consider for numbers(Ctrl-a,Ctrl-x)
set number "Print the line number in front of each line
set ruler "Show the line and column number of the cursor position
set shortmess& shortmess+=I "Don't give the message when starting Vim :intro
set showcmd "Show (partial) command in the last line of the screen
set showmatch "Briefly jump to the matching one
set spelllang=en,cjk "Spell checking language
set textwidth=0 "Maximum width of text that is being inserted
set viewoptions=cursor,folds "Changes the effect of the :mkview command
set viminfo+=! "Store information when you exit Vim for later
set virtualedit=block "Cursor can be positioned virtually when Visual-block mode
set whichwrap=b,s,h,l,[,],<,> "Allow specified keys to move to the previous/next line
set wrap "Lines longer than the width of the window will wrap
set wrapscan "Searches wrap around the end of the file

" Tab Basic Settings {{{
set autoindent "Copy indent from current line when starting a new line
set expandtab "Use the appropriate number of spaces to insert a <Tab>
set shiftround "Round indent to multiple of 'shiftwidth'
set shiftwidth=4 "Number of spaces to use for each step of (auto)indent
set softtabstop=4 "Number of spaces that a <Tab> counts for while editing operations
set tabstop=4 "Number of spaces that a <Tab> in the file counts for
"}}}

" Search Basic Settings {{{
set incsearch "Incremental searching
set ignorecase "Ignore case in search patterns
set smartcase "Override the ignorecase option if the pattern contains upper case
set nohlsearch "Highlight search patterns
"}}}

" Backup Settings {{{
"Don't create backup
set nobackup "Don't make a backup before overwriting a file
set nowritebackup "Don't make a backup before overwriting a file
set backupdir-=. "List of directories for the backup file
"}}}

" Swap Settings {{{
set swapfile "Use a swapfile for the buffer
set directory-=. "List of directory names for the swap file
"}}}

" Undo Basic {{{
if has('persistent_undo')
  set undofile "Automatically saves undo history
  set undoreload=1000 "Save the whole buffer for undo when reloading it
  let &undodir=&directory "List of directory names for undo files
endif
"}}}

" Wildmenu {{{
set wildmenu " Command line autocompletion
set wildmode=list:longest,full "Shows all the options

set wildignore& " A file that matches with one of these patterns is ignored
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.bak,*.?~,*.??~,*.???~,*.~      " Backup files
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.jar                            " Java archives
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.stats                          " Pylint stats

" }}}

" Fold Basic Settings "{{{
set foldenable "Enable fold
set foldlevel=100 "Folds with a higher level will be closed
"}}}

" Colorscheme {{{
if has('vim_starting')
  syntax enable
  set background=dark
  set t_Co=256
  if &t_Co < 256
    colorscheme default
  else
    try
      colorscheme molokai
    catch
      colorscheme desert
    endtry
  endif
endif
"}}}

"}}}

" Open & AutoReload .vimrc {{{
command! EVimrc e $MYVIMRC
command! ETabVimrc tabnew $MYVIMRC
command! SoVimrc source $MYVIMRC
Autocmd BufWritePost *vimrc source $MYVIMRC
Autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
"}}}

" Close Vim help by q {{{
AutocmdFT help nnoremap <buffer> q <C-w>c
AutocmdFT help nnoremap <buffer> ;q q
AutocmdFT help nnoremap <buffer> Q q
"}}}

" Useful Keymaps{{{

" Escape Keymaps {{{
inoremap <silent> jj <ESC>
inoremap <silent> <C-c> <ESC>
"}}}

" Breakline with Enter {{{
nnoremap <CR> o<ESC>
"}}}

" For Undo Revision, Break Undo Sequence "{{{
inoremap <CR> <C-]><C-G>u<CR>

inoremap <C-h> <C-g>u<C-h>
inoremap <BS> <C-g>u<BS>
inoremap <Del> <C-g>u<Del>
inoremap <C-d> <C-g>u<Del>
inoremap <C-w> <C-g>u<C-w>
inoremap <C-u> <C-g>u<C-u>

"}}}

" Motion {{{

" Normal Mode {{{
nnoremap h <Left>

nnoremap j gj
vnoremap j gj
nnoremap gj j
vnoremap gj j

nnoremap k gk
vnoremap k gk
nnoremap gk k
vnoremap gk k

" nnoremap l <Right>
" -> fold

nnoremap - $
"}}}

" Insert & Comandline Mode "{{{
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

" Scroll {{{
nnoremap <C-e> <C-e>j
nnoremap <C-y> <C-y>k
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz

nnoremap <Down> <C-e><C-e><C-e><C-e><C-e><C-e><C-e><C-e><C-e><C-e>
nnoremap <Up>   <C-y><C-y><C-y><C-y><C-y><C-y><C-y><C-y><C-y><C-y>
vnoremap <Down> <C-e><C-e><C-e><C-e><C-e><C-e><C-e><C-e><C-e><C-e>
vnoremap <Up>   <C-y><C-y><C-y><C-y><C-y><C-y><C-y><C-y><C-y><C-y>

nnoremap <Space>j <C-f>zz
nnoremap <Space>k <C-b>zz
vnoremap <Space>j <C-f>zz
vnoremap <Space>k <C-b>zz
"}}}

"}}}

" Paste in insert and Command-line mode"{{{
inoremap <C-y><C-y> <C-r>+
cnoremap <C-y><C-y> <C-r>+
"}}}

" Vertical Paste"{{{
vnoremap <C-p> I<C-r>+<ESC><ESC>
"}}}

" Select pasted text {{{
nnoremap <expr>gp '`['.strpart(getregtype(),0,1).'`]'
"}}}

" Command line History {{{
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
"}}}

" Save as root"{{{
cnoremap w!! w !sudo tee > /dev/null %
"}}}

" From the cursor to the end of line {{{
" Select from cursor position to end of line
" vnoremap v $h " -> D,C,Y
" Yank from cursor position to end of line
nnoremap Y y$
"}}}

" Spelling Keymaps {{{
" turn on the spell checking and set the English language
nnoremap <Leader>sp :set spell!<CR>
" }}}

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
" clear status
nnoremap <silent><Esc><Esc>
      \ :<C-u>nohlsearch<CR>

" Automatically escape '/'
cnoremap <expr>/ getcmdtype() == '/' ? '\/' : '/'

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
" U
" S
" X
"}}}

" set nopaste when Insertleave"{{{
Autocmd InsertLeave * set nopaste
"}}}

" Show invisibles {{{

" Shortcut to rapidly toggle `set list`
nnoremap <silent> <Leader>l :<C-u>set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"Invisible character colors
hi NonText guifg=#4a4a59
hi SpecialKey guifg=#4a4a59

" Highlight End-of-Line & Zenkaku Whitespace {{{
function! s:hl_trailing_spaces() "{{{
  highlight! link TrailingSpaces Error
  syntax match TrailingSpaces containedin=ALL /\s\+$/
endfunction "}}}
function! s:hl_zenkaku() "{{{
  highlight link ZenkakuSpace Error
  syntax match ZenkakuSpace containedin=ALL /　/
endfunction "}}}

Autocmd VimEnter,WinEnter,ColorScheme * call s:hl_trailing_spaces()
Autocmd VimEnter,WinEnter,ColorScheme * call s:hl_zenkaku()
"}}}

"}}}

" Restore last cursor position when open a file {{{
Autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
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
" </div><!-- /div#hoge.fuga -->
"}}}

function! Endtagcomment() "{{{
    let reg_save = @@

    try
        silent normal! vaty
    catch
        execute "normal! \<Esc>"
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

    execute "normal! `>va<\<Esc>`<"

    let comment = s:endtagcommentFormat
    let comment = substitute(comment, '{%tag_name}', tag_name, 'g')
    let comment = substitute(comment, '{%id}', id, 'g')
    let comment = substitute(comment, '{%class}', class, 'g')
    let @@ = comment

    normal! %""p

    let @@ = reg_save
endfunction "}}}

let s:endtagcommentFormat = '<!-- /{%tag_name}{%id}{%class} -->'
nnoremap ,t :<C-u>call Endtagcomment()<CR>

"}}}

" Fold {{{

" Change Keymap for Fold {{{
noremap [fold] <nop>
nmap <Space> [fold]
vmap <Space> [fold]

noremap [fold]j zj
noremap [fold]k zk
noremap [fold]n ]z
noremap [fold]p [z
noremap <silent>[fold]h :<C-u>call <SID>smart_foldcloser()<CR>
noremap [fold]l zo
noremap [fold]L zO
noremap [fold]a za
noremap [fold]m zM
noremap [fold]i zMzvzz
noremap [fold]r zR
noremap [fold]f zf
noremap [fold]d zd

nnoremap <expr>l  foldclosed('.') != -1 ? 'zo' : '<Right>'

nnoremap  [fold][     :<C-u>call <SID>put_foldmarker(0)<CR>
nnoremap  [fold]]     :<C-u>call <SID>put_foldmarker(1)<CR>
"}}}

" Leafcage/foldCC {{{
if neobundle#tap('foldCC')

  call neobundle#config({})

  function! neobundle#tapped.hooks.on_source(bundle)
  endfunction

  set foldmethod=marker
  set foldtext=FoldCCtext()
  set foldcolumn=0
  set fillchars=vert:\|

  noremap [fold]g :<C-u>echo FoldCCnavi()<CR>

  call neobundle#untap()
endif " }}}
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

" Tab {{{

" Tab KeyMaps {{{
nnoremap t; t
nmap t <nop>
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
" http://www.sopht.jp/blog/index.php?/archives/445-vim.html
nnoremap <silent> tm :<C-u>call <SID>MoveToNewTab()<CR>
function! s:MoveToNewTab()
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

" Use command-line window {{{
nnoremap : q:
vnoremap : q:

Autocmd CmdwinEnter * call s:init_cmdwin()
function! s:init_cmdwin() "{{{
  silent! 1,$-20 delete _ | call cursor('$', 0)

  let b:neocomplete_sources_list = ['vim_complete']

  nnoremap <silent><buffer>q          :<C-u>quit<CR>
  nnoremap <silent><buffer><CR>       <CR>
  inoremap <silent><buffer><expr><CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
  nnoremap <silent><buffer><TAB>      :<C-u>quit<CR>

  nnoremap <silent><buffer><Space> <CR>q:
  nnoremap <silent><buffer>;;      <CR>q:
  inoremap <silent><buffer>;;      <CR>q:

  " Completion.
  inoremap <silent><buffer><expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <silent><buffer><expr><C-p>  pumvisible() ? "\<C-p>" : "\<C-o>0\<UP>"
  inoremap <silent><buffer><expr><C-n>  pumvisible() ? "\<C-n>" : "\<C-o>0\<DOWN>"

  startinsert!
endfunction "}}}
"}}}

" Create Directory Automatically {{{
Autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
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

" Update diff
Autocmd InsertLeave * if &l:diff | diffupdate | endif
" Spell check in git commit
AutocmdFT gitcommit setlocal nofoldenable spell
" Set textwidth
AutocmdFT gitcommit setlocal textwidth=72
" Enter Insert mode in git commit
Autocmd VimEnter COMMIT_EDITMSG if getline(1) == '' | execute 1 | startinsert | endif

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
Autocmd BufRead,BufNewFile,BufReadPre *.styl setlocal filetype=sass
AutocmdFT sass     setlocal sw=2 sts=2 ts=2 et
Autocmd BufWritePost,FileWritePost *.styl silent !stylus <afile> -u nib >/dev/null
"}}}

" CoffeeScript {{{
Autocmd BufRead,BufNewFile,BufReadPre *.coffee   setlocal filetype=coffee
AutocmdFT coffee     setlocal sw=2 sts=2 ts=2 et
Autocmd BufWritePost,FileWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!
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

Autocmd BufWritePost *.scss call Sass_convert()
"}}}

" Markdown {{{
Autocmd BufRead,BufNewFile *.md  set filetype=markdown
AutocmdFT markdown setlocal sw=2 sts=2 ts=2 et
"}}}

"}}}

" end vim setup}}}

" Secret {{{=======================
if filereadable(expand('~/.secret_vimrc'))
  execute 'source' expand('~/.secret_vimrc')
endif
" }}}

" Plugin settings {{{==============

" " author/sample {{{
" if neobundle#tap('plugin-name')
"   " Config {{{
"   call neobundle#config({
"         \   'autoload' : {
"         \     'unite_sources' : [
"         \       'help',
"         \     ],
"         \   }
"         \ })
"   " }}}
"   function! neobundle#tapped.hooks.on_source(bundle) "{{{
"   endfunction "}}}
"   " Setting {{{
"   "}}}
"   call neobundle#untap()
" endif
" " }}}

" shougo/vimproc "{{{
if neobundle#tap('vimproc')
  call neobundle#config({
       \ 'build' : {
       \     'windows' : 'make -f make_mingw32.mak',
       \     'cygwin'  : 'make -f make_cygwin.mak',
       \     'mac'     : 'make -f make_mac.mak',
       \     'unix'    : 'make -f make_unix.mak',
       \    },
       \ })
  call neobundle#untap()
endif
"}}}

" Shougo/unite.vim"{{{
if neobundle#tap('unite.vim')
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
    " Open plugin directory by t
    call unite#custom#alias('directory', 'tabopen', 'tabvimfiler')
  endfunction "}}}

  " Unite {{{
  nnoremap [unite] <Nop>
  xnoremap [unite] <Nop>
  nmap ; [unite]
  xmap ; [unite]

  " Source
  nnoremap <silent> [unite]u :<C-u>Unite source -vertical -silent -start-insert<CR>
  " Buffer
  nnoremap <silent> [unite]b :<C-u>Unite -silent buffer file_mru bookmark<CR>
  " File List
  nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -silent -buffer-name=files file<CR>
  " Register List
  nnoremap <silent> [unite]R :<C-u>Unite -silent -buffer-name=register register<CR>
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
  nnoremap <silent> [unite]gr :<C-u>Unite -silent -no-quit grep<CR>
  " Line
  nnoremap <silent> g/ :<C-u>Unite -buffer-name=search line -start-insert -no-quit<CR>
  "-Unite Plugin Settings--------------"{{{
  " Execute help.
  nnoremap <silent> [unite]gh  :<C-u>Unite -silent -start-insert -buffer-name=help help<CR>
  " Outeline
  nnoremap <silent> [unite]o :<C-u>Unite -silent outline -vertical -winwidth=40 -no-start-insert<CR>
  " Fold
  nnoremap <silent> [unite]z :<C-u>Unite -silent fold -vertical -winwidth=40 -no-start-insert<CR>
  " Unite Beautiful Atack
  nnoremap <silent> [unite]C :<C-u>Unite -auto-preview colorscheme<CR>
  "}}}
  "}}}

  call neobundle#untap()
endif
"}}}

" unite-sources {{{
" Shougo/unite-help {{{
if neobundle#tap('unite-help')
  call neobundle#config({
        \   'autoload' : {
        \     'unite_sources' : [
        \       'help'
        \     ],
        \   }
        \ })
  call neobundle#untap()
endif
"}}}
" ujihisa/unite-colorscheme {{{
if neobundle#tap('unite-colorscheme')
  call neobundle#config({
        \   'autoload' : {
        \     'unite_sources' : [
        \       'colorscheme'
        \     ],
        \   }
        \ })
  command! -nargs=* BeautifulAttack Unite colorscheme -auto-preview -winheight=3
  call neobundle#untap()
endif
"}}}
" Shougo/unite-outline {{{
if neobundle#tap('unite-outline')
  call neobundle#config({
        \   'autoload' : {
        \     'unite_sources' : [
        \       'outline'
        \     ],
        \   }
        \ })
  call neobundle#untap()
endif
"}}}
" osyo-manga/unite-fold {{{
if neobundle#tap('unite-fold')
  call neobundle#config({
        \   'autoload' : {
        \     'unite_sources' : [
        \       'fold'
        \     ],
        \   }
        \ })
  call neobundle#untap()
endif
"}}}
" kmnk/vim-unite-giti {{{
if neobundle#tap('vim-unite-giti')
  call neobundle#config({
        \   'autoload' : {
        \     'unite_sources' : [
        \       'giti'
        \     ],
        \   }
        \ })
  call neobundle#untap()
endif
"}}}
" thinca/vim-unite-history {{{
if neobundle#tap('vim-unite-history')
  call neobundle#config({
        \   'autoload' : {
        \     'unite_sources' : [
        \       'history'
        \     ],
        \   }
        \ })
  call neobundle#untap()
endif
"}}}
" osyo-manga/unite-quickfix {{{
if neobundle#tap('unite-quickfix')
  call neobundle#config({
        \   'autoload' : {
        \     'unite_sources' : [
        \       'quickfix'
        \     ],
        \   }
        \ })
  call neobundle#untap()
endif
"}}}
" End unite-sources }}}

" Shougo/VimFiler {{{
if neobundle#tap('vimfiler.vim')
  " Config {{{
  call neobundle#config({
        \   'autoload' : {
        \    'commands' : [
        \       { 'name' : 'VimFiler',
        \         'complete' : 'customlist,vimfiler#complete' },
        \       { 'name' : 'VimFilerTab',
        \         'complete' : 'customlist,vimfiler#complete' },
        \       { 'name' : 'VimFilerBufferDir',
        \         'complete' : 'customlist,vimfiler#complete' },
        \       { 'name' : 'VimFilerExplorer',
        \         'complete' : 'customlist,vimfiler#complete' },
        \       { 'name' : 'Edit',
        \         'complete' : 'customlist,vimfiler#complete' },
        \       { 'name' : 'Write',
        \         'complete' : 'customlist,vimfiler#complete' },
        \       'Read', 'Source'],
        \    'mappings' : '<Plug>(vimfiler_',
        \    'explorer' : 1,
        \   }
        \ })
  " }}}
  function! neobundle#tapped.hooks.on_source(bundle) "{{{
    hi link exrenameModified Normal
    let g:vimfiler_as_default_explorer=1

    AutocmdFT vimfiler call g:my_vimfiler_settings()

    function! g:my_vimfiler_settings()
      nmap <buffer>' <Plug>(vimfiler_toggle_mark_current_line)
      xmap <buffer>' <Plug>(vimfiler_toggle_mark_selected_lines)
      map <buffer> t :call vimfiler#mappings#do_action('tabopen')<CR>
    endfunction
  endfunction "}}}

  let g:vimfiler_safe_mode_by_default=0
  nnoremap <silent> ;vf :VimFilerBufferDir -split -simple -no-quit -winwidth=32<CR>
  nnoremap <silent> ;vt :VimFilerBufferDir -tab<CR>

  call neobundle#untap()
endif
"}}}

" Shougo/vimshell.vim {{{
if neobundle#tap('vimshell.vim')
  call neobundle#config({
        \   'depends': ['Shougo/vimproc'],
        \   'autoload' : {
        \       'commands' : [
        \       { 'name' : 'VimShell',
        \         'complete' : 'customlist,vimshell#complete'},
        \       { 'name' : 'VimShellTab',
        \         'complete' : 'customlist,vimshell#complete'},
        \       { 'name' : 'VimShellBufferDir',
        \         'complete' : 'customlist,vimshell#complete'},
        \         'VimShellExecute', 'VimShellInteractive',
        \         'VimShellTerminal', 'VimShellPop'],
        \   }
        \ })
  function! neobundle#tapped.hooks.on_source(bundle)
    " Use current directory as vimshell prompt.
    let g:vimshell_prompt_expr =
              \ 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
    let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '
    let g:vimshell_right_prompt = 'vcs#info("(%s)-[%b]%p", "(%s)-[%b|%a]%p")'
  endfunction

  call neobundle#untap()
endif
"}}}

" Shougo/neosnippet.vim "{{{
if neobundle#tap('neosnippet.vim')
  call neobundle#config({
        \   'autoload' : {
        \     'insert' : 1,
        \     'filetypes' : 'neosnippet',
        \     'unite_sources' : [
        \       'snippet', 'neosnippet/user', 'neosnippet/runtime'
        \       ],
        \   }
        \ })

  function! neobundle#tapped.hooks.on_source(bundle) "{{{
    " For snippet_complete marker.
    if has('conceal')
      set conceallevel=2 concealcursor=i
    endif
    " Enable snipMate compatibility feature.
    let g:neosnippet#enable_snipmate_compatibility = 1
    " Remove snippets marker automatically
    Autocmd InsertLeave * :NeoSnippetClearMarkers
  endfunction "}}}

  " haya14busa-snippets {{{
  let g:neosnippet#snippets_directory=$HOME.'/.vim/myplugin/haya14busa-snippets/neosnippets'
  "}}}

  " SuperTab like snippets behavior.
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \: pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \: "\<TAB>"

  " Plugin key-mappings.
  imap <C-k> <Plug>(neosnippet_expand_or_jump)
  smap <C-k> <Plug>(neosnippet_expand_or_jump)
  xmap <C-k> <Plug>(neosnippet_expand_target)
  xmap <C-l> <Plug>(neosnippet_start_unite_snippet_target)

  call neobundle#untap()
endif
"}}}

" Shougo/neocomplete.vim"{{{
if neobundle#tap('neocomplete.vim')
  call neobundle#config({
        \   'autoload' : {
        \     'insert' : 1,
        \   }
        \ })
  function! neobundle#tapped.hooks.on_source(bundle)
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#enable_camel_case = 1
    let g:neocomplete#enable_underbar_completion = 1

    " Use fuzzy completion.
    let g:neocomplete#enable_fuzzy_completion = 1

    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    " Set auto completion length.
    let g:neocomplete#auto_completion_start_length = 2
    " Set manual completion length.
    let g:neocomplete#manual_completion_start_length = 0
    " Set minimum keyword length.
    let g:neocomplete#min_keyword_length = 3

    let g:neocomplete#disable_auto_select_buffer_name_pattern =
          \ '\[Command Line\]'

    " Enable omni completion.
    AutocmdFT css setlocal omnifunc=csscomplete#CompleteCSS
    AutocmdFT html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    AutocmdFT javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    AutocmdFT xml setlocal omnifunc=xmlcomplete#CompleteTags
    AutocmdFT python setlocal omnifunc=jedi#completions

    if !exists('g:neocomplete#force_omni_input_patterns')
      let g:neocomplete#force_omni_input_patterns = {}
    endif
    let g:jedi#auto_vim_configuration = 0
    let g:neocomplete#force_omni_input_patterns.python =
    \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
  endfunction
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1

  " <C-f>, <C-b>: page move.
  inoremap <expr><C-f>  pumvisible() ? "\<PageDown>" : "\<Right>"
  inoremap <expr><C-b>  pumvisible() ? "\<PageUp>"   : "\<Left>"
  " <C-y>: paste.
  " inoremap <expr><C-y>  pumvisible() ? neocomplete#close_popup() :  "\<C-r>\""
  " <C-e>: close popup.
  inoremap <expr><C-e>  pumvisible() ? neocomplete#cancel_popup() : "\<End>"

  call neobundle#untap()
endif
"}}}

" Shougo/neocomplcache.vim"{{{
if neobundle#tap('neocomplcache.vim')
  call neobundle#config({
        \   'autoload' : {
        \     'insert' : 1,
        \   }
        \ })
  function! neobundle#tapped.hooks.on_source(bundle)
      let g:neocomplcache_enable_smart_case = 1
  endfunction
  call neobundle#untap()
endif
"}}}

" thinca/vim-quickrun {{{
if neobundle#tap('vim-quickrun')
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

  let g:quickrun_config = {
  \   "_" : {
  \       "runner" : "vimproc",
  \       "runner/vimproc/updatetime" : 60
  \   },
  \}
  if executable('pyflakes')
    let g:quickrun_config['syntax/python'] = {
                \ 'command' : 'pyflakes',
                \ 'exec' : '%c %o %s:p',
                \ 'runner' : 'vimproc',
                \ 'errorformat' : '%f:%l:%m',
                \ }
    Autocmd BufWritePost *.py QuickRun -outputter quickfix -type syntax/python
  endif

  call neobundle#untap()
endif
"}}}

" thinca/vim-scouter"{{{
if neobundle#tap('vim-scouter')
  call neobundle#config({
        \   'autoload' : {
        \     'commands' : 'Scouter',
        \   }
        \ })
  call neobundle#untap()
endif
"}}}

" thinca/vim-ref {{{
if neobundle#tap('vim-ref')
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
endif
"}}}

" gregsexton/gitv {{{
if neobundle#tap('gitv')
  call neobundle#config({
    \ 'depends': ['tpope/vim-fugitive'],
    \ 'autoload': {
    \   'commands' : ['Gitv']
    \   }
    \ })
  call neobundle#untap()
endif
"}}}

" mattn/emmet-vim"{{{
if neobundle#tap('emmet-vim')
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
endif
"}}}

" mattn/gist-vim"{{{
if neobundle#tap('gist-vim')
  call neobundle#config({
        \   'autoload' : {
        \     'commands' : [
        \       'Gist',
        \     ]},
        \ })
  call neobundle#untap()
endif
"}}}

" vim-easymotion {{{
if neobundle#tap('vim-easymotion')
  call neobundle#config({
          \   'autoload' : {
          \     'mappings' : [['sxno', '<Plug>(easymotion-']],
          \     'functions' : [
          \       'EasyMotion#User',
          \       'EasyMotion#is_active',
          \     ],
          \   }
          \ })
  " map  ; <Plug>(easymotion-prefix)
  " omap ; <Plug>(easymotion-prefix)
  " vmap ; <Plug>(easymotion-prefix)
  function! neobundle#tapped.hooks.on_post_source(bundle) "{{{
        EMCommandLineNoreMap <Space> <CR>
        EMCommandLineNoreMap <C-j> <Space>
  endfunction "}}}
  function! neobundle#tapped.hooks.on_source(bundle) "{{{
    " EasyMotion Config {{{
    let g:EasyMotion_do_mapping = 0
    let g:EasyMotion_keys = ';HKLYUIOPNM,QWERTZXCVBASDGJF'
    " Use upper case
    let g:EasyMotion_use_upper = 1
    " Smartcase
    let g:EasyMotion_smartcase = 1
    " Smartsign
    let g:EasyMotion_use_smartsign_us = 1
    " keep cursor column
    let g:EasyMotion_startofline = 0
    " Don't skip folded line
    let g:EasyMotion_skipfoldedline = 0
    " pseudo-migemo
    let g:EasyMotion_use_migemo = 1
    " Jump to first with enter & space
    let g:EasyMotion_enter_jump_first = 1
    let g:EasyMotion_space_jump_first = 1
    " Prompt
    let g:EasyMotion_prompt = '{n}> '
    " Highlight cursor
    let g:EasyMotion_cursor_highlight = 1
    "}}}

    " EasyMotion Regrex {{{
    let g:EasyMotion_re_line_anywhere = '\v' .
        \  '(<.|^.)' . '|' .
        \  '(.>|.$)' . '|' .
        \  '(\s+\zs.)' . '|' .
        \  '(\l)\zs(\u)' . '|' .
        \  '(_\zs.)' . '|' .
        \  '(#\zs.)'
    let g:EasyMotion_re_anywhere = '\v' .
        \  '(<.|^)' . '|' .
        \  '(.$)' . '|' .
        \  '(\s+\zs.)' . '|' .
        \  '(\l)\zs(\u)' . '|' .
        \  '(_\zs.)' . '|' .
        \  '(/\zs.)' . '|' .
        \  '(#\zs.)'
    "}}}

  endfunction "}}}

  " EasyMotion Mapping {{{
  nmap s <Plug>(easymotion-s)
  vmap s <Plug>(easymotion-s)
  omap z <Plug>(easymotion-s)

  " Extend search
  map  / <Plug>(easymotion-sn)
  omap / <Plug>(easymotion-tn)
  noremap  ;/ /
  nmap ;n <Plug>(easymotion-sn)<C-p>
  map ;N <Plug>(easymotion-bd-n)

  nmap n <Plug>(easymotion-next)<Plug>(anzu-update-search-status)zzzv
  nmap N <Plug>(easymotion-prev)<Plug>(anzu-update-search-status)zzzv
  xmap n <Plug>(easymotion-next)zzzv
  xmap N <Plug>(easymotion-prev)zzzv

  " Replace defaut
  " smart f & F
  map f <Plug>(easymotion-bd-fl)
  omap t <Plug>(easymotion-bd-tl)
  xmap t <Plug>(easymotion-bd-tl)
  map ;t <Plug>(easymotion-bd-t)

  " Extend hjkl
  map ;h <Plug>(easymotion-linebackward)
  map ;j <Plug>(easymotion-j)
  map ;k <Plug>(easymotion-k)
  map ;l <Plug>(easymotion-lineforward)

  " Anywhere!
  map <Space><Space> <Plug>(easymotion-jumptoanywhere)

  " Repeat last motion
  map ;<Space> <Plug>(easymotion-repeat)

  " move to next/previous last motion match
  nmap <expr> <C-n> yankround#is_active() ?
    \ '<Plug>(yankround-next)' : '<Plug>(easymotion-next)'
  nmap <expr> <C-p> yankround#is_active() ?
    \ '<Plug>(yankround-prev)' : '<Plug>(easymotion-prev)'
  xmap <C-n> <Plug>(easymotion-next)
  xmap <C-p> <Plug>(easymotion-prev)

  map <expr><Tab> EasyMotion#is_active() ?
    \ '<Plug>(easymotion-next)' : '<TAB>'
  map <expr>' EasyMotion#is_active() ?
    \ '<Plug>(easymotion-prev)' : "'"

  " Extene word motion
  map  ;w  <Plug>(easymotion-bd-w)
  map  ;e  <Plug>(easymotion-bd-e)
  omap ;w  <Plug>(easymotion-wl)
  omap ;b  <Plug>(easymotion-bl)
  omap ;e  <Plug>(easymotion-el)
  omap ;ge <Plug>(easymotion-gel)

  "}}}

  " EasyMotion User {{{
  " EasyMotion#User(pattern, is_visual, direction, is_inclusive)
  noremap  <silent><expr>;c
    \ ':<C-u>call EasyMotion#User(' .
    \ '"\\<' . expand('<cword>') . '\\>", 0, 2, 1)<CR>'
  xnoremap  <silent><expr>;c
    \ '<ESC>:<C-u>call EasyMotion#User(' .
    \ '"\\<' . expand('<cword>') . '\\>", 1, 2, 1)<CR>'

  let g:empattern = {}
  let g:empattern['syntax'] = '\v'
        \ . 'function|endfunction|return|call'
        \ . '|if|elseif|else|endif'
        \ . '|for|endfor'
        \ . '|while|endwhile'
        \ . '|break|continue'
        \ . '|let|unlet'
        \ . '|noremap|map|expr|silent'
        \ . '|g:|s:|b:|w:'
        \ . '|autoload|#|plugin'

  noremap  <silent>;1
         \ :<C-u>call EasyMotion#User(g:empattern.syntax , 0, 2, 1)<CR>
  xnoremap <silent>;1
         \ :<C-u>call EasyMotion#User(g:empattern.syntax , 1, 2, 1)<CR>
  "}}}

  function! g:EasyMotionMigemoToggle() "{{{
    if !exists(g:EasyMotion_use_migemo) && g:EasyMotion_use_migemo == 1
      let g:EasyMotion_use_migemo = 0
      echo 'Turn Off migemo'
    else
      let g:EasyMotion_use_migemo = 1
      echo 'Turn On migemo'
    endif
  endfunction
  command! -nargs=0 EasyMotionMigemoToggle :call g:EasyMotionMigemoToggle() "}}}

  call neobundle#untap()
endif
"}}}

" haya14busa/vim-easyoperator-line {{{
if neobundle#tap('vim-easyoperator-line')
    " Config {{{
    call neobundle#config({
                \   'depends' : 'vim-easymotion',
                \   'autoload' : {
                \     'mappings' : [
                \       '<Plug>(easyoperator-line-',
                \     ],
                \   }
                \ })
    " }}}
    function! neobundle#tapped.hooks.on_source(bundle) "{{{
    endfunction "}}}
    " Setting {{{
    xmap ;l  <Plug>(easyoperator-line-select)
    omap ;l  <Plug>(easyoperator-line-select)
    nmap d;l <Plug>(easyoperator-line-delete)
    nmap y;l <Plug>(easyoperator-line-yank)
    "}}}
    call neobundle#untap()
endif
" }}}

" haya14busa/vim-easyoperator-phrase {{{
if neobundle#tap('vim-easyoperator-phrase')
    " Config {{{
    call neobundle#config({
                \   'depends' : 'vim-easymotion',
                \   'autoload' : {
                \     'mappings' : [
                \       '<Plug>(easyoperator-phrase-',
                \     ],
                \   }
                \ })
    " }}}
    function! neobundle#tapped.hooks.on_source(bundle) "{{{
    endfunction "}}}
    " Setting {{{
    xmap ;p  <Plug>(easyoperator-phrase-select)
    omap ;p  <Plug>(easyoperator-phrase-select)
    nmap d;p <Plug>(easyoperator-phrase-delete)
    nmap y;p <Plug>(easyoperator-phrase-yank)
    "}}}
    call neobundle#untap()
endif
" }}}



" haya14busa/vim-lazy-lines {{{
if neobundle#tap('vim-lazy-lines')
    " Config {{{
    call neobundle#config({
                \   'depends' : 'vim-easymotion',
                \   'autoload' : {
                \     'mappings' : [
                \       '<Plug>(lazy-',
                \     ],
                \   }
                \ })
    " }}}
    function! neobundle#tapped.hooks.on_source(bundle) "{{{
    endfunction "}}}
    " Setting {{{
    nmap d;j <Plug>(lazy-deletelines)
    nmap d;k <Plug>(lazy-deletelines-k)
    " nmap d;j <Plug>(lazy-deletelines-j)
    "}}}
    call neobundle#untap()
endif
" }}}

" TextObject Keymaps{{{
" vim-textobj-entire {{{
if neobundle#tap('vim-textobj-entire')
  call neobundle#config({
        \ 'depends' : 'kana/vim-textobj-user',
        \ 'autoload' : {
        \       'mappings' : [['xo', 'ae'], ['xo', 'ie']]
        \   }
        \ })

  function! neobundle#tapped.hooks.on_source(bundle)
  endfunction

 call neobundle#untap()
endif
" }}}
" vim-textobj-fold {{{
if neobundle#tap('vim-textobj-fold')
  call neobundle#config({
        \ 'depends' : 'kana/vim-textobj-user',
        \ 'autoload' : {
        \       'mappings' : [['xo', 'az'], ['xo', 'iz']]
        \   }
        \ })

  function! neobundle#tapped.hooks.on_source(bundle)
  endfunction

 call neobundle#untap()
endif
" }}}
" vim-textobj-indent {{{
if neobundle#tap('vim-textobj-indent')
  call neobundle#config({
        \ 'depends' : 'kana/vim-textobj-user',
        \ 'autoload' : {
        \       'mappings' : [['xo', 'ai'], ['xo', 'aI'], ['xo', 'ii'], ['xo', 'iI']]
        \   }
        \ })

  function! neobundle#tapped.hooks.on_source(bundle)
  endfunction

 call neobundle#untap()
endif
" }}}
" vim-textobj-line {{{
if neobundle#tap('vim-textobj-line')
  call neobundle#config({
        \ 'depends' : 'kana/vim-textobj-user',
        \ 'autoload' : {
        \       'mappings' : [['xo', 'al'], ['xo', 'il']]
        \   }
        \ })

  function! neobundle#tapped.hooks.on_source(bundle)
  endfunction

 call neobundle#untap()
endif
" }}}
" vim-textobj-syntax {{{
if neobundle#tap('vim-textobj-syntax')
  call neobundle#config({
        \ 'depends' : 'kana/vim-textobj-user',
        \ 'autoload' : {
        \       'mappings' : [['xo', 'ay'], ['xo', 'iy']]
        \   }
        \ })

  function! neobundle#tapped.hooks.on_source(bundle)
  endfunction

 call neobundle#untap()
endif
" }}}
" vim-textobj-django-template {{{
if neobundle#tap('vim-textobj-django-template')
  call neobundle#config({
        \ 'depends' : 'kana/vim-textobj-user',
        \ 'autoload' : {
        \       'mappings' : [['xo', 'adb'], ['xo', 'idb']]
        \   }
        \ })

  function! neobundle#tapped.hooks.on_source(bundle)
  endfunction

 call neobundle#untap()
endif
" }}}
" vim-textobj-between {{{
if neobundle#tap('vim-textobj-between')
  call neobundle#config({
        \ 'depends' : 'kana/vim-textobj-user',
        \ 'autoload' : {
        \       'mappings' : [['xo', 'af'], ['xo', 'if'], ['xo', '<Plug>(textobj-between-']]
        \   }
        \ })

  function! neobundle#tapped.hooks.on_source(bundle)
  endfunction

 call neobundle#untap()
endif
" }}}
" vim-textobj-url {{{
if neobundle#tap('vim-textobj-url')
  call neobundle#config({
        \ 'depends' : 'kana/vim-textobj-user',
        \ 'autoload' : {
        \       'mappings' : [['xo', 'au'], ['xo', 'iu']]
        \   }
        \ })

  function! neobundle#tapped.hooks.on_source(bundle)
  endfunction

 call neobundle#untap()
endif
" }}}
" vim-textobj-multiblock {{{
if neobundle#tap('vim-textobj-multiblock')
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
endif
" }}}
" vim-textobj-underscore {{{
if neobundle#tap('vim-textobj-underscore')
  call neobundle#config({
        \ 'depends' : 'kana/vim-textobj-user',
        \ 'autoload' : {
        \       'mappings' : [['xo', 'a_'], ['xo', 'i_']]
        \   }
        \ })
  function! neobundle#tapped.hooks.on_source(bundle)
  endfunction
 call neobundle#untap()
endif
" }}}
" textobj-wiw {{{
if neobundle#tap('textobj-wiw')
  call neobundle#config({
        \ 'depends' : 'kana/vim-textobj-user',
        \ 'autoload' : {
        \       'mappings' : [['xo', 'a,w'], ['xo', 'i,w']]
        \   }
        \ })

  function! neobundle#tapped.hooks.on_source(bundle)
  endfunction

 call neobundle#untap()
endif
" }}}

" Number Text Object {{{
onoremap n :<c-u>call <SID>NumberTextObject(0)<cr>
" xnoremap n :<c-u>call <SID>NumberTextObject(0)<cr>
onoremap an :<c-u>call <SID>NumberTextObject(1)<cr>
" xnoremap an :<c-u>call <SID>NumberTextObject(1)<cr>
onoremap in :<c-u>call <SID>NumberTextObject(1)<cr>
" xnoremap in :<c-u>call <SID>NumberTextObject(1)<cr>

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
if neobundle#tap('vim-operator-replace')
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
endif
" }}}

" rhysd/vim-operator-surround {{{
if neobundle#tap('vim-operator-surround')
  map <silent>ys <Plug>(operator-surround-append)
  map <silent>ds <Plug>(operator-surround-delete)
  map <silent>cs <Plug>(operator-surround-replace)
  nmap <silent>yss V<Plug>(operator-surround-append)
  nmap <silent>dss V<Plug>(operator-surround-delete)
  nmap <silent>css V<Plug>(operator-surround-replace)
  call neobundle#untap()
endif
"}}}
"}}}

" osyo-manga/vim-anzu search{{{
if neobundle#tap('vim-anzu')
  call neobundle#config({
        \   'autoload' : {
        \     'mappings' : ['<Plug>(anzu-'],
        \   }
        \ })
  " nmap n <Plug>(anzu-n)zzzv
  " nmap N <Plug>(anzu-N)zzzv
  nmap * <Plug>(anzu-star-with-echo);n
  " nmap # <Plug>(anzu-sharp-with-echo)

  " Clear hit count when nokeyinput, move window, or move tab
  Autocmd CursorHold,CursorHoldI,WinLeave,TabLeave
      \   * call anzu#clear_search_status()
  call neobundle#untap()
endif
"}}}

" nathanaelkane/vim-indent-guides {{{
if neobundle#tap('vim-indent-guides')
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
  " Autocmd VimEnter,Colorscheme *
  "       \   :hi IndentGuidesOdd  ctermbg=darkgrey
  " Autocmd VimEnter,Colorscheme *
  "       \   :hi IndentGuidesEven ctermbg=grey
  nnoremap <Leader>i :<C-u>IndentGuidesToggle<CR>
  call neobundle#untap()
endif
"}}}

" jedi-vim {{{
if neobundle#tap('jedi-vim')
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
endif
"}}}

" sjl/gundo.vim" {{{
if neobundle#tap('gundo.vim')
  call neobundle#config({
        \ "autoload": {
        \   "commands": ['GundoToggle'],
        \}})
  nnoremap <Leader>g :<C-u>GundoToggle<CR>
  call neobundle#untap()
endif
"}}}

" tyru/open-browser {{{
if neobundle#tap('open-browser.vim')
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
endif
"}}}

" lightline.vim {{{
if neobundle#tap('lightline.vim')
    " lightline setting {{{
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
        \       [ 'filename','fugitive','anzu'],
        \   ],
        \   'right': [
        \       [ 'lineinfo', 'syntastic' ],
        \       [ 'percent' ],
        \       [ 'filetype'],
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
  "}}}

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
endif
"}}}

" autodate.vim {{{
if neobundle#tap('autodate.vim')
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
endif
"}}}

" accelerated-jk {{{
if neobundle#tap('accelerated-jk')
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
endif
"}}}

" mhinz/vim-signify "{{{
if neobundle#tap('vim-signify')
  call neobundle#untap()
endif
"}}}

" Leafcage/yankround {{{
if neobundle#tap('yankround.vim')
  call neobundle#config({
        \   'autoload' : {
        \     'mappings' : ['<Plug>(yankround-'],
        \   }
        \ })
  function! neobundle#tapped.hooks.on_source(bundle) "{{{
    let g:yankround_use_region_hl = 1
  endfunction "}}}
  " nmap p <Plug>(yankround-p)
  nmap P <Plug>(yankround-P)
  " nmap <C-p> <Plug>(yankround-prev)
  " nmap <C-n> <Plug>(yankround-next)

  nmap <expr> p yankround#is_active() ?
    \ '<Plug>(my-yankround-start)' : '<Plug>(yankround-p)'
  call submode#enter_with('yankround', 'n', 'r',
    \ '<Plug>(my-yankround-start)', '<Plug>(yankround-prev)')
  call submode#map('yankround', 'n', 'r', 'p', '<Plug>(yankround-prev)')
  call submode#map('yankround', 'n', 'r', 'n', '<Plug>(yankround-next)')
  call neobundle#untap()
endif
"}}}

" basyura/TweetVim {{{
if neobundle#tap('TweetVim')
  " Config {{{
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
        \          'TweetVimUserStream'],
        \     'unite_sources' : [ 'tweetvim/account', 'tweetvim' ],
        \   }
        \ })
  "}}}

  function! neobundle#tapped.hooks.on_source(bundle) "{{{
    let g:tweetvim_display_icon=1
    AutocmdFT tweetvim setlocal nonumber
    AutocmdFT tweetvim nnoremap <buffer><Leader>s :<C-u>TweetVimSay<CR>
    AutocmdFT tweetvim     nmap <buffer>c         <Plug>(tweetvim_action_in_reply_to)
    AutocmdFT tweetvim     nmap <buffer><Leader>a TweetVimAutoUpdate
  endfunction "}}}
  call neobundle#untap()
endif
"}}}

" pentie/VimRepress {{{
if neobundle#tap('VimRepress')
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
endif
"}}}

" thinca/vim-scouter {{{
if neobundle#tap('vim-scouter')
  call neobundle#config({
        \   'autoload' : {
        \     'commands' : [
        \       'Scouter'
        \     ],
        \   }
        \ })
  call neobundle#untap()
endif
"}}}

" thinca/vim-visualstar {{{
if neobundle#tap('vim-visualstar')
  call neobundle#config({
        \   'autoload' : {
        \     'mappings' : ['<Plug>(visualstar-'],
        \   }
        \ })
  vmap <silent>*  <Plug>(visualstar-*);n
  call neobundle#untap()
endif
"}}}

" tyru/caw.vim {{{
if neobundle#tap('caw.vim')
  call neobundle#config({
        \   'autoload' : {
        \     'mappings' : ['<Plug>(caw:'],
        \   }
        \ })
  function! neobundle#tapped.hooks.on_source(bundle) "{{{
    let g:caw_no_default_keymappings = 1
  endfunction "}}}
  " Beggining of Line Comment Toggle
  nmap <Leader>cc <Plug>(caw:i:toggle)
  vmap <Leader>cc <Plug>(caw:i:toggle)
  nmap <Leader>ci <Plug>(caw:i:toggle)
  vmap <Leader>ci <Plug>(caw:i:toggle)

  " End of Line Comment Toggle
  nmap <Leader>ca <Plug>(caw:a:toggle)
  vmap <Leader>ca <Plug>(caw:a:toggle)

  " Block Comment Toggle
  nmap <Leader>cw <Plug>(caw:wrap:toggle)
  vmap <Leader>cw <Plug>(caw:wrap:toggle)

  " Break line and Comment
  nmap <Leader>co <Plug>(caw:jump:comment-next)
  nmap <Leader>cO <Plug>(caw:jump:comment-prev)
  call neobundle#untap()
endif
"}}}

" vim-scripts/loremipsum {{{
if neobundle#tap('loremipsum')
  call neobundle#config({
        \   'autoload' : {
        \     'commands' : [
        \       'Loremipsum'
        \     ],
        \   }
        \ })
  call neobundle#untap()
endif
"}}}

" Shougo/junkfile.vim {{{
if neobundle#tap('junkfile.vim')
  call neobundle#config({
        \   'autoload' : {
        \     'commands' : 'JunkfileOpen',
        \     'unite_sources' : ['junkfile', 'junkfile/new'],
        \   }
        \ })
  call neobundle#untap()
endif
"}}}

" thinca/vim-prettyprint {{{
if neobundle#tap('vim-prettyprint')
  call neobundle#config({
        \   'autoload' : {
        \     'commands' : 'PP',
        \     'functions' : 'PP',
        \   }
        \ })
  call neobundle#untap()
endif
"}}}

" rbtnn/puyo.vim {{{
if neobundle#tap('puyo.vim')
  call neobundle#config({
        \   'autoload' : {
        \     'commands' : [
        \       'Puyo'
        \     ],
        \   }
        \ })
  call neobundle#untap()
endif
"}}}

" h1mesuke/vim-alignta {{{
if neobundle#tap('vim-alignta')
  call neobundle#config({
        \   'autoload' : {
        \     'commands' : [
        \       'Alignta',
        \     ],
        \   }
        \ })

  function! neobundle#tapped.hooks.on_source(bundle)
  endfunction
  call neobundle#untap()
endif
"}}}

" vim-submode {{{
if neobundle#tap('vim-submode')
  " call neobundle#config({})

  function! neobundle#tapped.hooks.on_source(bundle)
    let g:submode_keep_leaving_key = 1
  endfunction

  " Resize window
  call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
  call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
  call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>-')
  call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>+')
  call submode#map('winsize', 'n', '', '>', '<C-w>3>')
  call submode#map('winsize', 'n', '', '<', '<C-w>3<')
  call submode#map('winsize', 'n', '', '+', '<C-w>3-')
  call submode#map('winsize', 'n', '', '-', '<C-w>3+')

  call neobundle#untap()
endif
" }}}

" vim-niceblock {{{
if neobundle#tap('vim-niceblock')
  call neobundle#config({
        \   'autoload' : {
        \     'mappings' : [
        \       '<Plug>(niceblock-',
        \     ],
        \   }
        \ })

  function! neobundle#tapped.hooks.on_source(bundle)
  endfunction

  " Improved visual selection.
  xmap I  <Plug>(niceblock-I)
  xmap A  <Plug>(niceblock-A)
  vnoremap <expr> <Plug>(niceblock-r) niceblock#force_blockwise('r')
  xmap r <Plug>(niceblock-r)

  call neobundle#untap()
endif
" }}}

" vim-rengbang {{{
if neobundle#tap('vim-rengbang')
  call neobundle#config({
        \   'autoload' : {
        \     'commands' : [
        \       'RengBang',
        \     ],
        \   }
        \ })

  function! neobundle#tapped.hooks.on_source(bundle)
  endfunction

  " Count Up Function {{{
  nnoremap <silent> co :ContinuousNumber <C-a><CR>
  vnoremap <silent> co :ContinuousNumber <C-a><CR>
  command! -count -nargs=1 ContinuousNumber let c = col('.')|for n in range(1, <count>?<count>-line('.'):1)|exec 'normal! j' . n . <q-args>|call cursor('.', c)|endfor
  "}}}

  call neobundle#untap()
endif
" }}}

" tpope/vim-fugutive {{{
if neobundle#tap('vim-fugitive')
  " Config {{{
  call neobundle#config({
        \ 'autoload' : {
        \   'commands' : [
        \     'Gstatus', 'Gcommit', 'Gwrite', 'Gdiff', 'Gblame', 'Git', 'Ggrep'
        \   ]
        \   }
        \ })
  " }}}

  let s:bundle = neobundle#get('vim-fugitive')
  function! s:bundle.hooks.on_post_source(bundle)
    doautoall fugitive BufNewFile
  endfunction

  function! neobundle#tapped.hooks.on_source(bundle) "{{{
  endfunction "}}}


  " Setting {{{
  nnoremap ;gs :<C-u>Gstatus<CR>
  nnoremap ;gc :<C-u>Gcommit -v<CR>
  nnoremap ;ga :<C-u>Gwrite<CR>
  nnoremap ;gd :<C-u>Gdiff<CR>
  nnoremap ;gb :<C-u>Gblame<CR>
  "}}}
  call neobundle#untap()
endif
" }}}

" vim-scripts/CSS-one-line--multi-line-folding {{{
if neobundle#tap('CSS-one-line--multi-line-folding')
  call neobundle#config({
        \ "autoload": {
        \   "filetypes": ["css"],
        \   }
        \ })
  call neobundle#untap()
endif
"}}}

" heavenshell/vim-pydocstring {{{
if neobundle#tap('vim-pydocstring')
  call neobundle#config({
        \ "autoload": {
        \   "filetypes": ["python", "python3", "djangohtml"],
        \   }
        \ })
  function! neobundle#tapped.hooks.on_source(bundle)
  endfunction
  call neobundle#untap()
endif
"}}}

" tell-k/vim-autopep8 {{{
if neobundle#tap('vim-autopep8')
  call neobundle#config({
        \ "autoload": {
        \   "filetypes": ["python", "python3", "djangohtml"],
        \   }
        \ })
  function! neobundle#tapped.hooks.on_source(bundle) "{{{
  endfunction "}}}
  " Setting {{{
  "}}}
  call neobundle#untap()
endif
" }}}

" hynek/vim-python-pep8-indent {{{
if neobundle#tap('vim-python-pep8-indent')
    " Config {{{
    call neobundle#config({
                \   'autoload' : {
                \     'filetypes' : [ 'python'],
                \   }
                \ })
    " }}}
    function! neobundle#tapped.hooks.on_source(bundle) "{{{
    endfunction "}}}
    " Setting {{{
    "}}}
    call neobundle#untap()
endif
" }}}

" tmhedberg/SimpylFold {{{
if neobundle#tap('SimpylFold')
  call neobundle#config({
        \ "autoload": {
        \   "filetypes": ["python", "python3", "djangohtml"],
        \   }
        \ })
  function! neobundle#tapped.hooks.on_source(bundle)
  endfunction
  let g:SimpylFold_docstring_preview = 1
  call neobundle#untap()
endif
"}}}

" basyura/J6uil.vim {{{
if neobundle#tap('J6uil.vim')
  " Config {{{
  call neobundle#config({
        \   'depends': ['Shougo/vimproc', 'mattn/webapi-vim'],
        \   'autoload' : {
        \     'commands' : [ 'J6uil' ],
        \     'unite_sources' : [ 'J6uil/members', 'J6uil/rooms' ],
        \   }
        \ })
  " }}}
  function! neobundle#tapped.hooks.on_source(bundle) "{{{
    AutocmdFT J6uil call s:J6uil_settings()
    function! s:J6uil_settings()
      nunmap <buffer> s
      nmap <Plug>(easymotion-s)
      nmap <buffer> <Leader>s <Plug>(J6uil_open_say_buffer)
    endfunction
  endfunction "}}}
  " Setting {{{
  "}}}
  call neobundle#untap()
endif
" }}}

" t9md/vim-quickhl {{{
if neobundle#tap('vim-quickhl')
  " Config {{{
  call neobundle#config({
        \   'autoload' : {
        \     'mappings' : [ '<Plug>(quickhl-manual-' ],
        \   }
        \ })
  " }}}
  function! neobundle#tapped.hooks.on_source(bundle) "{{{
  endfunction "}}}
  " Setting {{{
  nmap ;m <Plug>(quickhl-manual-this)
  vmap ;m <Plug>(quickhl-manual-this)
  nmap ;M <Plug>(quickhl-manual-reset)
  vmap ;M <Plug>(quickhl-manual-reset)
  "}}}
  call neobundle#untap()
endif
" }}}

" tyru/capture.vim {{{
if neobundle#tap('capture.vim')
  " Config {{{
  call neobundle#config({
        \   'autoload' : {
        \     'commands' : [ 'Capture' ],
        \   }
        \ })
  " }}}
  function! neobundle#tapped.hooks.on_source(bundle) "{{{
  endfunction "}}}
  " Setting {{{
  "}}}
  call neobundle#untap()
endif
" }}}

" rhysd/unite-codic.vim {{{
if neobundle#tap('unite-codic.vim')
  " Config {{{
  call neobundle#config({
        \   'depends': ['koron/codic-vim'],
        \   'autoload' : {
        \     'unite_sources' : [
        \       'codic',
        \     ],
        \   }
        \ })
  " }}}
  function! neobundle#tapped.hooks.on_source(bundle) "{{{
  endfunction "}}}
  " Setting {{{
  "}}}
  call neobundle#untap()
endif
" }}}

" itchyny/calendar.vim {{{
if neobundle#tap('calendar.vim')
  " Config {{{
  call neobundle#config({
        \   'autoload' : {
        \     'commands' : [
        \       'Calendar',
        \     ],
        \   }
        \ })
  " }}}
  function! neobundle#tapped.hooks.on_source(bundle) "{{{
    let g:calendar_google_calendar = 1
    let g:calendar_google_task = 1
  endfunction "}}}
  " Setting {{{
  "}}}
  call neobundle#untap()
endif
" }}}

" scrooloose/syntastic {{{
if neobundle#tap('syntastic')
  " Config {{{
  call neobundle#config({
        \   'autoload' : {
        \     'insert' : 1,
        \   }
        \ })
  " }}}
  function! neobundle#tapped.hooks.on_source(bundle) "{{{
  endfunction "}}}
  " Setting {{{
  let g:syntastic_python_checkers=['pyflakes','flake8','pep8']
  "}}}
  call neobundle#untap()
endif
" }}}

" kana/vim-vspec {{{
if neobundle#tap('vim-vspec')
  " Config {{{
  call neobundle#config({
        \   'autoload' : {
        \     'filetypes' : ['vim'],
        \   }
        \ })
  " }}}
  function! neobundle#tapped.hooks.on_source(bundle) "{{{
  endfunction "}}}
  " Setting {{{
  "}}}
  call neobundle#untap()
endif
" }}}

" osyo-manga/vim-over {{{
if neobundle#tap('vim-over')
  " Config {{{
  call neobundle#config({
        \   'autoload' : {
        \     'commands' : [
        \       'OverCommandLine',
        \     ],
        \   }
        \ })
  " }}}
  function! neobundle#tapped.hooks.on_source(bundle) "{{{
  endfunction "}}}
  " Setting {{{
  "}}}
  call neobundle#untap()
endif
" }}}

" tyru/restart.vim {{{
if neobundle#tap('restart.vim')
  " Config {{{
  call neobundle#config({
        \   'gui' : 1,
        \   'autoload' : {
        \     'commands' : 'Restart'
        \   }
        \ })
  " }}}
  function! neobundle#tapped.hooks.on_source(bundle) "{{{
  endfunction "}}}
  " Setting {{{
  "}}}
  call neobundle#untap()
endif
" }}}

" thinca/vim-editvar {{{
if neobundle#tap('vim-editvar')
    " Config {{{
    call neobundle#config({
                \   'autoload' : {
                \     'commands' : [
                \       'Editvar',
                \     ],
                \     'unite_sources' : [
                \       'variable'
                \     ],
                \   }
                \ })
    " }}}
    function! neobundle#tapped.hooks.on_source(bundle) "{{{
    endfunction "}}}
    " Setting {{{
    "}}}
    call neobundle#untap()
endif
" }}}

" Sandbox {{{======================

" " sticky_table {{{
" let sticky_table_us = {
"       \',' : '<', '.' : '>', '/' : '?',
"       \'1' : '!', '2' : '@', '3' : '#', '4' : '$', '5' : '%',
"       \'6' : '^', '7' : '&', '8' : '*', '9' : '(', '0' : ')', '-' : '_', '=' : '+',
"       \';' : ':', '[' : '{', ']' : '}', '`' : '~', "'" : "\"", '\' : '|',
"       \}
"
" let sticky_table_ja = {
"       \',' : '<', '.' : '>', '/' : '?',
"       \'1' : '!', '2' : '"', '3' : '#', '4' : '$', '5' : '%',
"       \'6' : '&', '7' : "'", '8' : '(', '9' : ')', '0' : '_', '-' : '=', '^' : '~',
"       \';' : '+', ':' : '*', '[' : '{', ']' : '}', '@' : '`', '\' : '|'
"       \}
" "}}}

"}}}

" Finally {{{ =====================
" Installation check.
NeoBundleCheck
if !has('vim_starting')
  call neobundle#call_hook('on_source')

  " Highlight : maybe workaround
  call s:hl_zenkaku() "/　/
  call s:hl_trailing_spaces() "  
  call s:hl_my_autocmd() ""Autocmd AutocmdFT
endif
set secure
"}}}
"------------------------------------
" vim: expandtab softtabstop=2 shiftwidth=2 foldmethod=marker
