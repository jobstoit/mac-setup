#!/bin/sh
sudo echo 'Removing flutter...'
sudo rm -rf $(which flutter) /usr/local/flutter ~/.vim/bundle/vim-flutter
brew uninstall usbmuxd libimobiledevice ideviceinstaller ios-deploy cocoapods

if [ -d ~/.vim ]
then
	sed -i '' '/" Flutter configuration/d' ~/.vim/vimrc
	sed -i '' '/let g:flutter_command = "flutter"/d' ~/.vim/vimrc
	sed -i '' '/let g:flutter_hot_reload_on_save = 1/d' ~/.vim/vimrc
	sed -i '' '/:command SimulatorStart !open \/Application\/Xcode.app\/Contents\/Developer\/Applications\/Simulator.app/d' ~/.vim/vimrc
	sed -i '' "/:command SimulatorStop !osascript -e 'quit app \"Simulator\"'/d" ~/.vim/vimrc
fi

if [ -n $(which code) ]
then
	code --uninstall-extension dart-code.flutter
fi
