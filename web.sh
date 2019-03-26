#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

brew install yarn

# Remove outdated versions from the cellar.
brew cleanup

# Install global dependencies using Yarn
yarn global add babel
yarn global add eslint
yarn global add ghost-cli
yarn global add node-sass
yarn global add prettier
yarn global add sass-lint
yarn global add serve
yarn global add vue-cli

# Configure Git
git config --global core.editor "nano"
git config --global user.name "Matthew Morek"
git config --global user.email "matthew@madbit.co"
git config --global merge.tool "Kaleidoscope"
git config --global diff.tool "Kaleidoscope"
