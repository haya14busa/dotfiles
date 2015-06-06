" haya14busa's vimrc
" Author: haya14busa
" URL: http://haya14busa.com
" Source: https://github.com/haya14busa/dotfiles/
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
if !&compatible | set nocompatible | endif

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
Autocmd BufWinEnter,ColorScheme *vimrc call s:hl_my_autocmd()
"}}}

" Echo startup time on start {{{
if has('vim_starting') && has('reltime')
  " Shell: vim --startuptime filename -q; vim filename
  " vim --cmd 'profile start profile.txt' --cmd 'profile file $HOME/.vimrc' +q && vim profile.txt
  let g:startuptime = reltime()
  Autocmd VimEnter * let g:startuptime = reltime(g:startuptime) | redraw
  \ | echomsg 'startuptime: ' . reltimestr(g:startuptime)
endif
"}}}
"}}}

" NeoBundle {{{====================

if ! isdirectory(expand('~/.vim/bundle'))
  echon 'Installing neobundle.vim...'
  silent call mkdir(expand('~/.vim/bundle'), 'p')
  silent !git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
  echo 'done.'
  if v:shell_error
    echoerr 'neobundle.vim installation has failed!'
    finish
  endif
endif

if has('vim_starting')
  set runtimepath& runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))

" NeoBundle Function {{{
" NOTE: plugins installed with MyNeoBundle doesn't update with :NeoBundleUpdate
let s:MyNeoBundle = {}
let s:MyNeoBundle.base = expand('~/.vim/mybundle')
let s:MyNeoBundle.user = 'haya14busa'
if ! isdirectory(s:MyNeoBundle.base)
  call mkdir(expand(s:MyNeoBundle.base), 'p')
endif

function! s:MyNeoBundle(is_lazy, ...)
  let repository = get(a:, 1, '')
  if repository is# ''
    echo '[MyNeoBundle] error occurs with ' . string(a:000)
    return 1
  endif
  let [author, reponame] = split(repository, '/')
  let todir = s:MyNeoBundle.base . '/' . reponame
  if ! isdirectory(todir)
    let giturl = 'git@github.com:' . repository . '.git'
    echo giturl
    echo 'Installing ' . repository . '...'
    call system('git clone ' . giturl . ' ' . todir)
  endif
  let config = {
  \ 'base': s:MyNeoBundle.base,
  \ 'type': 'nosync',
  \ 'lazy': a:is_lazy
  \}
  execute ':NeoBundle' string(reponame) ',' string(config)
endfunction

command! -nargs=1 MyNeoBundle     call s:MyNeoBundle(0, <args>)
command! -nargs=1 MyNeoBundleLazy call s:MyNeoBundle(1, <args>)
"}}}

function! s:load_bundles() "{{{
  " Let NeoBundle manage NeoBundle
  NeoBundleFetch 'Shougo/neobundle.vim'

  " Synthesis {{{
  " Unite {{{
  NeoBundleLazy 'Shougo/unite.vim'

  NeoBundle 'Shougo/neomru.vim'
  NeoBundleLazy 'Shougo/unite-help'
  NeoBundleLazy 'ujihisa/unite-colorscheme'
  NeoBundleLazy 'Shougo/unite-outline'
  NeoBundleLazy 'osyo-manga/unite-fold'
  NeoBundleLazy 'kmnk/vim-unite-giti'
  NeoBundleLazy 'thinca/vim-unite-history'
  NeoBundleLazy 'osyo-manga/unite-quickfix'
  NeoBundleLazy 'moznion/unite-git-conflict.vim'
  NeoBundleLazy 'Shougo/unite-session'
  NeoBundleLazy 'osyo-manga/unite-vimpatches'
  NeoBundleLazy 'tsukkee/unite-tag'
  NeoBundleLazy 'haya14busa/unite-ghq'
  NeoBundleLazy 'rhysd/unite-zsh-cdr.vim'
  NeoBundleLazy 'haya14busa/unite-reading-vimrc'
  NeoBundleLazy 'osyo-manga/unite-vimmer'
  NeoBundleLazy 'haya14busa/unite-historia'
  " action
  NeoBundleLazy 'osyo-manga/ref-lynx'
  NeoBundleLazy 'haya14busa/unite-action-vimfiler_lcd'
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
  MyNeoBundle 'haya14busa/haya14busa-snippets'
  NeoBundleLazy 'mattn/emmet-vim'
  NeoBundleLazy 'deris/vim-rengbang' " vim plugin for sequencial numbering with pattern
  NeoBundle 'deris/vim-visualinc'
  NeoBundleLazy 'h1mesuke/vim-alignta'
  NeoBundleLazy 'tyru/caw.vim' " sophisticated comment plugin
  NeoBundleLazy 'ujihisa/neco-look'
  NeoBundleLazy 'rhysd/vim-grammarous'
  "}}}

  " Development {{{
  NeoBundleLazy 'thinca/vim-quickrun'

  NeoBundleLazy "osyo-manga/vim-watchdogs"

  NeoBundleLazy 'koron/codic-vim' " Codic vim plugin
  NeoBundleLazy 'rhysd/unite-codic.vim' " A unite.vim source for codic-vim.
  "}}}

  " Library {{{
  NeoBundle 'Shougo/vimproc'
  NeoBundle 'mattn/webapi-vim'
  NeoBundleLazy 'vim-jp/vital.vim' " A comprehensive Vim utility functions for Vim plugins
  NeoBundleLazy 'osyo-manga/unite-vital-module'
  NeoBundle 'osyo-manga/vital-over'
  NeoBundle 'osyo-manga/vital-palette'
  NeoBundle 'osyo-manga/vital-reunions'
  NeoBundle 'osyo-manga/vital-coaster'
  NeoBundle 'osyo-manga/vital-gift'
  NeoBundle 'haya14busa/vital-string-interpolation'
  NeoBundle 'haya14busa/underscore.vim'
  MyNeoBundle 'haya14busa/vital-projectfinder'
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

  NeoBundle 'vim-jp/autofmt'

  "}}}

  " Motion {{{
  MyNeoBundleLazy 'Lokaltog/vim-easymotion'
  " MyNeoBundleLazy 'vim-easyoperator-line'
  " MyNeoBundleLazy 'vim-easyoperator-phrase'
  " MyNeoBundleLazy 'vim-lazy-lines'
  NeoBundleLazy 'rhysd/clever-f.vim' " Extended f, F, t and T key mappings for Vim.
  NeoBundleLazy 'rhysd/accelerated-jk'
  NeoBundleLazy 'saihoooooooo/glowshi-ft.vim'
  NeoBundle 'haya14busa/incsearch.vim'
  NeoBundle 'haya14busa/vim-asterisk'
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
  NeoBundleLazy 'haya14busa/vim-textobj-number'     " an, in
  " NeoBundleLazy 'h1mesuke/textobj-wiw'              " a,w a,e

  NeoBundle 'wellle/targets.vim'
  " NeoBundle 'gcmt/wildfire.vim'

  " to surround vim objects with a pair of identical chars
  " TODO: Make it lazy or use vim-operator-surround
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'tpope/vim-repeat'

  " Operator
  NeoBundleLazy 'kana/vim-operator-user'
  NeoBundleLazy 'kana/vim-operator-replace'
  "NeoBundle 'rhysd/vim-operator-surround'

  "}}}

  " Git {{{
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'lambdalisue/vim-gita'
  NeoBundleLazy 'cohama/agit.vim'
  NeoBundle 'mhinz/vim-signify'
  NeoBundle 'chrisbra/vim-diff-enhanced'

  NeoBundleLazy 'thinca/vim-openbuf'
  NeoBundleLazy 'Shougo/vim-vcs', {
  \ 'depends' : 'thinca/vim-openbuf',
  \ 'autoload' : {'commands' : 'Vcs'},
  \ }

  NeoBundle 'rhysd/committia.vim'
  "}}}

  " UI {{{
  NeoBundle 'itchyny/lightline.vim'
  NeoBundle 'Yggdroot/indentLine'
  NeoBundleLazy 'osyo-manga/vim-brightest'
  NeoBundleLazy 't9md/vim-quickhl' " quickly highlight <cword> or visually selected word
  NeoBundleLazy 'mattn/disableitalic-vim'
  "TODO
  NeoBundleLazy 'osyo-manga/vim-automatic', {
  \ 'depends' : [ 'osyo-manga/vim-gift', 'osyo-manga/vim-reunions' ] }
  " }}}

  " Utility {{{
  " NeoBundle 'kana/vim-submode' " Vim plugin: Create your own submodes
  NeoBundle 'thinca/vim-submode', {
  \ 'rev' : 'my-master',
  \ 'name' : 'vim-submode',
  \ }
  NeoBundleLazy 'tyru/open-browser.vim'
  NeoBundleLazy 'tyru/open-browser-github.vim'
  NeoBundleLazy 'thinca/vim-qfreplace'
  NeoBundleLazy 'haya14busa/endtagcomment.vim'
  "}}}

  " Application {{{
  NeoBundleLazy 'itchyny/calendar.vim' " A calendar application for Vim
  NeoBundleLazy 'itchyny/screensaver.vim'
  "}}}

  " Memo {{{
  NeoBundleLazy 'mattn/gist-vim'
  NeoBundleLazy 'Shougo/junkfile.vim' " Create temporary file for memo, testing, ...
  "}}}

  " Filetype {{{
  NeoBundleLazy 'osyo-manga/vim-precious'
  let g:markdown_fenced_languages = [
  \  'coffee',
  \  'css',
  \  'erb=eruby',
  \  'javascript',
  \  'js=javascript',
  \  'json=javascript',
  \  'ruby',
  \  'sass',
  \  'xml',
  \  'python',
  \  'vim',
  \]
  NeoBundle 'pangloss/vim-javascript'
  NeoBundle 'mxw/vim-jsx'
  NeoBundle 'wavded/vim-stylus'
  NeoBundle 'hail2u/vim-css3-syntax'
  NeoBundle 'kchmck/vim-coffee-script'
  NeoBundle 'othree/html5.vim'
  NeoBundle 'tpope/vim-markdown'
  NeoBundleLazy 'kannokanno/previm'
  NeoBundle 'groenewege/vim-less'

  " Python {{{
  NeoBundleLazy 'davidhalter/jedi-vim'
  NeoBundleLazy 'heavenshell/vim-pydocstring'
  NeoBundleLazy 'tell-k/vim-autopep8'
  NeoBundleLazy 'hynek/vim-python-pep8-indent'
  NeoBundleLazy 'mkomitee/vim-gf-python'

  "}}}

  " JavaScript {{{
  NeoBundleLazy 'maksimr/vim-jsbeautify'
  "}}}


  " Scala {{{
  NeoBundleLazy 'derekwyatt/vim-scala'
  NeoBundleLazy 'derekwyatt/vim-sbt'
  NeoBundleLazy 'mdreves/vim-scaladoc'
  NeoBundleLazy 'gre/play2vim'
  "}}}

  " Scheme {{{
  NeoBundleLazy 'aharisu/vim_goshrepl'
  NeoBundleLazy 'kien/rainbow_parentheses.vim'
  " }}}

  NeoBundleLazy 'osyo-manga/vim-monster', {
  \   'autoload' : {'filetypes': 'ruby'}
  \ }

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

  NeoBundle 'miyakogi/seiya.vim'

  " ColorScheme {{{
  NeoBundle 'tomasr/molokai'
  NeoBundle 'sickill/vim-monokai'
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
  NeoBundle 'freeo/vim-kalisi'
  "}}}

  " Vim script {{{
  NeoBundleLazy 'mattn/learn-vimscript'
  NeoBundleLazy 'thinca/vim-prettyprint'
  NeoBundleLazy 'tyru/capture.vim' " Show Ex command output in buffer
  NeoBundleLazy 'kana/vim-vspec' " Vim plugin: Testing framework for Vim script
  NeoBundleLazy 'osyo-manga/vim-owl', {
  \ 'depends' : [ 'osyo-manga/vim-chained', 'osyo-manga/vim-budou' ] }
  NeoBundle 'thinca/vim-themis'
  NeoBundleLazy 'thinca/vim-editvar' " Edits vim variable in buffer.
  NeoBundleLazy 'tyru/restart.vim' " Restart your gVim
  NeoBundleLazy 'thinca/vim-ft-help_fold', {
  \ 'filetypes' : 'help'
  \ }
  NeoBundleLazy 'syngan/vim-vimlint', {
  \ 'depends' : 'ynkdir/vim-vimlparser'}
  NeoBundle 'thinca/vim-localrc'

  NeoBundle 'kana/vim-gf-user'
  NeoBundle 'hujo/gf-user-vimfn'
  NeoBundle 'haya14busa/vim-snoopy'
  "}}}

  " Others {{{
  NeoBundleLazy 'basyura/TweetVim' " twitter client for vim
  NeoBundleLazy 'basyura/twibill.vim' " twitter api wrapper like a Rubytter.rb ... maybe
  NeoBundleLazy 'basyura/J6uil.vim'
  NeoBundleLazy 'dogrover/vim-pentadactyl'
  NeoBundleLazy 'supermomonga/thingspast.vim'
  NeoBundleLazy 'rbtnn/puyo.vim'
  NeoBundleLazy 'thinca/vim-scouter'

  NeoBundleLazy 'thinca/vim-threes'
  " NeoBundle 'tpope/vim-rake'
  NeoBundleLazy 'mattn/flappyvird-vim'
  NeoBundleLazy 'mattn/yamada2-vim'

  NeoBundleLazy 'haya14busa/vim-checklinks', {
  \ 'autoload': {'commands': 'CheckLinks'}}
  NeoBundleLazy 'haya14busa/vim-rot47'
  "}}}
