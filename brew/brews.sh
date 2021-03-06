#!/usr/bin/env bash

# -----------------------------
# Install all my brew cli stuff
# -----------------------------

# Install newer GNU core utilities 
# add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install Bash 4
# add `/usr/local/bin/bash` to `/etc/shells`
brew install bash
brew install bash-completion

brew install wget --with-iri

# tools
brew install macvim --with-override-system-vim
brew install neovim/neovim/neovim
brew install tmux
brew install reattach-to-user-namespace
brew install git
brew install tree
brew install ctags
brew install fzf
brew install ripgrep
brew install mas

# runtimes and langs
brew install node

# cleanup after yourself!
brew cleanup
