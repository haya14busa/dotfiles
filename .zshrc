# 少し凝った zshrc

########################################
# 環境変数

# export LC_ALL=C
# export LANG=en_US.UTF-8
# export LANG=ja_JP.UTF-8
# export LC_MESSAGES=ja_JP.UTF-8
# export LC_MESSAGES=en_US.UTF-8
# export LC_IDENTIFICATION=ja_JP.UTF-8
# export LC_COLLATE=ja_JP.UTF-8
# export LANG=ja_JP.UTF-8
# export LC_MEASUREMENT=ja_JP.UTF-8
# export LC_CTYPE=ja_JP.UTF-8
# export LC_TIME=ja_JP.UTF-8
# export LC_NAME=ja_JP.UTF-8

export LANG="ja_JP.UTF-8"
export LC_CTYPE="ja_JP.UTF-8"
export LC_NUMERIC="ja_JP.UTF-8"
export LC_TIME="ja_JP.UTF-8"
export LC_COLLATE="ja_JP.UTF-8"
export LC_MONETARY="ja_JP.UTF-8"
export LC_MESSAGES="ja_JP.UTF-8"
export LC_PAPER="ja_JP.UTF-8"
export LC_NAME="ja_JP.UTF-8"
export LC_ADDRESS="ja_JP.UTF-8"
export LC_TELEPHONE="ja_JP.UTF-8"
export LC_MEASUREMENT="ja_JP.UTF-8"
export LC_IDENTIFICATION="ja_JP.UTF-8"

# 色を使用出来るようにする
autoload -Uz colors
colors

# emacs 風キーバインドにする
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
    #LANG=en_US.UTF-8 vcs_info
	LANG=ja_JP.UTF-8 vcs_info
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
export GOROOT=$HOME/go
export GOOS=linux
# export GOARCH=amd64
# export GOARCH=386
export GOBIN=$GOROOT/bin
export PATH=$PATH:$GOBIN



function exists { which $1 &> /dev/null }

# percol
if exists percol; then

    function percol-src () {
        local selected_dir=$(ghq list --full-path | percol --query "$LBUFFER")
        if [ -n "$selected_dir" ]; then
            BUFFER="cd ${selected_dir}"
            zle accept-line
        fi
        zle clear-screen
    }
    zle -N percol-src


    function percol_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }
    zle -N percol_select_history

    bindkey '^R' percol_select_history
    bindkey '^O' percol-src

    # open git tracked files with vim
    alias vimr='vim $(git ls-files | percol)'

fi