endfunction "}}}

if neobundle#load_cache()
  call s:load_bundles()
  NeoBundleSaveCache
endif

call neobundle#end()
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
set completeopt-=preview "Do not use preview window
set display=lastline "Display as much as possible of the last line
set diffopt+=iwhite
set formatoptions-=r,o " Turn off Automatically comment out when line break
" If we have Vim 7.4, add j to the format options to get rid of comment
" leaders when joining lines
if v:version >= 704
    set formatoptions+=j
endif
set grepprg=internal "Program to use for the :grep command
set helpheight=12 " Minimal initial height of the help window
set helplang& helplang=en,ja " If true Vim master, use English help file
set hidden "Display another buffer when current buffer isn't saved.
set history=1024 "Amount of Command history
set infercase "Ignore case on insert completion.
set keywordprg=:help " Open Vim internal help by K command
set laststatus=2 "Always display statusline
set lazyredraw "Do not redraw while executing macros
set matchpairs& matchpairs+=<:> "Characters that form pairs
set matchtime=1 "Tenths of a second to show the matching paren
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

language C "Set locale

" Encoding {{{
set encoding=utf-8 "Sets the character encoding used inside Vim
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932,euc-jp "A list of character encodings
set fileformats=unix,dos,mac "This gives the end-of-line (<EOL>) formats
" }}}

" Tab Basic Settings {{{
set autoindent "Copy indent from current line when starting a new line
set expandtab "Use the appropriate number of spaces to insert a <Tab>
set shiftround "Round indent to multiple of 'shiftwidth'
set shiftwidth=2 "Number of spaces to use for each step of (auto)indent
set softtabstop=2 "Number of spaces that a <Tab> counts for while editing operations
set tabstop=2 "Number of spaces that a <Tab> in the file counts for
"}}}

" Search Basic Settings {{{
set incsearch "Incremental searching
set ignorecase "Ignore case in search patterns
set smartcase "Override the ignorecase option if the pattern contains upper case
set hlsearch | nohlsearch "Highlight search patterns, support reloading
"}}}

" Backup Settings {{{
if ! isdirectory($HOME.'/.vim/backup')
  call mkdir($HOME.'/.vim/backup', 'p')
endif
set backup "Make a backup before overwriting a file
set writebackup "Make a backup before overwriting a file
set backupdir=~/.vim/backup "List of directories for the backup file
" Make backup files like you are millionaire (in terms disk usage resourses)
Autocmd BufWritePre * let &backupext = '_' . strftime('%Y%m%d_%X') . '~'
"}}}

" Swap Settings {{{
if ! isdirectory($HOME.'/.vim/swap')
  call mkdir($HOME.'/.vim/swap', 'p')
endif
set swapfile "Use a swapfile for the buffer
set directory=~/.vim/swap
"}}}

" Undo Basic {{{
if has('persistent_undo')
  if ! isdirectory($HOME.'/.vim/undo')
    call mkdir($HOME.'/.vim/undo', 'p')
  endif
  set undofile "Automatically saves undo history
  set undoreload=1000 "Save the whole buffer for undo when reloading it
  set undodir=~/.vim/undo
  set undofile
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
" Check color
" :so $VIMRUNTIME/syntax/colortest.vim
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
Autocmd BufWritePost *vimrc NeoBundleClearCache | source $MYVIMRC
Autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
"}}}

" Close Vim help by q {{{
AutocmdFT help nnoremap <buffer> q <C-w>c
AutocmdFT help nnoremap <buffer> ;q q
AutocmdFT help nnoremap <buffer> Q q
"}}}

" Useful Keymaps{{{

" Escape Keymaps {{{
" inoremap <silent> jj <ESC>
" inoremap <C-j> j
"}}}

" Breakline with Enter {{{
nnoremap <CR> o<ESC>
"}}}

