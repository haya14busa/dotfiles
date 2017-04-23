#!/bin/sh

## Lua ##
# git clone http://luajit.org/git/luajit-2.0.git
# cd luajit-2.0
# make && sudo make install
#########

# LDFLAGS="-Wl,-rpath=${HOME}/.pyenv/versions/2.7.10/lib:${HOME}/.pyenv/versions/3.5.0/lib" \
./configure \
--enable-fail-if-missing \
--with-features=huge \
--enable-perlinterp \
--enable-rubyinterp \
--enable-pythoninterp=yes \
--enable-python3interp=yes \
--enable-multibyte \
--enable-fontset \
--enable-gui=gtk2 \
--disable-netbeans \
--disable-darwin \
--disable-selinux \
--disable-smack \
--enable-luainterp=dynamic \
--with-luajit \
--with-lua-prefix=/usr \
--enable-cscope \
--enable-largefile \
