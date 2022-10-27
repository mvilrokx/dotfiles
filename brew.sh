#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install a modern version of Bash.
brew install bash
brew install bash-completion@2

# Switch to using brew-installed bash as default shell
#if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
#  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
#  chsh -s "${BREW_PREFIX}/bin/bash";
#fi;

# Install `wget` with IRI support.
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install openssh
brew install screen

# Install fonts
brew install svn
brew tap homebrew/cask-fonts
brew install --cask font-clear-sans
brew install --cask font-hack-nerd-font
brew install --cask font-roboto
brew install --cask font-source-code-pro

# Install drivers
brew tap homebrew/cask-drivers
brew install logitech-options

# Install other useful binaries.
brew install ack
brew install ansible
brew install automake
brew install brew-cask-completion
brew install dockutil
brew install gawk
brew install git
brew install git-lfs
brew install gperf
brew install gradle
brew install grep
brew install help2man
brew install httpie
brew install hub
brew install imagemagick
brew install jq
brew install kcat
brew install libtool
brew install mackup
brew install maven
brew install mas
brew install node
brew install nvm
brew install openssl
brew install p7zip
brew install pigz
brew install pv
brew install pyenv
brew install rename
brew install ssh-copy-id
# not supported
# brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb
brew install telnet
brew install tmux
brew install trash
brew install tree
brew install ttyrec
brew install ykman

# Install Applications.
brew install --cask 1password
brew install --cask temurin
brew install --cask alfred
brew install --cask bettertouchtool
brew install --cask caffeine
brew install --cask dash
brew install --cask dbeaver-community
brew install --cask devtoys
# conflicts with rancher so choose this or rancher
# brew install --cask docker
brew install --cask drawio
brew install --cask dropbox
brew install --cask firefox
brew install --cask google-chrome
brew install --cask gpg-suite
brew install --cask intellij-idea
brew install --cask iterm2
brew install --cask licecap
brew install --cask notable
brew install --cask postman
brew install --cask private-internet-access
brew install --cask rancher
brew install --cask slack
brew install --cask spotify
brew install --cask stoplight-studio
brew install --cask typora
brew install --cask virtualbox
brew install --cask visual-studio-code
brew install --cask vlc
brew install --cask xquartz
brew install --cask zoom

# Install apps from the App Store
# requires mas, which is installed in the above brews
mas install 1451685025  # WireGuard
mas install 1475387142  # Tailscale
mas install 595191960   # CopyClip
mas install 1439900554  # Aruba VIA

# Remove outdated versions from the cellar.
brew cleanup