" For Undo Revision, Break Undo Sequence "{{{
inoremap <CR> <C-g>u<CR>

inoremap <C-h> <C-g>u<C-h>
inoremap <BS> <C-g>u<BS>
inoremap <Del> <C-g>u<Del>
inoremap <C-d> <C-g>u<Del>
inoremap <C-w> <C-g>u<C-w>
inoremap <C-u> <C-g>u<C-u>

"}}}

" Motion {{{

" Normal Mode {{{
nnoremap j gj
vnoremap j gj
nnoremap gj j
vnoremap gj j

nnoremap k gk
vnoremap k gk
nnoremap gk k
vnoremap gk k

nnoremap - $
"}}}

" Insert & Comandline Mode "{{{
" TODO: use noremap!
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


" Command line History {{{
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
"}}}

" Save as root"{{{
cnoreabbrev w!! w !sudo tee > /dev/null %
"}}}

" From the cursor to the end of line {{{
" Select from cursor position to end of line
" vnoremap v $h " -> D,C,Y
" Yank from cursor position to end of line
nnoremap Y y$
"}}}

" Yank with keeping cursor position in visual mode {{{
function! s:keepcursor_visual_wrapper(command)
  exec "normal! gv" . a:command
  exec "normal! gv\<ESC>"
endfunction
xnoremap <silent> y :<C-u>call <SID>keepcursor_visual_wrapper('y')<CR>
xnoremap <silent> Y :<C-u>call <SID>keepcursor_visual_wrapper('Y')<CR>
" Below mappings doesn't support dot repeat
" xnoremap <silent> > :<C-u>call <SID>keepcursor_visual_wrapper('>')<CR>
" xnoremap <silent> < :<C-u>call <SID>keepcursor_visual_wrapper('<')<CR>
"}}}

" Spelling Keymaps {{{
" Toggle spell checking
nnoremap <Leader>sp :<C-u>set spell! spell?<CR>
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
" nnoremap / /\v
" search within visual block
" vnoremap / <esc>/\v%V
" clear status
nnoremap <silent><Esc><Esc>
\ :<C-u>nohlsearch<CR>
" nnoremap <silent><Esc><Esc>
"       \ :<C-u>set hlsearch! hlsearch?<CR>

" Automatically escape '/'
" cnoremap <expr>/ getcmdtype() == '/' ? '\/' : '/'

nnoremap & :&&<CR>
xnoremap & :&&<CR>
"}}}

" select last inserted text
nnoremap gV `[v`]

" Select pasted text
nnoremap <expr>gp '`['.strpart(getregtype(),0,1).'`]'

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
nnoremap <silent> <Leader>l :<C-u>set list! list?<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,
set list

" Highlight End-of-Line & Zenkaku Whitespace {{{
function! s:hl_trailing_spaces() "{{{
  " Test   
  highlight! link TrailingSpaces Error
  syntax match TrailingSpaces containedin=ALL /\s\+$/
endfunction "}}}
function! s:hl_zenkaku() "{{{
  highlight! link ZenkakuSpace Error
  syntax match ZenkakuSpace containedin=ALL /　/
endfunction "}}}
function! s:hl_colorscheme_modify_molokai()
  hi! DiffText term=reverse cterm=bold ctermbg=239 gui=bold,italic guibg=#4C4745
  hi! DiffDelete term=bold ctermfg=180 ctermbg=0 gui=bold guifg=#960050 guibg=#1E0010
  hi! DiffAdd term=bold ctermbg=0 guibg=#13354A
  hi! Visual ctermfg=236 ctermbg=119 guifg=#353535 guibg=#95e454
  hi! default link MatchParen Title
endfunction

Autocmd BufWinEnter,ColorScheme * call s:hl_trailing_spaces()
Autocmd BufWinEnter,ColorScheme * call s:hl_zenkaku()
Autocmd BufWinEnter,ColorScheme * call s:hl_colorscheme_modify_molokai()

function! s:remove_trailing_white_spaces()
  let pos = winsaveview()
  silent! execute '%s/\s\+$//g'
  call winrestview(pos)
endfunction
command! RemoveTrailingWhiteSpaces call <SID>remove_trailing_white_spaces()
command! -range=% TrimSpace  <line1>,<line2>s!\s*$!!g | nohlsearch
" remove trail ^M
command! -range=% RemoveTrailM  <line1>,<line2>s!\r$!!g | nohlsearch
"}}}

"}}}

" Resize splits when the window is resized {{{
Autocmd VimResized * :wincmd =
"}}}

" Restore last cursor position when open a file {{{
Autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
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
for s:n in range(1, 9)
  execute 'nnoremap <silent> t'.s:n  ':<C-u>tabnext'.s:n.'<CR>'
endfor
unlet s:n
"}}}

" MoveToNewTab {{{
" http://www.sopht.jp/blog/index.php?/archives/445-vim.html
nnoremap <silent> tm :<C-u>call <SID>MoveToNewTab()<CR>
command! OpenAsNewTab call s:MoveToNewTab()
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
endfunction "}}}

"}}}

" Use command-line window {{{
nnoremap : q:
vnoremap : q:
nnoremap ;: :
vnoremap ;: :

Autocmd CmdwinEnter * call s:init_cmdwin()
function! s:init_cmdwin() "{{{
  setlocal nonumber
  silent! 1,$-20 delete _ | call cursor('$', 0)

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
  \  input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction  " }}}
"}}}

" Git Setting {{{
" key mapping in vimdiff
function! s:config_in_diff_mode()
  if !&diff
    return
  endif
  " for git mergetool
  nnoremap <buffer> <Leader>1 :diffget LOCAL<CR>
  nnoremap <buffer> <Leader>2 :diffget BASE<CR>
  nnoremap <buffer> <Leader>3 :diffget REMOTE<CR>
  nnoremap <buffer> <Leader>u :<C-u>diffupdate<CR>
  nnoremap <buffer> u u:<C-u>diffupdate<CR>
  " same bindings for merging diffs as in normal mode
  xnoremap <buffer> dp :diffput<cr>
  xnoremap <buffer> do :diffget<cr>
endfunction

Autocmd FilterWritePre * call s:config_in_diff_mode()


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
" Autocmd BufWritePost,FileWritePost *.styl silent !stylus <afile> -u nib >/dev/null
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

" Autocmd BufWritePost *.scss call Sass_convert()
"}}}

" Markdown {{{
Autocmd BufRead,BufNewFile *.md  set filetype=markdown
AutocmdFT markdown setlocal sw=2 sts=2 ts=2 et
Autocmd Syntax markdown syntax sync fromstart

AutocmdFT markdown nnoremap <buffer><silent><Leader>= :<C-u>call append('.', repeat('=', strdisplaywidth(getline('.'))))<CR>
AutocmdFT markdown nnoremap <buffer><silent><Leader>- :<C-u>call append('.', repeat('-', strdisplaywidth(getline('.'))))<CR>
"}}}

AutocmdFT html setlocal sw=2 sts=2 ts=2 et
AutocmdFT scss setlocal sw=2 sts=2 ts=2 et
AutocmdFT yaml setlocal sw=2 sts=2 ts=2 et
AutocmdFT javascript setlocal sw=2 sts=2 ts=2 et
AutocmdFT less setlocal sw=2 sts=2 ts=2 et

AutocmdFT c   setlocal foldmethod=syntax
AutocmdFT cpp setlocal foldmethod=syntax

AutocmdFT ruby setlocal sw=2 sts=2 ts=2 et
AutocmdFT vim  setlocal sw=2 sts=2 ts=2 et

Autocmd BufRead,BufNewFile *.scala  set filetype=scala
Autocmd BufRead,BufNewFile *.sbt set filetype=sbt
AutocmdFT scala setlocal foldmethod=syntax
AutocmdFT scala setlocal sw=2 sts=2 ts=2 et

set tags+=.tags
Autocmd BufRead,BufNewFile *.scala setlocal tags+=~/tags/src/scala/.tags
Autocmd BufRead,BufNewFile *.scala setlocal tags+=~/tags/src/playframework/.tags
Autocmd BufRead,BufNewFile *.scala.html setlocal tags+=~/tags/src/playframework/.tags
Autocmd BufRead,BufNewFile *.scala setlocal tags+=~/tags/src/slick/.tags
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
  \ }) "}}}

  function! neobundle#tapped.hooks.on_post_source(bundle)
    NeoBundleSource unite-action-vimfiler_lcd
  endfunction

  " Settings"{{{
  function! neobundle#tapped.hooks.on_source(bundle)
    " Disable
    let g:unite_source_history_yank_enable = 0

    let g:unite_kind_jump_list_after_jump_scroll=0
    let g:unite_enable_start_insert = 1
    let g:unite_source_rec_min_cache_files = 1000
    let g:unite_source_rec_max_cache_files = 5000
    let g:unite_source_file_mru_long_limit = 6000
    let g:unite_source_file_mru_limit = 500
    let g:unite_source_directory_mru_long_limit = 6000
    let g:unite_winheight = 25

    " Default configuration.
    " Prompt choices.
    call unite#custom#profile('default', 'context', {
    \   'prompt' : '❯ ',
    \ })

    " Open plugin directory by t
    call unite#custom#alias('directory', 'tabopen', 'tabvimfiler')

    " Fuzzy find
    call unite#filters#matcher_default#use(['matcher_fuzzy'])
    call unite#filters#sorter_default#use(['sorter_rank'])

    call unite#custom#default_action('directory', 'vimshell')
    call unite#custom#default_action('cdable', 'vimshell')

    call unite#custom#source('file_mru', 'matchers',
    \   ['matcher_project_files', 'matcher_fuzzy'])

    " Ignore pattens
    call unite#custom#source(
    \ 'file_rec,file_rec/async,file_rec/git,file_mru,file,buffer,grep',
    \ 'ignore_pattern', join([
    \   '\.swp', '\.swo', '\~$',
    \   '\.git/', '\.svn/', '\.hg/',
    \   '\.ropeproject/',
    \   'node_modules/', 'log/', 'tmp/', 'obj/',
    \   '/vendor/gems/', '/vendor/cache/', '\.bundle/', '\.sass-cache/',
    \   '/tmp/cache/assets/.*/sprockets/', '/tmp/cache/assets/.*/sass/',
    \   '\.pyc$', '\.class$', '\.jar$',
    \   '\.jpg$', '\.jpeg$', '\.bmp$', '\.png$', '\.gif$',
    \   '\.o$', '\.out$', '\.obj$', '\.rbc$', '\.rbo$', '\.gem$',
    \   '\.zip$', '\.tar\.gz$', '\.tar\.bz2$', '\.rar$', '\.tar\.xz$',
    \   '\.doc$', '\.docx$',
    \   'target/',
    \ ], '\|'))

    " Grep
    if executable('ag')
      " Use ag in unite grep source.
      let g:unite_source_grep_command = 'ag'
      let g:unite_source_grep_default_opts =
      \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
      \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
      let g:unite_source_grep_recursive_opt = ''
    elseif executable('pt')
      let g:unite_source_grep_command = 'pt'
      let g:unite_source_grep_default_opts = '--nogroup --nocolor'
      let g:unite_source_grep_recursive_opt = ''
    elseif executable('jvgrep')
      " For jvgrep.
      let g:unite_source_grep_command = 'jvgrep'
      let g:unite_source_grep_default_opts = '--exclude ''\.(git|svn|hg|bzr)'''
      let g:unite_source_grep_recursive_opt = '-R'
    elseif executable('ack-grep')
      " For ack.
      let g:unite_source_grep_command = 'ack-grep'
      let g:unite_source_grep_default_opts = '--no-heading --no-color -a'
      let g:unite_source_grep_recursive_opt = ''
    endif

    AutocmdFT unite call s:unite_settings()
    function! s:unite_settings()
      imap <silent><buffer> <C-j> <Plug>(unite_select_next_line)
      imap <silent><buffer> <C-k> <Plug>(unite_select_previous_line)

      imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
      imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

      nmap <buffer> <ESC> <Plug>(unite_exit)
      nmap <buffer> q <Plug>(unite_exit)

      imap <silent><buffer> <C-w> <Plug>(unite_delete_backward_path)

      let unite = unite#get_current_unite()
      if unite.profile_name ==# '^search'
        nnoremap <silent><buffer><expr> r unite#do_action('replace')
      else
        nnoremap <silent><buffer><expr> r unite#do_action('rename')
      endif

    endfunction
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
  nnoremap <silent> [unite]gr :<C-u>Unite -silent -no-quit grep:.<CR>
  " Line
  nnoremap <silent> z/ :<C-u>Unite -buffer-name=search line -start-insert -no-quit<CR>
  "-Unite Plugin Settings--------------"{{{
  " Execute help.
  nnoremap <silent> [unite]gh  :<C-u>Unite -silent -start-insert -buffer-name=help help<CR>
  " Outeline
  " nnoremap <silent> [unite]o :<C-u>Unite -silent outline -vertical -winwidth=40 -no-start-insert<CR>
  " Use outline like explorer
  nnoremap <silent> [unite]o :<C-u>Unite
  \ -no-quit -keep-focus -no-start-insert
  \ -vertical -direction=botright -winwidth=40 outline<CR>
  " Fold
  nnoremap <silent> [unite]z :<C-u>Unite -silent fold -vertical -winwidth=40 -no-start-insert<CR>
  " Unite Beautiful Atack
  nnoremap <silent> [unite]C :<C-u>Unite -auto-preview colorscheme<CR>
  " Git repository
  nnoremap <silent> [unite]<Space> :<C-u>Unite file_rec/async:! -start-insert<CR>
  nnoremap <silent> <Space><Space> :<C-u>Unite file_rec/git -start-insert<CR>
  " runtimepath
  nnoremap <silent> [unite]v :<C-u>Unite runtimepath -start-insert -default-action=vimshell<CR>
  " neobundle
  nnoremap <silent> [unite]n :<C-u>Unite neobundle -start-insert -default-action=vimshell<CR>
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
  \       'giti',
  \       'giti/status'
  \     ],
  \   }
  \ })
  call neobundle#untap()
  nnoremap <silent> [unite]gg :<C-u>Unite giti/status -winheight=10
  \   -no-start-insert -no-quit<CR>
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
" moznion/unite-git-conflict {{{
if neobundle#tap('unite-git-conflict')
  " Config {{{
  call neobundle#config({
  \   'autoload' : {
  \     'unite_sources' : [
  \       'git-conflict',
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
" Shougo/unite-session {{{
if neobundle#tap('unite-session')
  " Config {{{
  call neobundle#config({
  \   'autoload' : {
  \     'unite_sources' : [
  \       'session',
  \     ],
  \   }
  \ })
  " }}}
  call neobundle#untap()
endif
" }}}
" osyo-manga/unite-vimpatches {{{
if neobundle#tap('unite-vimpatches')
  " Config {{{
  call neobundle#config({
  \   'autoload' : {
  \     'unite_sources' : [
  \       'vimpatches',
  \     ],
  \   }
  \ })
  " }}}
  call neobundle#untap()
endif
" }}}
" tsukkee/unite-tag {{{
if neobundle#tap('unite-tag')
  " Config {{{
  call neobundle#config({
  \   'autoload' : {
  \     'unite_sources' : [
  \       'tag',
  \     ],
  \   }
  \ })
  " }}}
  call neobundle#untap()
