# install flutter
curl -o temp.zip -L https://storage.googleapis.com/flutter_infra/releases/stable/macos/flutter_macos_v1.5.4-hotfix.2-stable.zip
unzip -q -d $HOME temp.zip
rm temp.zip
mv $HOME/flutter $HOME/.mob
ln -f -s $HOME/.mob/bin/flutter /usr/local/bin/flutter
