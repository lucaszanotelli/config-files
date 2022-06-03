#!/bin/sh

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.config/nvim
cp init.vim ~/.config/nvim/
cat .bash_profile >> ~/.bash_profile
cat .bash_aliases >> ~/.bash_aliases
source ~/.bash_profile
source ~/.bash_aliases