endif
" }}}

" action
" osyo-manga/ref-lynx {{{
if neobundle#tap('ref-lynx')
  " Config {{{
  call neobundle#config({
  \   'autoload' : {
  \     'unite_sources' : [
  \       'ref-lynx',
  \     ],
  \   }
  \ })
  " }}}
  " call unite#custom#default_action('uri', 'ref-lynx')

  call neobundle#untap()
endif
" }}}
" haya14busa/unite-action-vimfiler_lcd {{{
if neobundle#tap('unite-action-vimfiler_lcd')
  call neobundle#config({'depends' : 'Shougo/unite.vim'})
  call neobundle#untap()
endif
" }}}
" osyo-manga/unite-vital-module {{{
if neobundle#tap('unite-vital-module')
  " Config {{{
  call neobundle#config({
  \   'autoload' : {
  \     'unite_sources' : [
  \       'vital-module',
  \     ],
  \   }
  \ })
  " }}}
  call neobundle#untap()
endif
" }}}

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

    AutocmdFT vimfiler call <SID>my_vimfiler_settings()

    function! <SID>my_vimfiler_settings()
      nmap <buffer>' <Plug>(vimfiler_toggle_mark_current_line)
      xmap <buffer>' <Plug>(vimfiler_toggle_mark_selected_lines)
      noremap <buffer> t :call vimfiler#mappings#do_action('tabopen')<CR>
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
  \       { 'name' : 'VimShellCreate',
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

    "prioratise snippet
    call neocomplete#custom#source('neosnippet', 'rank', 400)

    snoremap <Esc> <Esc>:NeoSnippetClearMarkers<CR>
  endfunction "}}}

  " haya14busa-snippets {{{
  let g:neosnippet#snippets_directory=$HOME.'/.vim/mybundle/haya14busa-snippets/neosnippets'
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

    " Set neosnippet competion length.
    call neocomplete#custom#source('neosnippet', 'min_pattern_length', 1)

    let g:neocomplete#disable_auto_select_buffer_name_pattern =
    \ '\[Command Line\]'

    " Enable omni completion.
    AutocmdFT css setlocal omnifunc=csscomplete#CompleteCSS
    AutocmdFT html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    AutocmdFT javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    AutocmdFT coffee setlocal omnifunc=javascriptcomplete#CompleteJS
    AutocmdFT xml setlocal omnifunc=xmlcomplete#CompleteTags
    AutocmdFT python setlocal omnifunc=jedi#completions

    if !exists('g:neocomplete#force_omni_input_patterns')
      let g:neocomplete#force_omni_input_patterns = {}
    endif
    let g:jedi#auto_vim_configuration = 0
    let g:neocomplete#sources#omni#input_patterns = {
    \ 'ruby' : '[^. *\t]\.\w*\|\h\w*::',
    \}
    let g:neocomplete#force_omni_input_patterns = {
    \ 'python': '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
    \}
    " \ 'ruby' : '[^. *\t]\.\|\h\w*::',
    let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scala' : $HOME.'/.vim/myplugin/vim-scala-dict/dict/scala.dict',
    \ }
  endfunction
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1

  " Plugin key-mappings.
  inoremap <expr><C-g>     neocomplete#undo_completion()
  inoremap <expr><C-l>     neocomplete#complete_common_string()

  " <Tab>: completion
  " inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  " inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

  " <C-f>, <C-b>: page move.
  " inoremap <expr><C-f>  pumvisible() ? "\<PageDown>" : "\<Right>"
  " inoremap <expr><C-b>  pumvisible() ? "\<PageUp>"   : "\<Left>"
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
  \     'mappings' : ['<Plug>(quickrun)'],
  \   }
  \ })
  function! neobundle#tapped.hooks.on_source(bundle)
    let g:quickrun_config = {
    \   "_" : {
    \       "runner" : "vimproc",
    \       "runner/vimproc/updatetime" : 500
    \   },
    \   "watchdogs_checker/_" : {
    \       'outputter/quickfix/open_cmd' : '',
    \   },
    \ 'vimspec' : {
    \   'command' : 'themis',
    \   'cmdopt'  : '--runtimepath ".." --runtimepath ~/.vim/bundle/vital.vim',
    \   'exec'    : '%c %o %s:p | tr -d "\r"'
    \ }
    \}
    " \       "runner/vimproc/updatetime" : 60
    let g:quickrun_config.markdown = {
    \ 'type': 'markdown/pandoc',
    \ 'cmdopt': '-s',
    \ 'outputter': 'browser'
    \ }
    let g:quickrun_config['python/watchdogs_checker'] = {
    \ 'type' : 'watchdogs_checker/flake8',
    \}
  endfunction
  nnoremap <Leader>q  <Nop>
  nnoremap <silent><Leader>qr :<C-u>QuickRun<CR>
  vnoremap <silent><Leader>qr :QuickRun<CR>
  nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

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
  \         'complete': 'customlist,ref#complete'},],
  \     'unite_sources' : ['ref'],
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
    let g:ref_alc_encoding = 'utf-8'
  endfunction
  call neobundle#untap()
endif
"}}}

