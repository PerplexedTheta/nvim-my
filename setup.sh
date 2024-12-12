#!/usr/bin/env bash

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
    brew install golang cargo

    echo -ne "Fin\n"

elif [[ "$(uname)" == "Linux" ]]; then
    echo -ne "WARNING: Assuming you are on a Debian-based distro\n"
    ## apt check
    apt update
    ## nvim & deps
    apt install build-essential file -y
    apt install python3 python3-pip -y
    apt install neovim -y
    apt install ripgrep -y
    ## debuggers & lsp
    apt install luarocks -y
    apt install default-jre default-jdk -y
    apt install maven -y
    apt install nodejs -y
    apt install golang cargo -y

    echo -ne "Fin\n"

else
    echo -ne "Unable to determine system type\n"
    exit 1

fi
