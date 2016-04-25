# --------------------------------------------------
# EXPORTS
# --------------------------------------------------

set -xg EDITOR "vim";

# Prefer GB English and use UTF-8.
set -xg  LANG "en_GB.UTF-8";
set -xg LC_ALL "en_GB.UTF-8";

# Highlight section titles in manual pages.
set -xg LESS_TERMCAP_md "$yellow";

# Go
set -xg GOPATH "$HOME/golang"
set -xg GOROOT "/usr/local/opt/go/libexec"

# Don’t clear the screen after quitting a manual page.
set -xg MANPAGER "less -X";
