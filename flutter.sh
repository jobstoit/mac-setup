# install flutter
sudo echo 'Installing flutter...'
curl -o temp.zip -sL https://storage.googleapis.com/flutter_infra/releases/stable/macos/flutter_macos_v1.9.1+hotfix.2-stable.zip && \
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
git clone -q https://github.com/thosakwe/vim-flutter.git ~/.vim/bundle/vim-flutter
printf "\" Flutter configuration\n" >> ~/.vim/vimrc
printf "let g:flutter_command = \"flutter\"\n" >> ~/.vim/vimrc
printf "let g:flutter_hot_reload_on_save = 1\n" >> ~/.vim/vimrc
printf ":command SimulatorStart !open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app\n" >> ~/.vim/vimrc
printf ":command SimulatorStop !osascript -e 'quit app \"Simulator\"'\n" >> ~/.vim/vimrc

flutter