" cohama/agit.vim {{{
if neobundle#tap('agit.vim')
  call neobundle#config({
  \ 'depends': ['tpope/vim-fugitive'],
  \ 'autoload': {
  \   'commands' : ['Agit']
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
  \       'scss',
  \       'styl',
  \       'xml',
  \       'xls',
  \       'markdown',
  \       'htmldjango',
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
  \       'EasyMotion#JK',
  \       'EasyMotion#is_active',
  \     ],
  \   }
  \ })
  function! neobundle#tapped.hooks.on_post_source(bundle) "{{{
    EMCommandLineNoreMap <Space> <CR>
    EMCommandLineNoreMap <C-j> <Space>
    if ! g:EasyMotion_do_shade
      highlight! link EasyMotionIncSearch IncSearch
    endif
    highlight! link EasyMotionMoveHL Search
  endfunction "}}}
  function! neobundle#tapped.hooks.on_source(bundle) "{{{
    " EasyMotion Config {{{
    let g:EasyMotion_do_mapping = 0
    " let g:EasyMotion_keys = ';HKLYUIOPNM,QWERTZXCVBASDGJF'
    let g:EasyMotion_keys = ';HKLYUIONM,WERTXCVBASDGJF'
    " Do not shade
    let g:EasyMotion_do_shade = 0
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
    " let g:EasyMotion_enter_jump_first = 1
    let g:EasyMotion_space_jump_first = 1
    " Prompt
    let g:EasyMotion_prompt = '{n}> '
    " Highlight cursor
    " let g:EasyMotion_cursor_highlight = 1
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
  nmap s <Plug>(easymotion-s2)
  vmap s <Plug>(easymotion-s2)
  omap z <Plug>(easymotion-s2)

  " Replace defaut
  " smart f & F
  omap f <Plug>(easymotion-bd-fl)
  xmap f <Plug>(easymotion-bd-fl)
  omap F <Plug>(easymotion-Fl)
  xmap F <Plug>(easymotion-Fl)
  omap t <Plug>(easymotion-tl)
  xmap t <Plug>(easymotion-tl)
  omap T <Plug>(easymotion-Tl)
  xmap T <Plug>(easymotion-Tl)

  " Extend hjkl
  map ;h <Plug>(easymotion-linebackward)
  map ;j <Plug>(easymotion-j)
  map ;k <Plug>(easymotion-k)
  map ;l <Plug>(easymotion-lineforward)

  " move to next/previous last motion match
  nmap <expr> <C-n> yankround#is_active() ?
  \ '<Plug>(yankround-next)' : '<Plug>(easymotion-next)'
  nmap <expr> <C-p> yankround#is_active() ?
  \ '<Plug>(yankround-prev)' : '<Plug>(easymotion-prev)'
  xmap <C-n> <Plug>(easymotion-next)
  xmap <C-p> <Plug>(easymotion-prev)

  nmap <expr><Tab> EasyMotion#is_active() ?
  \ '<Plug>(easymotion-next)' : '<TAB>'
  nmap <expr>' EasyMotion#is_active() ?
  \ '<Plug>(easymotion-prev)' : "'"

  " Extened word motion
  map  ;w  <Plug>(easymotion-bd-wl)
  map  ;e  <Plug>(easymotion-bd-el)
  omap ;b  <Plug>(easymotion-bl)
  " omap ;ge <Plug>(easymotion-gel)
  map ;ge <Plug>(easymotion-gel)

  function! s:wrap_M()
    let current_line = getline('.')
    keepjumps normal! M
    let middle_line = getline('.')
    if current_line == middle_line
      call EasyMotion#JK(0,2)
    endif
  endfunction
  nnoremap <silent> M :<C-u>call <SID>wrap_M()<CR>
  "}}}

  function! EasyMotionMigemoToggle() "{{{
    if !exists(g:EasyMotion_use_migemo) && g:EasyMotion_use_migemo == 1
      let g:EasyMotion_use_migemo = 0
      echo 'Turn Off migemo'
    else
      let g:EasyMotion_use_migemo = 1
      echo 'Turn On migemo'
    endif
  endfunction
  command! -nargs=0 EasyMotionMigemoToggle :call EasyMotionMigemoToggle() "}}}

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

" clever-f.vim {{{
if neobundle#tap('clever-f.vim')
  call neobundle#config({
  \   'autoload' : {
  \     'mappings' : [['sxno','<Plug>(clever-f-']],
  \   }
  \ })
  function! neobundle#tapped.hooks.on_source(bundle) "{{{
    let g:clever_f_not_overwrites_standard_mappings = 1
    let g:clever_f_smart_case = 1
    let g:clever_f_across_no_line = 1
  endfunction "}}}
  nmap f <Plug>(clever-f-f)
  nmap F <Plug>(clever-f-F)
endif
"}}}

" TextObject Keymaps{{{
" vim-textobj-entire {{{
if neobundle#tap('vim-textobj-entire')
  call neobundle#config({
  \ 'depends' : 'kana/vim-textobj-user',
  \ 'autoload' : {
  \       'mappings' : [['xo', 'ae'], ['xo', 'ie']]
  \   }
  \ })
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
  call neobundle#untap()
endif
" }}}
" vim-textobj-number {{{
if neobundle#tap('vim-textobj-number')
  call neobundle#config({
  \ 'depends' : 'kana/vim-textobj-user',
  \ 'autoload' : {
  \       'mappings' : [['xo', 'an'], ['xo', 'in']]
  \   }
  \ })
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
  call neobundle#untap()
endif
" }}}

"}}}

" kana/vim-operator-replace "{{{
if neobundle#tap('vim-operator-replace')
  call neobundle#config({
  \ 'depends' : 'kana/vim-operator-user',
  \   'autoload' : {
  \     'mappings' : '<Plug>(operator-replace)'
  \   }
  \ })
  nmap ;R  <Plug>(operator-replace)
  vmap p <Plug>(operator-replace)
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

" osyo-manga/vim-anzu {{{
if neobundle#tap('vim-anzu')
  call neobundle#config({
  \   'autoload' : {
  \     'mappings' : ['<Plug>(anzu-'],
  \   }
  \ })
  " nmap n <Plug>(anzu-n)zzzv
  " nmap N <Plug>(anzu-N)zzzv
  nmap * <Plug>(anzu-star-with-echo)
  " nmap # <Plug>(anzu-sharp-with-echo)

  " Clear hit count when nokeyinput, move window, or move tab
  Autocmd CursorHold,CursorHoldI,WinLeave,TabLeave
  \   * call anzu#clear_search_status()
  call neobundle#untap()
endif
"}}}

" Yggdroot/indentLine {{{
if neobundle#tap('indentLine')
  let g:indentLine_color_term = 239
  Autocmd InsertEnter * IndentLinesDisable
  Autocmd InsertLeave * IndentLinesEnable
  call neobundle#untap()
endif
" }}}

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

" tyru/open-browser-github {{{
if neobundle#tap('open-browser-github.vim')
  " Config {{{
  call neobundle#config({
  \   'depends' :
  \     ['tyru/open-browser.vim'],
  \   'autoload' : {
  \     'commands' : [
  \       'OpenGithubFile', 'OpenGithubIssue', 'OpenGithubPullReq'
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
  \   'anzu': 'anzu#search_status',
  \ }
  \ }
  "}}}

  function! neobundle#tapped.hooks.on_source(bundle) "{{{
    let g:unite_force_overwrite_statusline = 0
    let g:vimfiler_force_overwrite_statusline = 0
    let g:vimshell_force_overwrite_statusline = 0
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
  nmap ]c <plug>(signify-next-hunk)
  nmap [c <plug>(signify-prev-hunk)
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
    " let g:yankround_use_region_hl = 1
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
    let g:tweetvim_display_icon   = 1
    let g:tweetvim_async_post = 1
    let g:tweetvim_tweet_per_page = 200
    let g:tweetvim_cache_size     = 200
    let g:tweetvim_empty_separator = 1
    setlocal colorcolumn=0
    AutocmdFT tweetvim setlocal nonumber
    AutocmdFT tweetvim nnoremap <buffer><Leader>s :<C-u>TweetVimSay<CR>
    AutocmdFT tweetvim     nmap <buffer>c         <Plug>(tweetvim_action_in_reply_to)
  endfunction "}}}
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
  \       'Puyo', 'PuyoTeto'
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
  call neobundle#untap()
endif
"}}}

" vim-submode {{{
if neobundle#tap('vim-submode')
  call neobundle#config({})

  function! neobundle#tapped.hooks.on_source(bundle)
    let g:submode_keep_leaving_key = 1
  endfunction

  " Resize window
  call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
  call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
  call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>+')
  call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>-')
  call submode#map('winsize', 'n', '', '>', '<C-w>3>')
  call submode#map('winsize', 'n', '', '<', '<C-w>3<')
  call submode#map('winsize', 'n', '', '+', '<C-w>3+')
  call submode#map('winsize', 'n', '', '-', '<C-w>3-')

  function! s:my_x()
    undojoin
    normal! "_x
  endfunction
  nnoremap <silent> <Plug>(my-x) :<C-u>call <SID>my_x()<CR>
  call submode#enter_with('my_x', 'n', '', 'x', '"_x')
  call submode#map('my_x', 'n', 'r', 'x', '<Plug>(my-x)')

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
  " TODO:
  " Count Up Function {{{
  " nnoremap <silent> <Leader>co :ContinuousNumber <C-a><CR>
  vnoremap <silent> <Leader>co :ContinuousNumber <C-a><CR>
  command! -count -nargs=1 ContinuousNumber let s:c = col('.')|for s:n in range(1, <count>?<count>-line('.'):1)|exec 'normal! j' . s:n . <q-args>|call cursor('.', s:c)|endfor
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
  call neobundle#untap()
endif
"}}}

" tell-k/vim-autopep8 {{{
if neobundle#tap('vim-autopep8')
  call neobundle#config({
  \ "autoload": {
  \   "filetypes": ["python", "python3", "djangohtml"],
  \   "commands": ["Autopep8"],
  \   }
  \ })
  call neobundle#untap()
  let g:no_autopep8_maps = 1
  command! -bar Autopep8 call Autopep8()
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
    let g:SimpylFold_docstring_preview = 1
  endfunction
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
    let g:J6uil_empty_separator = 1
    AutocmdFT J6uil call s:J6uil_settings()
    function! s:J6uil_settings()
      nunmap <buffer> s
      setlocal colorcolumn=0
      nmap <buffer> <Leader>s <Plug>(J6uil_open_say_buffer)
    endfunction
  endfunction "}}}
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
    let g:calendar_date_endian = 'big'

    AutocmdFT calendar call s:init_calendar()
    function! s:init_calendar() "{{{
      nmap <buffer>l <Plug>(calendar_next)
      nmap <buffer>h <Plug>(calendar_prev)
      nmap <buffer>e <Plug>(calendar_event)
      highlight clear TrailingSpaces
    endfunction "}}}
  endfunction "}}}
  call neobundle#untap()
