#!/bin/sh

if test "$(uname)" = "Darwin"
then

    # install  homebrew if not already installed
    if test ! $(which brew)
    then
        echo "Installing Homebrew for you."
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        echo "Installing Casks"
        brew install caskroom/cask/brew-cask
    fi

    brew update
    brew upgrade

    source ./brew/brews.sh
    source ./brew/casks.sh
fi

