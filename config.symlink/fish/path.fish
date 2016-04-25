# SETUP THE $PATH

# --------------------------------------------------
# Android Dev Tools 
# --------------------------------------------------
set -l android_sdk_path "$HOME/ASDK/tools"
if [ -d "$android_sdk_path" ]
    set -xg ANDROID_SDK_PATH "$android_sdk_path"
end

# --------------------------------------------------
# Extras 
# --------------------------------------------------
set -l extras_path "$HOME/.extras"
if [ -d "$extras_path" ]
    set -xg EXTRAS_PATH "$extras_path"
end


# --------------------------------------------------
# Go
# --------------------------------------------------
set -l gobin_path "$GOPATH/bin"
if [ -d "$gobin_path" ]
    set -xg GOBIN_PATH "$gobin_path"
    set -xg GOROOT_PATH "$GOROOT/bin"
end

set PATH /usr/local/bin $ANDROID_SDK_PATH $EXTRAS_PATH $GOBIN_PATH $GOROOT_PATH $PATH
