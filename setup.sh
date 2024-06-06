#!/usr/bin/env bash

## check if we are on macos
if [[ "$(uname)" != "Darwin" ]]; then
    echo -ne "This script is designed for Darwin systems.\n"
    exit 1
fi

## brew
brew doctor
brew update
brew install nvim
brew install ripgrep

## done
echo -ne "Fin\n"
