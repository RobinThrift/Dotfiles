#!/usr/bin/env bash

brew install coreutils

# Install Bash 4
# add `/usr/local/bin/bash` to `/etc/shells`
brew install bash
brew install bash-completion

brew install wget --with-iri

# tools
brew install neovim
brew install tmux
brew install reattach-to-user-namespace
brew install git
brew install tree
brew install fzf
brew install ripgrep
brew install mas
brew install git-delta
brew install wezterm

# runtimes and langs
brew install node
brew install go

# cleanup after yourself!
brew cleanup
