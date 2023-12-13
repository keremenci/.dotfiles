#!/bin/bash

#### WIP ####

# WTF IS THIS mv ~/.config/nvim{,.bak}

DOTFILES_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

DIRECTORIES=$(for d in */ ; do
    printf "%s " "$(echo $d | head -c -2)"
done)


whiptail --clear --title "Welcome" \
	--msgbox "This script will now install all the dotfiles I use for my setup." 10 60




#TODO install oh-my-zsh

# install p10k #TODO check if exists
#git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# symlinks

# TODO handle hidden files

OPTIONS=""

for DIR in $DIRECTORIES; do
	OPTIONS+="$(printf "%s %s " "$DIR" "OFF")"
done

OPTIONS=($OPTIONS)

CHOICES=$(whiptail --separate-output --noitem \
	--title "Config Selection" \
    --checklist "Select configs to apply \nSelect: <space>\nApply : <enter>" $(expr ${#OPTIONS[@]} + 5 ) 40 $(expr ${#OPTIONS[@]} / 2 ) \
  ${OPTIONS[@]} 3>&1 1>&2 2>&3)


for DIR in $CHOICES; do
echo $DIR
    case $DIR in

        kitty)

            echo "Configuring $DIR"
            CONFIG_DIR=$HOME/.config/$DIR

            [ -d $CONFIG_DIR ] || mkdir -p $CONFIG_DIR

            for FILE in $(ls -A $DIR) ; do
                if [ -e $CONFIG_DIR/$FILE ] && [ ! -L $CONFIG_DIR/$FILE ] ; then
                    printf "renaming %s as\n\t %s" "$CONFIG_DIR/$FILE" "$CONFIG_DIR/${FILE}.old"
                    mv -f $CONFIG_DIR/$FILE $(echo "$CONFIG_DIR/${FILE}.old")
                fi

            done

            # Won't work with hidden files,
            # see https://stackoverflow.com/questions/1347105/how-do-i-symlink-all-files-from-one-directory-to-another-in-bash

            ln -sfn $DOTFILES_DIR/$DIR/* $CONFIG_DIR
        ;;

        zsh)
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
            git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

            CONFIG_DIR=$HOME

            #[ -e ~/.zshrc ] || mv ~/.zshrc ~/.zshrc.old
            #[ -e ~/.p10k.zsh ] || mv ~/.p10k.zsh ~/.p10k.zsh.old
            ln -sfn $DOTFILES_DIR/zsh/.zshrc $CONFIG_DIR/.zshrc
            ln -sfn $DOTFILES_DIR/zsh/.p10k.zsh $CONFIG_DIR/.p10k.zsh


    esac
done

install_kitty () {
    if [ -f "/etc/arch-release" ]; then
      ...
    else
      ...
    fi
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
}



# vim

#ln -s ./.vimrc ~/.vimrc

# nvim

#mkdir -p ~/.config/nvim
#ln -s ./init.vim ~/.config/nvim/init.vim
