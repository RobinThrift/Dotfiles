#!/bin/sh

if test "$(uname)" = "Darwin"
then
    echo "Installing Homebrew for you."

    # install  homebrew if not already installed
    if test ! $(which brew)
    then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    brew update
    brew upgrade

    source ./brews.sh
    source ./casks.sh
fi

