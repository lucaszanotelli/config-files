#!/bin/sh

curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p $HOME/.config/nvim
cp init.vim $HOME/.config/nvim/
cat .bash_profile >> $HOME/.bash_profile
cat .bash_aliases >> $HOME/.bash_aliases
source $HOME/.bash_profile
source $HOME/.bash_aliases
