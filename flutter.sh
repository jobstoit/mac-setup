# install flutter
[ $# = 1 ] && FLUTTER_VERSION=$1
[ -z $FLUTTER_VERSION ] && FLUTTER_VERSION='v1.12.13+hotfix.8'

sudo echo 'Installing flutter...'

[ "$( which flutter )" != "/usr/local/bin/flutter" ] && \
	curl -o temp.zip -sL "https://storage.googleapis.com/flutter_infra/releases/stable/macos/flutter_macos_${FLUTTER_VERSION}-stable.zip" && \
	sudo unzip -q -d /usr/local/ temp.zip && \
	rm temp.zip && \
	sudo chown -R $USER /usr/local/flutter && \
	ln -f -s /usr/local/flutter/bin/* /usr/local/bin/

brew update
brew install --HEAD usbmuxd
brew link usbmuxd
brew install --HEAD libimobiledevice
brew install ideviceinstaller
brew install ios-deploy
brew install cocoapods
pod setup

# Vim configuration
[ -d ~/.vim ] && \
	git clone -q https://github.com/thosakwe/vim-flutter.git ~/.vim/bundle/vim-flutter && \
	git clone https://github.com/dart-lang/dart-vim-plugin ~/.vim/bundle/dart-vim-plugin && \
	printf "\" Flutter configuration\n" >> ~/.vim/vimrc && \
	printf "let g:flutter_command = \"flutter\"\n" >> ~/.vim/vimrc && \
	printf "let g:flutter_hot_reload_on_save = 1\n" >> ~/.vim/vimrc && \
	printf ":command SimulatorStart !open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app\n" >> ~/.vim/vimrc && \
	printf ":command SimulatorStop !osascript -e 'quit app \"Simulator\"'\n" >> ~/.vim/vimrc

# VsCode Setup
[ -n $(which code) ] && code --install-extension dart-code.flutter

flutter
