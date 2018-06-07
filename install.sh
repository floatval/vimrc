#!/bin/bash

vimHome="$HOME/.vim"
if [ -e $vimHome ]
then
  git clone https://github.com/floatval/vimrc vimHome
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
  mkdir -p vimHome
  git clone https://github.com/floatval/vimrc vimHome
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim -c :PluginInstall
