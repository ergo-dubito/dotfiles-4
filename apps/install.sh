#!/usr/bin/env bash

info() {
  fmt="$1"; shift
  # shellcheck disable=SC2059
  printf "$fmt\n" "$@"
}

set -e

# Install Xcode Command Line Tools
if ! $(xcode-select -p &>/dev/null); then
  xcode-select --install &>/dev/null

  # Wait until the Xcode Command Line Tools are installed
  until $(xcode-select -p &>/dev/null); do
    sleep 5
  done
fi

# Accept the Xcode/iOS license agreement
if ! $(sudo xcodebuild -license status); then
  sudo xcodebuild -license accept
fi

brew bundle install --file=~/.dotfiles/apps/Brewfile

ln -sfv ~/.dotfiles/apps/.mackup ~/.mackup
ln -sfv ~/.dotfiles/apps/.mackup.cfg ~/.mackup.cfg
mackup restore -f
