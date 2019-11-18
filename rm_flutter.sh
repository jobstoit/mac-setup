#!/bin/sh
sudo echo 'Removing flutter...'
sudo rm -rf $(which flutter) /usr/local/flutter ~/.vim/bundle/vim-flutter
brew uninstall usbmuxd libimobiledevice ideviceinstaller ios-deploy cocoapods
sed -i '' 's/" Flutter configuration//' ~/.vim/vimrc
sed -i '' 's/let g:flutter_command = "flutter"//' ~/.vim/vimrc
sed -i '' 's/let g:flutter_hot_reload_on_save = 1//' ~/.vim/vimrc
sed -i '' 's/:command SimulatorStart !open \/Application\/xcode.app\/Contents\/Developer\/Applications\/Simulator.app//' ~/.vim/vimrc
sed -i '' "s/:command SimulatorStop !osascript -e 'quit app \"Simulator\"'//" ~/.vim/vimrc
