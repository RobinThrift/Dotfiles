#!/usr/bin/env bash

# ------------------------------
#
# LINUX BOOTSTRAP
#
# ------------------------------

sudo pacman -S --noconfirm rsync;

function doIt() {
    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap_mac.sh" --exclude "bootstrap_arch.sh"\
    --exclude ".osx" --exclude ".brews" --exclude ".casks" --exclude ".vagrant/" --exclude "vim_colours"\
    --exclude ".arch" --exclude ".arch_apps"\
    --exclude "SETUPVM.md" --exclude "Vagrantfile" --exclude ".gitignore" \
    --exclude "README.md" --exclude "LICENSE-MIT.txt" -avh --no-perms . ~;
    source ~/.bash_profile;
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}


# update this repo
git pull origin master;

# do the install
if [ "$1" == "--install" -o "$1" == "-i" ]; then
    source ./.arch;
    source ./.arch_apps;
    doIt;
    unset doIt;
    exit 0;
fi;


if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt;
    fi;
fi;
unset doIt;


