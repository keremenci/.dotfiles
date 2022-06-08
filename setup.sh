#!/bin/sh

#### WIP ####

# install p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# symlinks

# bash
# Currently none

# zsh

ln -s ./.zshrc ~/.zshrc
ln -s ./.p10k.zsh ~/.p10k.zsh

# vim

ln -s ./.vimrc ~/.vimrc

# nvim

mkdir -p ~/.config/nvim
ln -s ./init.vim ~/.config/nvim/init.vim
