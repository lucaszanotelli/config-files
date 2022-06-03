#!/bin/bash

mkdir -p ~/.config/nvim
cp init.vim ~/.config/nvim/
cat .bash_profile >> ~/.bash_profile
cat .bash_aliases >> ~/.bash_aliases
source .bash_profile
source .bash_aliases
