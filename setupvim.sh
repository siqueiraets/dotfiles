#!/bin/sh

mkdir -p ~/.vimbackup
mkdir -p ~/.vimundo
vim +PluginInstall +qall
