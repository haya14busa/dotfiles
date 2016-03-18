syntax enable

" tab
set autoindent
set expandtab
set shiftround
set shiftwidth=2
set softtabstop=2
set tabstop=2

" search
set incsearch
set ignorecase
set smartcase
set hlsearch

" tab character
set listchars=tab:▸\ ,
set list

cnoreabbrev w!! w !sudo tee > /dev/null %

for s:vimrc in filter(map(['~/.vimrc', '~/.vim/vimrc'], 'expand(v:val)'), 'filereadable(v:val)')
  execute 'source' s:vimrc
  break
endfor
unlet s:vimrc
