# install flutter
sudo echo 'Installing flutter...'
curl -o temp.zip -L https://storage.googleapis.com/flutter_infra/releases/stable/macos/flutter_macos_v1.5.4-hotfix.2-stable.zip
unzip -q -d $HOME temp.zip
rm temp.zip
sudo mv $HOME/flutter /usr/local/flutter
ln -f -s /usr/local/flutter/bin/flutter /usr/local/bin/flutter
flutter