endif
" }}}

" osyo-manga/vim-watchdogs {{{
if neobundle#tap('vim-watchdogs')
  " Config {{{
  call neobundle#config({
  \   'depends' : [
  \       'thinca/vim-quickrun',
  \       'Shougo/vimproc',
  \       'osyo-manga/shabadou.vim',
  \       'jceb/vim-hier',
  \       'dannyob/quickfixstatus',
  \   ],
  \ })
  " }}}
  function! neobundle#tapped.hooks.on_source(bundle) "{{{
    let g:watchdogs_check_BufWritePost_enable = 1
    let g:watchdogs_check_CursorHold_enable = 1
    let g:watchdogs_check_BufWritePost_enables = {
    \   "scala" : 0
    \}
    let g:watchdogs_check_CursorHold_enables = {
    \   "scala" : 0
    \}
    call watchdogs#setup(g:quickrun_config)
  endfunction "}}}
  augroup source-watchdogs
    autocmd!
    autocmd BufWritePre * NeoBundleSource vim-watchdogs
    \       autocmd! source-watchdogs *
  augroup END
  call neobundle#untap()
endif
" }}}

" kana/vim-vspec {{{
if neobundle#tap('vim-vspec')
  Autocmd BufRead,BufNew,BufNewFile *_spec.vim NeoBundleSource vim-vspec
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
  call neobundle#untap()
endif
" }}}

" vim-jp/vital.vim {{{
if neobundle#tap('vital.vim')
  " Config {{{
  call neobundle#config({
  \   'autoload' : {
  \     'commands' : ['Vitalize'],
  \     'functions' : ['vital#of', 'vital'],
  \   }
  \ })
  " }}}
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
  call neobundle#untap()
endif
" }}}

" thinca/vim-threes {{{
if neobundle#tap('vim-threes')
  " Config {{{
  call neobundle#config({
  \   'autoload' : {
  \     'commands' : [
  \       'ThreesStart',
  \     ],
  \   }
  \ })
  " }}}
  call neobundle#untap()
endif
" }}}

" welle/targets.vim {{{
if neobundle#tap('targets.vim')
  " Disable `n` , `l` , `A`
  let g:targets_aiAI = 'ai I'
  let g:targets_nlNL = '  NL'
  call neobundle#untap()
endif
" }}}

" kannokanno/previm {{{
if neobundle#tap('previm')
  " Config {{{
  call neobundle#config({
  \   'depends': ['tyru/open-browser.vim'],
  \   'autoload' : {
  \     'filetypes' : [
  \       'markdown',
  \     ],
  \     'commands' : [
  \       'PrevimOpen',
  \     ],
  \   }
  \ })
  " }}}
  let g:previm_custom_css_path = '~/.config/vim/previm/style.css'
  call neobundle#untap()
endif
" }}}

" maksimr/vim-jsbeautify {{{
if neobundle#tap('vim-jsbeautify')
  " Config {{{
  call neobundle#config({
  \   'autoload' : {
  \     'filetypes' : [
  \       'javascript',
  \     ],
  \   }
  \ })
  " }}}
  call neobundle#untap()
endif
" }}}

" derekwyatt/vim-scala {{{
if neobundle#tap('vim-scala')
  " Config {{{
  call neobundle#config({
  \   'autoload' : {
  \     'filetypes' : [
  \       'scala',
  \     ],
  \   }
  \ })
  " }}}
  call neobundle#untap()
endif
" }}}

" derekwyatt/vim-sbt {{{
if neobundle#tap('vim-sbt')
  " Config {{{
  call neobundle#config({
  \   'autoload' : {
  \     'filetypes' : [
  \       'sbt',
  \     ],
  \   }
  \ })
  " }}}
  call neobundle#untap()
endif
" }}}

" mdreves/vim-scaladoc {{{
if neobundle#tap('vim-scaladoc')
  " Config {{{
  call neobundle#config({
  \   'autoload' : {
  \     'filetypes' : [
  \       'scala',
  \     ],
  \   }
  \ })
  " }}}
  function! neobundle#tapped.hooks.on_source(bundle) "{{{
    AutocmdFT scala nnoremap <buffer> K :<C-u>call scaladoc#Search(expand("<cword>"))<CR>
  endfunction "}}}
  call neobundle#untap()
endif
" }}}

