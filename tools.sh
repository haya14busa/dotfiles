#!/bin/sh

path_to_dot_peco=$(ghq root)/github.com/haya14busa/.peco

if [ ! -d $path_to_dot_peco ] ; then
  ghq get git@github.com:haya14busa/.peco.git
fi

if [ ! -d $HOME/.peco ] ; then
  ln -s $(ghq root)/github.com/haya14busa/.peco $HOME/.peco
fi

