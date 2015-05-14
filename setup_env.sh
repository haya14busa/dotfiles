#!/bin/sh

exists() {
  which $1 &> /dev/null
}

cmdinstall() {
  if ! exists $1; then
    $HOME/.anyenv/bin/anyenv install $1
  fi
}

envinstall() {
  env=$1
  version=$2
  if [ ! -d $HOME/.anyenv/envs/$env/versions/$version ] ; then
    $HOME/.anyenv/envs/$env/bin/$env install $version
    $HOME/.anyenv/envs/$env/bin/$env global $version
  fi
}

if [ ! -d ${HOME}/.anyenv ] ; then
  git clone https://github.com/riywo/anyenv ~/.anyenv
fi

ANYENV_ROOT=$($HOME/.anyenv/bin/anyenv root)

if [ ! -d $ANYENV_ROOT/plugins/anyenv-update ] ; then
  if [ ! -d $ANYENV_ROOT/plugins ] ; then
    mkdir -p $ANYENV_ROOT/plugins
  fi
  git clone https://github.com/znz/anyenv-update.git $ANYENV_ROOT/plugins/anyenv-update
fi

cmdinstall rbenv
cmdinstall pyenv
cmdinstall ndenv
cmdinstall jenv
cmdinstall goenv

envinstall rbenv 2.2.1
envinstall pyenv 3.4.3
envinstall ndenv v0.12.1
# jenv doesn't support install
envinstall goenv 1.4