" gre/play2vim {{{
if neobundle#tap('play2vim')
  " Config {{{
  call neobundle#config({
  \   'depends' : 'derekwyatt/vim-scala',
  \   'autoload' : {
  \     'filetypes' : [
  \       'scala', 'play2-html', 'play2-conf', 'play2-routes'
  \     ],
  \   }
  \ })
  " }}}
  Autocmd BufRead,BufNewFile *.scala.html set filetype=html syntax=play2-html
  Autocmd BufRead,BufNewFile */conf/\(*\|\)routes set filetype=play2-routes
  Autocmd BufRead,BufNewFile */conf/*.conf setf play2-conf
  Autocmd BufRead,BufNewFile plugins.sbt set filetype=scala
  call neobundle#untap()
endif
" }}}

" plasticboy/vim-markdown {{{
if neobundle#tap('vim-markdown')
  " Config {{{
  call neobundle#config({
  \   'autoload' : {
  \     'filetypes' : [
  \       'markdown',
  \     ],
  \   }
  \ })
  " }}}
  function! neobundle#tapped.hooks.on_source(bundle) "{{{
    let g:markdown_no_default_key_mappings = 1
    AutocmdFT markdown nmap <buffer> ]] <Plug>(Markdown_MoveToNextHeader)
    AutocmdFT markdown nmap <buffer> [[ <Plug>(Markdown_MoveToPreviousHeader)
  endfunction "}}}
  call neobundle#untap()
endif
" }}}

" vim-jp/autofmt {{{
if neobundle#tap('autofmt')
  function! neobundle#tapped.hooks.on_source(bundle) "{{{
    set formatexpr=autofmt#compat#formatexpr()
  endfunction "}}}
  call neobundle#untap()
endif
" }}}

" ujihisa/neco-look {{{
if neobundle#tap('neco-look')
  " Config {{{
  call neobundle#config({
  \   'depends' : 'Shougo/neocomplete.vim',
  \   'disabled': !executable('look'),
  \   'autoload' : {
  \     'filetypes' : [
  \       'markdown',
  \       'gitcommit',
  \     ],
  \   }
  \ })
  " }}}
  AutocmdFT gitcommit NeoBundleSource neco-look
  function! neobundle#tapped.hooks.on_post_source(bundle)
    "only show 5 candidates
    call neocomplete#custom#source('look', 'max_candidates', 5)
  endfunction
  call neobundle#untap()
endif
" }}}

" mkomitee/vim-gf-python {{{
if neobundle#tap('vim-gf-python')
  " Config {{{
  call neobundle#config({
  \   'autoload' : {
  \     'filetypes' : [
  \       'python',
  \     ],
  \   }
  \ })
  " }}}
  call neobundle#untap()
endif
" }}}

" osyo-manga/vim-precious {{{
if neobundle#tap('vim-precious')
  " Config {{{
  call neobundle#config({
  \   'depends' : [
  \       'Shougo/context_filetype.vim',
  \       'kana/vim-textobj-user'
  \   ],
  \   'autoload' : {
  \     'filetypes' : [
  \       'markdown',
  \     ],
  \     'commands' : [
  \       'PreciousSwitch', 'PreciousReset'
  \     ]
  \   }
  \ })
  " }}}
  " precious quickrun
  AutocmdFT markdown nmap <buffer> ;pqr <Plug>(precious-quickrun-op)
  AutocmdFT markdown omap <buffer> q <Plug>(textobj-precious-i)

  let g:precious_enable_switchers = {
  \   "*" : {
  \       "setfiletype" : 0
  \   },
  \   "markdown" : {
  \       "setfiletype" : 1
  \   },
  \}

  let g:precious_enable_switch_CursorMoved = {
  \   "*" : 0
  \}
  let g:precious_enable_switch_CursorMoved_i = {
  \   "*" : 0
  \}

  augroup precious_insert
    autocmd!
    autocmd InsertEnter * :PreciousSwitch
    autocmd InsertLeave * :PreciousReset
  augroup END

  call neobundle#untap()
endif
" }}}

" itchyny/screensaver.vim {{{
if neobundle#tap('screensaver.vim')
  " Config {{{
  call neobundle#config({
  \   'autoload' : {
  \     'commands' : [
  \       'ScreenSaver',
  \     ],
  \   }
  \ })
  " }}}
  call neobundle#untap()
endif
" }}}

" thinca/vim-qfreplace {{{
if neobundle#tap('vim-qfreplace')
  " Config {{{
  call neobundle#config({
  \   'autoload' : {
  \     'filetypes' : [ 'unite', 'quickfix'],
  \   }
  \ })
  " }}}
  call neobundle#untap()
endif
" }}}

" haya14busa/unite-ghq {{{
if neobundle#tap('unite-ghq')
  call neobundle#config({
  \   'autoload' : {
  \     'unite_sources' : [
  \       'ghq',
  \     ],
  \   }
  \ })
  nnoremap go :<C-u>Unite ghq<CR>
  call neobundle#untap()
endif
" }}}

" rhysd/committia {{{
if neobundle#tap('committia.vim')
  let g:committia_min_window_width = '140'
  let g:committia_hooks = {}
  function! g:committia_hooks.edit_open(info)
    setlocal spell
    " If no commit message, start with insert mode
    if getline(1) ==# ''
      startinsert
    end
    imap <buffer><C-j> <Plug>(committia-scroll-diff-down-half)
    imap <buffer><C-k> <Plug>(committia-scroll-diff-up-half)
  endfunction
  call neobundle#untap()
endif
" }}}

" haya14busa/endtagcomment.vim {{{
if neobundle#tap('endtagcomment.vim')
  " Config {{{
  call neobundle#config({
  \   'autoload' : {
  \     'mappings' : ['<Plug>(endtagcomment)'],
  \   }
  \ })
  " }}}
  function! neobundle#tapped.hooks.on_source(bundle) "{{{
    let g:endtagcommentFormat = '<!-- /{%tag_name}{%id}{%class} -->'
  endfunction "}}}
  nmap ,t <Plug>(endtagcomment)
  call neobundle#untap()
endif
" }}}

" rhysd/unite-zsh-cdr.vim {{{
if neobundle#tap('unite-zsh-cdr.vim')
  " Config {{{
  call neobundle#config({
  \   'autoload' : {
  \     'unite_sources' : [
  \       'unite-zsh-cdr.vim',
  \     ],
  \   }
  \ })
  " }}}
  call neobundle#untap()
endif
" }}}

" haya14busa/unite-reading-vimrc {{{
if neobundle#tap('unite-reading-vimrc')
  " Config {{{
  call neobundle#config({
  \   'autoload' : {
  \     'unite_sources' : [
  \       'reading-vimrc',
  \     ],
  \   }
  \ })
  " }}}
  call neobundle#untap()
endif
" }}}

" Leafcage/foldCC {{{
if neobundle#tap('foldCC')
  call neobundle#config({})
  set foldmethod=marker
  set foldtext=FoldCCtext()
  set foldcolumn=0
  set fillchars=vert:\|
  noremap [fold]g :<C-u>echo foldCC#navi()<CR>
  call neobundle#untap()
endif " }}}

" haya14busa/unite-historia {{{
if neobundle#tap('unite-historia')
  " Config {{{
  call neobundle#config({
  \   'depends' : ['Shougo/unite.vim'],
  \   'autoload' : {
  \     'unite_sources' : [
  \       'historia/', 'historia/new'
  \     ],
  \   }
  \ })
  " }}}
  nnoremap <silent> ;<C-r> :<C-u>Unite historia/new historia/command
  \   -direction=botright
  \   -hide-source-names<CR>
  call neobundle#untap()
endif
" }}}

" osyo-manga/vim-brightest {{{
if neobundle#tap('vim-brightest')
  " Config {{{
  call neobundle#config({
  \   'autoload' : {
  \     'commands' : ['BrightestEnable'],
  \   }
  \ })
  " }}}

  augroup load_brightest
    autocmd!
    autocmd CursorMoved * NeoBundleSource vim-brightest
    autocmd CursorMoved * autocmd! load_brightest *
  augroup END

  function! neobundle#tapped.hooks.on_source(bundle) "{{{
    let g:brightest#highlight = {
    \   'group' : 'BrightestUnderline',
    \   'priority' : -1
    \}
    let g:brightest#pattern = '\w\+'
  endfunction "}}}

  call neobundle#untap()
endif
" }}}

" mattn/disableitalic-vim {{{
if neobundle#tap('disableitalic-vim')
  " Config {{{
  call neobundle#config({
  \   'autoload' : {
  \     'commands' : [
  \       'DisableItalic',
  \     ],
  \   }
  \ })
  " }}}
  function! neobundle#tapped.hooks.on_source(bundle) "{{{
    " TODO: autocmd for Colorscheme if it's gVim
  endfunction "}}}
  call neobundle#untap()
endif
" }}}

" rhysd/vim-grammarous {{{
if neobundle#tap('vim-grammarous')
  " Config {{{
  call neobundle#config({
  \   'autoload' : {
  \     'commands' : [
  \       'GrammarousCheck',
  \     ],
  \     'mappings' : [
  \       '<Plug>',
  \     ],
  \   }
  \ })
  " }}}
  function! neobundle#tapped.hooks.on_source(bundle) "{{{
    let g:grammarous#enable_spell_check = 1
  endfunction "}}}
  call neobundle#untap()
endif
" }}}

" haya14busa/incsearch.vim {{{
if neobundle#tap('incsearch.vim')
  function! neobundle#tapped.hooks.on_post_source(bundle) "{{{
    augroup incsearch
      autocmd!
      autocmd User IncSearchEnter BrightestDisable
      autocmd User IncSearchLeave BrightestEnable
    augroup END
  endfunction "}}}

  augroup incsearch-easymotion
    autocmd!
    autocmd User IncSearchEnter autocmd! incsearch-easymotion-impl
  augroup END
  augroup incsearch-easymotion-impl
    autocmd!
  augroup END

  function! IncsearchEasyMotion() abort
    autocmd incsearch-easymotion-impl User IncSearchExecute :silent! call EasyMotion#Search(0, 2, 0)
    return "\<CR>"
  endfunction
  let g:incsearch_cli_key_mappings = {
  \   "\<C-q>": {
  \       'key': 'IncsearchEasyMotion()',
  \       'noremap': 1,
  \       'expr': 1
  \   }
  \ }

  " Setting {{{
  " let g:incsearch#highlight = {
  " \   'match' : {
  " \       'group' : 'IncSearchUnderline'
  " \   }
  " \ }
  map / <Plug>(incsearch-forward)
  map ? <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)
  noremap ;/ /
  noremap ;? ?
  highlight IncSearchCursor ctermfg=0 ctermbg=9 guifg=#000000 guibg=#FF0000

  let g:incsearch#auto_nohlsearch = 1
  " let g:incsearch#consistent_n_direction = 1
  let g:incsearch#do_not_save_error_message_history = 1
  map  n <Plug>(incsearch-nohl)<Plug>(anzu-n-with-echo)
  map  N <Plug>(incsearch-nohl)<Plug>(anzu-N-with-echo)
  map  n <Plug>(incsearch-nohl-n)
  map  N <Plug>(incsearch-nohl-N)
  nmap n <Plug>(incsearch-nohl)<Plug>(anzu-n-with-echo)
  nmap N <Plug>(incsearch-nohl)<Plug>(anzu-N-with-echo)

  noremap <expr> ;<Tab>   incsearch#go({'command': '/', 'pattern': histget('/', -1)})
  noremap <expr> ;<S-Tab> incsearch#go({'command': '?', 'pattern': histget('/', -1)})

  "}}}
  call neobundle#untap()
endif
" }}}

" haya14busa/vim-asterisk {{{
if neobundle#tap('vim-asterisk')
  call neobundle#untap()
  let g:asterisk#keeppos = 1

  " map *  <Plug>(incsearch-nohl4)<Plug>(asterisk-z*)
  map *  <Plug>(asterisk-z*)
  map g* <Plug>(incsearch-nohl2)<Plug>(asterisk-gz*)
  map #  <Plug>(incsearch-nohl2)<Plug>(asterisk-z#)
  map g# <Plug>(incsearch-nohl2)<Plug>(asterisk-gz#)

  map z*  <Plug>(incsearch-nohl)<Plug>(asterisk-*)
  map zg* <Plug>(incsearch-nohl)<Plug>(asterisk-g*)
  map z#  <Plug>(incsearch-nohl)<Plug>(asterisk-#)
  map zg# <Plug>(incsearch-nohl)<Plug>(asterisk-g#)
endif
" }}}

" haya14busa/vim-rot47 {{{
if neobundle#tap('vim-rot47')
  call neobundle#config({
  \   'depends' : 'kana/vim-operator-user',
  \   'autoload' : {
  \     'mappings' : [
  \       '<Plug>(operator-rot47)',
  \     ],
  \   }
  \ })
  map g? <Plug>(operator-rot47)
  nmap g?? <Plug>(operator-rot47)<Plug>(textobj-line-i)
  call neobundle#untap()
endif
" }}}

" osyo-manage/vim-monster {{{
if neobundle#tap('vim-monster')
  call neobundle#config({
  \   'autoload' : {
  \     'filetypes' : ['ruby'],
  \   }
  \ })
  " let g:monster#completion#rcodetools#backend = 'async_rct_complete'
  call neobundle#untap()
endif
" }}}

" End plugins }}}

" Misc {{{=========================
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

function! Plog(msg) "{{{
  try
    call vimproc#system('echo "' . strtrans(PP(a:msg)) . '" >> ~/vim.log')
  catch
    call vimproc#system("echo '" . strtrans(a:msg) . "' >> ~/vim.log")
  endtry
  " call Plog(' kokomade OK')
  " tail -f ~/vim.log
endfunction "}}}


command! -bar TimerStart let start_time = reltime()
command! -bar TimerEnd echo reltimestr(reltime(start_time)) | unlet start_time

" Color column
if v:version >= 703
  " For conceal.
  set conceallevel=2 concealcursor=iv
  set colorcolumn=79
endif

let g:loaded_netrwPlugin=1

function! s:open_help_en_jp(args)
  let en = a:args . '@en'
  let ja = a:args . '@ja'
  exec "tab help " . en
  setlocal scrollbind
  split
  exec "help " . ja
  setlocal scrollbind
endfunction
command! -nargs=1 -complete=help Help call <SID>open_help_en_jp("<args>")


" Ref: https://github.com/rhysd/dotfiles/blob/master/vimrc
" Execute a:cmd at first, and rotate cursor within line
let s:smart_line_pos = -1
function! s:smart_move(cmd) "{{{
  let line = line('.')
  if s:smart_line_pos == line . a:cmd
    call <SID>rotate_in_line()
  else
    execute "normal! " . a:cmd
    " Store previous line number and mapping
    let s:smart_line_pos = line . a:cmd
  endif
endfunction "}}}
function! s:rotate_in_line() "{{{
  let c = virtcol('.')

  let cmd = c == 1 ? 'g^' : 'g$'
  execute "normal! ".cmd

  " If there is no space at beginning of line, toggle bol & eol
  if c == virtcol('.')
    if cmd == 'g^'
      normal! g$
    else
      normal! g0
    endif
  endif
endfunction "}}}
" Toggle 0, ^, $
" nnoremap <silent> 0 :<C-u>call <SID>smart_move('g0')<CR>

function! s:my_HL(motion) "{{{
  let current_line = line('.')
  let flag_line = a:motion == 'H' ? line('w0') : line('w$')
  if current_line == flag_line && v:count == 0
    " let middle_line = (line('w$') - line('w0')) / 2 + line('w0')
    let middle_line = (line('w$') - line('w0') + 1) / 4 + 1
    exec "normal! " . middle_line . a:motion
  else
    exec "normal! " . v:count . a:motion
  endif
endfunction "}}}
nnoremap <silent> L :call <SID>my_HL('L')<CR>
nnoremap <silent> H :call <SID>my_HL('H')<CR>

function! s:my_gm()
  let current_line = {}
  let current_line.num = line('.')
  function! current_line.getline()
    return getline(self.num)
  endfunction
  let current_line.len = strlen(current_line.getline())
  let current_line.disp_len = strdisplaywidth(current_line.getline())
  call cursor(current_line.num, current_line.len / 2)
endfunction
nnoremap <silent> gm :<C-u>call <SID>my_gm()<CR>

command! -nargs=0 GetHighlightingGroup
\ echom 'hi<' . synIDattr(synID(line('.'),col('.'),1),'name') . '>trans<'
\ . synIDattr(synID(line('.'),col('.'),0),'name') . '>lo<'
\ . synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name') . '>'

" Rename file
" http://vim-users.jp/2009/05/hack17/
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))

" Change current directory.
" http://vim-users.jp/2009/09/hack69/
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>')
function! s:ChangeCurrentDir(directory, bang) "{{{
  if a:directory == ''
    lcd %:p:h
  else
    execute 'lcd' . a:directory
  endif

  if a:bang == ''
    pwd
  endif
endfunction "}}}

" SplitAndGo {{{
command! -count=1 -nargs=1 -complete=customlist,SAG_Complete SplitAndGo call SplitAndGo(<q-args>)

function! SplitAndGo(cmd)
  let cnt = v:count
  let cmd = a:cmd ==# 'split' ? 'topleft ' . a:cmd : 'botright ' . a:cmd

  execute cmd
  if cnt > 0
    execute "normal! " . cnt . 'G'
  endif
endfunction

function! SAG_Complete()
  return ['split', 'vsplit']
endfunction

nnoremap _ :SplitAndGo split<CR>
nnoremap <bar> :SplitAndGo vsplit<CR>

function! s:norelativenumber()
  augroup restore_op
    autocmd!
    autocmd CursorMoved * setlocal norelativenumber
    autocmd CursorMoved * augroup restore_op | execute "autocmd!" | execute "augroup END"
    autocmd CursorHold * setlocal norelativenumber
    autocmd CursorHold * augroup restore_op | execute "autocmd!" | execute "augroup END"
  augroup END
  return ""
endfunction

function! s:ToggleRelativeNumber()
  if &relativenumber
    set norelativenumber
    let &number = exists("b:togglernu_number") ? b:togglernu_number : 1
  else
    let b:togglernu_number = &number
    set relativenumber
  endif
  redraw! " these two lines required for omap
  return ''
endfunction

nnoremap <silent> <Leader>m :call <SID>ToggleRelativeNumber()<CR>
" vnoremap <silent> m :<C-U>call <SID>ToggleRelativeNumber()<CR>gv
onoremap <expr> m <SID>ToggleRelativeNumber() . <SID>norelativenumber()

"}}}

command! Date :call setline('.', getline('.') . strftime('%Y/%m/%d (%a) %H:%M'))

" file encoding & line feed code {{{
command! -bang -bar -complete=file -nargs=? Utf8
\   edit<bang> ++enc=utf-8 <args>
command! -bang -bar -complete=file -nargs=? Iso2022jp
\   edit<bang> ++enc=iso-2022-jp <args>
command! -bang -bar -complete=file -nargs=? Cp932
\   edit<bang> ++enc=cp932 <args>
command! -bang -bar -complete=file -nargs=? Euc
\   edit<bang> ++enc=euc-jp <args>
command! -bang -bar -complete=file -nargs=? Utf16
\   edit<bang> ++enc=utf-16le <args>
command! -bang -bar -complete=file -nargs=? Utf16be
\   edit<bang> ++enc=utf-16 <args>
command! -bang -bar -complete=file -nargs=? Unix
\   edit<bang> ++fileformat=unix <args>
command! -bang -bar -complete=file -nargs=? Mac
\   edit<bang> ++fileformat=mac <args>
command! -bang -bar -complete=file -nargs=? Dos
\   edit<bang> ++fileformat=dos <args>
" }}}

" format JSON
command! -range FormatJson <line1>,<line2>!python -m json.tool

command! -bang -nargs=* PluginTest call PluginTest(<bang>0, <q-args>)
function! PluginTest(is_gui, extraCommand)
  let cmd = a:is_gui ? 'gvim' : 'vim'
  let vimrc_path = $HOME . '/.vimrc.min'
  let vimrc = filereadable(vimrc_path) ? vimrc_path : 'NONE'
  let extraCommand = empty(a:extraCommand) ? '' : ' -c "au VimEnter * ' . a:extraCommand . '"'
  silent! execute printf('!%s -u %s -N --cmd "set rtp+=%s" %s'
  \   , cmd, vimrc, getcwd(), extraCommand)
  redraw!
endfunction

nnoremap <C-j> <C-f>nzzzv
nnoremap <C-k> <C-b>Nzzzv

let g:vim_indent_cont = 0

"" Fast vertical scroll
" source: http://qiita.com/kefir_/items/c725731d33de4d8fb096
" Use vsplit mode
if has('vim_starting') && !has('gui_running') && has('vertsplit')
  function! g:EnableVsplitMode()
    " enable origin mode and left/right margins
    let &t_CS = "y"
    let &t_ti = &t_ti . "\e[?6;69h"
    let &t_te = "\e[?6;69l" . &t_te
    let &t_CV = "\e[%i%p1%d;%p2%ds"
    call writefile([ "\e[?6h\e[?69h" ], "/dev/tty", "a")
  endfunction
  " old vim does not ignore CPR
  map <special> <Esc>[3;9R <Nop>
  " new vim can't handle CPR with direct mapping
  " map <expr> ^[[3;3R g:EnableVsplitMode()
  set t_F9=^[[3;3R
  map <expr> <t_F9> g:EnableVsplitMode()
  let &t_RV .= "\e[?6;69h\e[1;3s\e[3;9H\e[6n\e[0;0s\e[?6;69l"
endif

" PR/
" Project root
" -- utilities

" empty('') is undocumented :h empty()
function! s:empty(expr) abort
  return type(a:expr) is# type('') ? a:expr is# '' : empty(a:expr)
endfunction

function! s:lcd(path) abort
  execute 'lcd' fnameescape(a:path)
endfunction

function! s:is_winshell() abort
  return &shell =~? 'cmd' || exists('+shellslash') && !&shellslash
endfunction

" @return normalized path which substitute backslash to slash if on windows
function! s:shellslash(path) abort
  return s:is_winshell() ? substitute(a:path, '\\', '/', 'g') : a:path
endfunction

" is directory pattrn expression like `xxx/` not like 'xxx.txt'?
function! s:is_dir_pattern(pattern) abort
  return a:pattern[len(a:pattern) - 1] is# '/'
endfunction

function! s:cnt_char(str, char) abort
  " NOTE: are there any more efficient way?
  return len(filter(split(a:str, '\zs'), 'v:val is# a:char'))
endfunction

" -- main

" cwd: current working directory
" @rps root patterns
" @return empty string if not found
function! s:project_root_from_cwd(rps) abort
  " rp: normalized root pattern
  for rp in map(copy(a:rps), 's:shellslash(v:val)')
    let level_to_root = 1 + s:cnt_char(rp, '/')
    let Find = s:is_dir_pattern(rp) ? function('finddir') : function('findfile')
    let target = call(Find, [rp, ';'])
    if !s:empty(target)
      return fnamemodify(target, ':p' . repeat(':h', level_to_root))
    endif
  endfor
  return ''
endfunction


" @rps root patterns
" @from directory or file path searching root from (absolute/relative)
" @return project root directory, otherwise empty string if not found
function! s:project_root(rps, from) abort
  let default = '' " for not found
  let dir = isdirectory(a:from) ? a:from : fnamemodify(a:from, ':p:h')
  if !isdirectory(dir) | return default | endif
  let cwd_save = getcwd()
  try
    call s:lcd(dir)
    return s:project_root_from_cwd(a:rps)
  finally
    call s:lcd(cwd_save)
  endtry
  return default
endfunction

" -- public

" rps
let g:root_patterns = ['.git/HEAD', '.git/objects/', '.git/']

function! g:ProjectRoot(...) abort
  return s:project_root(g:root_patterns, get(a:, 1, resolve(expand('%:p'))))
endfunction

" /PR

" NOTE:
"  nnoremap <buffer><nowait> ; ;
"
"}}}

" Finally {{{ ======================
" Installation check.
NeoBundleCheck
if !has('vim_starting')
  call neobundle#call_hook('on_source')
endif
set secure
"}}}
"------------------------------------
" vim: expandtab softtabstop=2 shiftwidth=2 foldmethod=marker
