#!/usr/bin/env bash

## check if we are on macos
if [[ "$(uname)" == "Darwin" ]]; then
    ## brew check
    brew doctor
    brew update
    ## nvim & deps
    brew install nvim
    brew install ripgrep
    ## debuggers & lsp
    brew install luarocks
    brew install openjdk
    brew install mvn
    brew install node npm
    brew install golang
	
    ## done
    echo -ne "Fin\n"

elif [[ "$(uname)" == "Linux" ]]; then
    echo -ne "Not implemented for Linux systems!\n"
    exit 1

else
    echo -ne "Unable to determine system type\n"
    exit 1

fi
