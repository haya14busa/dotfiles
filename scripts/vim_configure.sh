#!/bin/sh

## Lua ##
# sudo apt install python3 python3-dev
# sudo apt install luajit libluajit-5.1-dev
#########

# LDFLAGS="-Wl,-rpath=${HOME}/.pyenv/versions/2.7.10/lib:${HOME}/.pyenv/versions/3.5.0/lib" \
./configure \
--enable-fail-if-missing \
--with-features=huge \
--enable-python3interp=yes \
--enable-multibyte \
--enable-fontset \
--enable-gui=auto \
--disable-netbeans \
--disable-darwin \
--disable-selinux \
--disable-smack \
--enable-luainterp=dynamic \
--with-luajit \
--enable-cscope \
--enable-largefile \
--with-x \

# --enable-pythoninterp=yes \
# --with-lua-prefix=/usr \
# --enable-perlinterp \
# --enable-rubyinterp \
