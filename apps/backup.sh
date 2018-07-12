#!/usr/bin/env bash

brew bundle dump --force --file=~/.dotfiles/apps/Brewfile
mackup backup -f
