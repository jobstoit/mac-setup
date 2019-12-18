#!/bin/sh
sudo echo "Removing dotnet"
sudo rm -rf $(which dotnet omnisharp) $DOTNET_ROOT ~/.dotnet /usr/local/omnisharp ~/.vim/bundle/omnisharp-vim

sed -i '' '/export DOTNET_ROOT=\/usr\/local\/dotnet/d' ~/.bash_profile
sed -i '' '/export PATH=\$HOME\/\.dotnet\/tools:\$PATH/d' ~/.bash_profile
sed -i '' '/export MSBuildSDKsPATH=\$DOTNET_ROOT\/sdk\/\$(dotnet --version)\/Sdks/d' ~/.bash_profile

sed -i '' '/" Omnisharp configuration/d' ~/.vim/vimrc
sed -i '' "/let g:OmniSharp_server_stdio = 1/d" ~/.vim/vimrc
sed -i '' "/let g:OmniSharp_server_path = '\/usr\/local\/omnisharp\/run'/d" ~/.vim/vimrc
sed -i '' '/let g:SuperTabDefaultCompletionTypeDiscovery = \["\&omnifunc:<c-x><c-o>", "\&completefunc:<c-x><c-n>"\]/d' ~/.vim/vimrc

if [ -n $(which code) ]
then
	code --uninstall-extension ms-vscode.csharp
fi
