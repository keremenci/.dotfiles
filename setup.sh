#!/bin/sh

#### WIP ####

DOTFILES_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

DOTFILES=$HOME/.dotfiles

DIRECTORIES=$(for d in */ ; do
    printf "%s " "$(echo $d | head -c -2)"
    echo
done)

#TODO install oh-my-zsh

# install p10k #TODO check if exists
#git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# symlinks

# TODO handle hidden files

for DIR in $DIRECTORIES; do
    case $DIR in
 
        kitty)
 
            echo "Configuring $DIR"
            CONFIG_DIR=$HOME/.config/$DIR

            [ -d $CONFIG_DIR ] || mkdir -p $CONFIG_DIR

            for FILE in $(ls -A $DIR) ; do
                if [ -e $CONFIG_DIR/$FILE ] ; then
                    printf "renaming %s as\n\t %s" "$CONFIG_DIR/$FILE" "$CONFIG_DIR/${FILE}.old"
                    mv -f $CONFIG_DIR/$FILE $(echo "$CONFIG_DIR/${FILE}.old")
                fi
                    
            done

            # Won't work with hidden files,
            # see https://stackoverflow.com/questions/1347105/how-do-i-symlink-all-files-from-one-directory-to-another-in-bash
            
            ln -sfn $DOTFILES_DIR/$DIR/* $CONFIG_DIR
        ;;
 
        zsh)

 
    esac
done

#[ -e ~/.zshrc ] || mv ~/.zshrc ~/.zshrc.old
#[ -e ~/.p10k.zsh ] || mv ~/.p10k.zsh ~/.p10k.zsh.old

#ln -s $DOTFILES/zsh/.zshrc ~/.zshrc
#ln -s $DOTFILES/zsh/.p10k.zsh ~/.p10k.zsh

# vim

#ln -s ./.vimrc ~/.vimrc

# nvim

#mkdir -p ~/.config/nvim
#ln -s ./init.vim ~/.config/nvim/init.vim
