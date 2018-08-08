#!/bin/bash
sudo apt install vim-nox
cp ./.vimrc ~/.vimrc
rm -rf ~/.vim
cp -r .vim ~/
