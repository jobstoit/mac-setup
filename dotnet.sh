#!/bin/sh
sudo echo "Installing dotnet..."
sudo rm -rf /usr/local/dotnet /usr/local/omnisharp /usr/local/bin/dotnet /usr/local/bin/omnisharp
sudo mkdir -p /usr/local/dotnet /usr/local/omnisharp
curl -sL https://download.visualstudio.microsoft.com/download/pr/b9251194-4118-41cb-ae05-6763fb002e5d/1d398b4e97069fa4968628080b617587/dotnet-sdk-3.0.100-osx-x64.tar.gz | sudo tar -C /usr/local/dotnet -xz
curl -sL https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v1.34.5/omnisharp-osx.tar.gz | sudo tar -C /usr/local/omnisharp -xz
ln -f -s /usr/local/dotnet/dotnet /usr/local/bin/dotnet
ln -f -s /usr/local/omnisharp/run /usr/local/bin/omnisharp

printf "export DOTNET_ROOT=/usr/local/dotnet\n" >> $HOME/.bash_profile
printf "export PATH=\$HOME/.dotnet/tools:\$PATH\n" >> $HOME/.bash_profile

git clone -q https://github.com/OmniSharp/omnisharp-vim.git ~/.vim/bundle/omnisharp-vim
printf "\" Omnisharp configuration\n" >> ~/.vim/vimrc
printf "let g:Omnisharp_server_use_mono = 1\n" >> ~/.vim/vimrc
printf "let g:Omnishapr_server_stdio = 1\n" >> ~/.vim/vimrc
printf "let g:ale_linters = { 'cs': ['OmniSharp'] }\n" >> ~/.vim/vimrc
printf "let g:SuperTabDefaultCompletionTypeDiscovery = [\"&omnifunc:<c-x><c-o>\", \"&completefunc:<c-x><c-n>\"]\n" >> ~/.vim/vimrc
