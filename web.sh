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

brew install node@10
echo 'export PATH="/usr/local/opt/node@10/bin:$PATH"' >> ~/.zshrc

brew install --ignore-dependencies yarn

source ~/.zshrc

# Remove outdated versions from the cellar.
brew cleanup

# Install global dependencies using Yarn
npm install -g babel
npm install -g eslint
npm install -g ghost-cli
npm install -g prettier
npm install -g serve
npm install -g vue-cli

# Configure Git
git config --global core.editor "nano"
git config --global user.name "Matthew Morek"
git config --global user.email "matthew@madbit.co"
git config --global merge.tool "Kaleidoscope"
git config --global diff.tool "Kaleidoscope"
