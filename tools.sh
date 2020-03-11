# install brew
set -eux
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
xcode-select --install

# Install dev tools
brew cask install docker
brew cask install visual-studio-code
