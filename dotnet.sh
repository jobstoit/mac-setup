#!/bin/sh
set -eux
sudo echo "Installing dotnet..."
sudo rm -rf /usr/local/dotnet /usr/local/omnisharp /usr/local/bin/dotnet /usr/local/bin/omnisharp
sudo mkdir -p /usr/local/dotnet /usr/local/omnisharp
curl -sL https://download.visualstudio.microsoft.com/download/pr/10849a7b-0617-49c9-96a2-d5b342648605/ec035ba49342820c1a47485ce325f51c/dotnet-sdk-3.1.100-preview2-014569-osx-x64.tar.gz | sudo tar -C /usr/local/dotnet -xz
curl -sL https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v1.34.5/omnisharp-osx.tar.gz | sudo tar -C /usr/local/omnisharp -xz
ln -f -s /usr/local/dotnet/dotnet /usr/local/bin/dotnet
ln -f -s /usr/local/omnisharp/run /usr/local/bin/omnisharp

printf "export DOTNET_ROOT=/usr/local/dotnet\n" >> $HOME/.bash_profile
printf "export PATH=\$HOME/.dotnet/tools:\$PATH\n" >> $HOME/.bash_profile
printf "export MSBuildSDKsPath=\$DOTNET_ROOT/sdk/\$(dotnet --version)/Sdks\n" >> $HOME/.bash_profile

git clone -q https://github.com/OmniSharp/omnisharp-vim.git ~/.vim/bundle/omnisharp-vim
printf "\" Omnisharp configuration\n" >> ~/.vim/vimrc
printf "let g:OmniSharp_server_stdio = 1\n" >> ~/.vim/vimrc
printf "let g:OmniSharp_server_path = '/usr/local/omnisharp/run'\n" >> ~/.vim/vimrc
printf "let g:SuperTabDefaultCompletionTypeDiscovery = [\"&omnifunc:<c-x><c-o>\", \"&completefunc:<c-x><c-n>\"]\n" >> ~/.vim/vimrc

if [ -n $(which code) ]
then
	code --install-extension ms-vscode.csharp
fi

dotnet tool install --global dotnet-ef
