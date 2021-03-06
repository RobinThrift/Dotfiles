# --------------------------------------------------
# ALIASES
# --------------------------------------------------

# Enable aliases to be sudo’ed
alias sudo='sudo '
alias g="git"

alias mpvq="mpv --really-quiet"

# --------------------------------------------------
# dir jumping and listing
# --------------------------------------------------
alias ..="cd .."
alias ...="cd .. ; cd .."

alias ls="ls -G" # list
alias la="ls -Ga" # list all, includes dot files
alias ll="ls -Gl" # long list, excludes dot files
alias lla="ls -Gla" # long list all, includes dot files


# --------------------------------------------------
# tools
# --------------------------------------------------

# top RAM and CPU
alias tram="top -o vsize"
alias tcpu="top -o cpu"

# Highlighted grep
alias grep="grep --color=auto"

# get ip
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Kill all the tabs in Chrome to free up memory
# explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# --------------------------------------------------
# docker
# --------------------------------------------------
alias killdockerc='docker stop (docker ps -a -q)'
alias rmdockerc='docker rm (docker ps -a -q)'


# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
function mergepdf --wraps /System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py; end


# --------------------------------------------------
# Mac Stuff
# --------------------------------------------------

# Copy file path from finder to the clipboard
# src: http://apple.stackexchange.com/a/5495
function fp
    osascript -e 'tell application "Finder"'\
     -e "if (\${1-1} <= (count Finder windows)) then"\
     -e "get POSIX path of (target of window \${1-1} as alias)"\
     -e 'else' -e 'get POSIX path of (desktop as alias)'\
     -e 'end if' -e 'end tell';
end

## alias to copy it to the clipboard
alias cfp="fp | pbcopy"
alias cdfp="cd (fp)"

# Change working directory to the top-most Finder window location
function cdf  # short for `cdfinder`
    cd (osascript -e "tell app \"Finder\" to POSIX path of \(insertion location as alias\)")
end



# --------------------------------------------------
# Other
# --------------------------------------------------
alias :w='echo "You are not in vim, dummy"'
alias :q='exit'
alias fresh='cd ~; clear'
