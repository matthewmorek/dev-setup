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

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install ZSH
brew install zsh zsh-completions
# We installed the new shell, now we have to activate it
echo "Adding the newly installed shell to the list of allowed shells"
# Prompts for password
sudo zsh -c 'echo /usr/local/bin/zsh >> /etc/shells'
# Change to the new shell, prompts for password
chsh -s /usr/local/bin/zsh

# Install Oh-My-ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Antigen for ZSH
brew install antigen

# Install ZSH profile
cp -r init/.zshrc ~/.zshrc 2> /dev/null

# Install `wget` with IRI support.
brew install wget

# Install Python
brew install python

# Install more recent versions of some OS X tools.
brew install grep
brew install openssh
brew install screen

# Install nano and enable its Brew-based syntax highlighting
brew install nano
echo "include \"/usr/local/share/nano/*.nanorc\"" >> ~/.nanorc
echo "set smooth" >> ~/.nanorc

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install other useful binaries.
brew install ack
#brew install dark-mode
brew install git
brew install git-lfs
brew install git-flow
brew install git-extras
brew install imagemagick
brew install p7zip
brew install ssh-copy-id
brew install tree
brew install pkg-config libffi

# Install useful ZSH extensions
brew install zsh-autosuggestions zsh-completions zsh-syntax-highlighting

# Install Heroku
brew install heroku/brew/heroku
heroku update

# Core casks
brew cask install 1password
brew cask install alfred
brew cask install iterm2
brew cask install archiver
brew cask install transmit
brew cask install tower
brew cask install shimo
brew cask install kaleidoscope
brew cask install dash

# Development tool casks
brew cask install sublime-text
brew cask install macdown
brew cask install sequel-pro
brew cask install colorsnapper

# Misc casks
brew cask install google-chrome
brew cask install firefox
brew cask install slack
brew cask install gifox
brew cask install fantastical
brew cask install rocket
brew cask install discord

# Install Docker, which requires virtualbox
#brew install docker
#brew install boot2docker

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzip qlimagesize webpquicklook suspicious-package quicklookase qlvideo

# Remove outdated versions from the cellar.
brew cleanup
