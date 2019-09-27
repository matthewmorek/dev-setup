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
cp -r init/minimal ~/.antigen/bundles/custom/ 2> /dev/null

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

# Install other useful binaries.
brew install ack
brew install git
brew install git-extras
brew install screenfetch
brew install imagemagick
brew install ssh-copy-id
brew install tree
brew install pkg-config libffi

# Install useful ZSH extensions
brew install zsh-autosuggestions zsh-completions zsh-syntax-highlighting

# Install Heroku
brew install heroku/brew/heroku
heroku update

# Core casks
brew cask install gpg-suite
brew cask install iterm2
brew cask install 1password
brew cask install alfred
brew cask install bartender
brew cask install archiver
brew cask install transmit
brew cask install shimo
brew cask install soundsource
brew cask install rocket

# Development tool casks
brew cask install sublime-text
brew cask install visual-studio-code
brew cask install macdown
brew cask install sequel-pro
brew cask install colorsnapper
brew cask install iconjar
brew cask install paw
brew cask install kaleidoscope
brew cask install dash
brew cask install tower

# Misc casks
brew cask install chromium
brew cask install firefox
brew cask install spotify
brew cask install slack
brew cask install gifox
brew cask install fantastical
brew cask install discord
brew cask install numi
brew cask install vox
brew cask install transmission
brew cask install wifi-explorer
brew cask install iina
brew cask install daisydisk
brew cask install pdf-expert
brew cask install hazel
brew cask install pocket-casts
brew cask install istat-menus


# Install Docker, which requires virtualbox
#brew install docker
#brew install boot2docker

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzip qlimagesize webpquicklook suspicious-package quicklookase qlvideo

# Remove outdated versions from the cellar.
brew cleanup
