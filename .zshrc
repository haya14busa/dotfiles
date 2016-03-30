# haya14busa's zshrc


# Functions
function exists { which $1 &> /dev/null }

########################################
# Environments
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_PAPER="en_US.UTF-8"
export LC_NAME="en_US.UTF-8"
export LC_ADDRESS="en_US.UTF-8"
export LC_TELEPHONE="en_US.UTF-8"
export LC_MEASUREMENT="en_US.UTF-8"
export LC_IDENTIFICATION="en_US.UTF-8"

# Report execution time more than 1 sec
export REPORTTIME=1

# Enable colors
autoload -Uz colors
colors

# emacs like keybindings
# TODO: try vim mode
bindkey -e

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# プロンプト
# 1行表示
# PROMPT="%~ %# "
# 2行表示
# PROMPT="%{${fg[red]}%}[%n@%m]%{${reset_color}%} %~
# %# "
# PROMPT="%{${fg[red]}%}[haya14busa@%m]%{${reset_color}%} %~ "$'\n'"%# "
local p_name="%(!,root,haya14busa)"
local p_info="%B%F{red}[$p_name@%m]%f%b"
local p_cdir="%~"$'\n'
local p_mark="%B%(!,su#,#)%b"
PROMPT="$p_info $p_cdir$p_mark "


# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

########################################
# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'


########################################
# vcs_info

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    # LANG=ja_JP.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"


########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# = の後はパス名として補完する
setopt magic_equal_subst

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# ヒストリファイルに保存するとき、すでに重複したコマンドがあったら古い方を削除する
setopt hist_save_nodups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 補完候補が複数あるときに自動的に一覧表示する
setopt auto_menu

# 高機能なワイルドカード展開を使用する
setopt extended_glob

########################################
# キーバインド

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

########################################
# エイリアス

alias ls='ls -v'
alias la='ls -a -v'
alias ll='ls -l -v'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

# `-` to cd to the previous directory
-(){cd -}

# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi

# vimlint
alias vimlint='$HOME/.vim/bundle/vim-vimlint/bin/vimlint.sh -l $HOME/.vim/bundle/vim-vimlint -p $HOME/.vim/bundle/vim-vimlparser -e EVL103=1 -e EVL102.l:_=1 autoload'



########################################
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F -v'
        ;;
    linux*)
        #Linux用の設定
        ;;
esac

#alias mvim="mvim --remote-tab-silent"
alias mvim="mvim"
alias vims="vim -u ~/.vimrc_simple"
alias VimFiler="vim +VimFiler"
alias note="mvim $HOME/notes/`date +%Y-%m-%d`.md"
alias say="say >& /dev/null"
alias SayKotoeri2="SayKotoeri2 >& /dev/null"
alias SayKotoeri="SayKotoeri >& /dev/null"
alias tmux="tmux -2"
alias jpm="jpm -b $(which firefox) "

# path to pandoc
PATH=${HOME}/.cabal/bin:$PATH

export PATH=$HOME/Android/adt-bundle-mac-x86_64-20130522/sdk:$PATH
export PATH=$HOME/Android/adt-bundle-mac-x86_64-20130522/sdk/tools:$PATH
export PATH=$HOME/Android/adt-bundle-mac-x86_64-20130522/sdk/platform-tools:$PATH

setopt correct

# for wine
export XMODIFIERS=@im=uim
export GTK_IM_MODULE=uim
export PATH=/Applications/NXWine.app/Contents/Resources/bin:$PATH


# for Python #
export PYTHONSTARTUP=~/.pythonstartup
alias pipallupgrade="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U"
#############

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="/usr/local/opt/ruby/bin:$PATH"

## ドットインストールで学習する ########
# help:lessonコマンドで学習したいレッスンを選び､クリップボードにコピーします｡Vimを閉じると､選択したレッスンがダウンロードされます｡
# 開始したいレッスンを表示する
alias lesson-ls='cd ~/Movies/dt/ && vim lesson.txt'

# 開始したいレッスンをダウンロードする
alias lesson-dl='~/Movies/dt/lesson-dl'

# レッスンを選択し､ダウンロード､再生する
alias lesson='lesson-ls && pbpaste | xargs ./lesson-dl'
########################################

# jakld
# export JAKLD_HOME=$HOME/jakld
# export PATH=$JAKLD_HOME/bin:$PATH
alias jakld='java -jar $HOME/jakld/jakld/jakld.jar'

export PATH=$HOME/bin:$PATH

#rlwrap Gauche
alias gosh='rlwrap gosh'

export IntelliJ=$HOME/Downloads/idea-IC-133.193/
export PATH=$IntelliJ/bin:$PATH
alias intellij='$IntelliJ/bin/idea.sh'

alias g='git'

# Disable <C-s> feature
# stty stop undef
#so as not to be disturbed by Ctrl-S ctrl-Q in terminals:
stty -ixon


export PATH=$HOME/.rbenv/bin:$PATH
# eval "$(rbenv init -)"

# source $HOME/nvm/nvm.sh

# Scala
export SCALA_HOME=/usr/local/scala
export PATH=$PATH:$SCALA_HOME/bin

# SBT
export SBT_HOME=/usr/local/sbt
export PATH=$PATH:$SBT_HOME/bin

# Play framework
export PLAY_HOME=/usr/local/play
export PATH=$PATH:$PLAY_HOME

# Go environment
export GOBIN=$HOME/go/bin
export GOPATH=$HOME
export PATH=$PATH:$GOBIN

# themis
export THEMIS_HOME=${HOME}/.vim/bundle/vim-themis
export PATH=${THEMIS_HOME}/bin/:$PATH

# activator
export PATH=${HOME}/Application/activator-1.3.4/:$PATH

# Anyenv
if [ -d ${HOME}/.anyenv ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    if exists anyenv; then
        eval "$(anyenv init -)"
    fi
fi

# export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
if exists pyenv; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

if exists npm; then
  export PATH=$PATH:`npm bin -g`
fi

# peco
if [ -f ~/.peco/zsh/peco.zsh ] && exists peco; then
  source ~/.peco/zsh/peco.zsh
fi

# zsh plugins
[[ -f ~/src/github.com/rhysd/zsh-bundle-exec/zsh-bundle-exec.zsh ]] && source ~/src/github.com/rhysd/zsh-bundle-exec/zsh-bundle-exec.zsh

#----- cdr
autoload -Uz is-at-least
if is-at-least 4.3.11
then
  autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
  add-zsh-hook chpwd chpwd_recent_dirs
  zstyle ':chpwd:*' recent-dirs-max 5000
  zstyle ':chpwd:*' recent-dirs-default yes
  zstyle ':completion:*' recent-dirs-insert both
fi

# http://qiita.com/mollifier/items/7b1cfe609a7911a69706
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
EDITOR='/usr/local/bin/vim'
if exists vim; then
  EDITOR=$(which vim)
fi

if exists xmodmap; then
  xmodmap $HOME/.Xmodmap 2> /dev/null
fi

if exists direnv; then
  eval "$(direnv hook zsh)"
fi

if [ -f $HOME/.zshrc_local ] ; then
  source $HOME/.zshrc_local
fi

# added by travis gem
[ -f /home/haya14busa/.travis/travis.sh ] && source /home/haya14busa/.travis/travis.sh
