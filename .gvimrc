if has('gui_macvim')
  set showtabline=2    " タブを常に表示
  set transparency=1   " 透明度
  set imdisable        " IME OFF
  set guioptions-=T    " ツールバー非表示
  set antialias        " アンチエイリアス
  set tabstop=4        " タブサイズ
  set number           " 行番号表示
  set nobackup         " バックアップなし
  set visualbell t_vb= " ビープ音なし

  colorscheme molokai   " カラースキーマ
  set columns=100      " 横幅
  set lines=35         " 行数

  "set nowrapscan       " 検索をファイルの先頭へループしない

  " フォント設定
  "set guifontwide=Osaka:h20
  "set guifont=Osaka-Mono:h22
  set guifontwide=Ricty-Regular:h20
  set guifont=Ricty-Regular:h22


endif
