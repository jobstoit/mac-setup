#!/bin/sh
sudo echo "Removing dotnet"
sudo rm -rf $(which dotnet omnisharp) $DOTNET_ROOT /usr/local/omnisharp ~/.vim/bundle/omnisharp-vim
sed -i '' 's/export DOTNET_ROOT=\/usr\/local\/dotnet//' ~/.bash_profile
sed -i '' 's/export PATH=\$HOME\/\.dotnet\tools:\$PATH//' ~/.bash_profile
sed -i '' 's/" Omnisharp configuration//' ~/.vim/vimrc
sed -i '' "s/let g:OmniSharp_server_path = '\/usr\/local\/omnisharp\/run'//" ~/.vim/vimrc
sed -i '' 's/let g:SuperTabDefaultCompletionTypeDescovery = \["\&omnifunc:<c-x><c-o>","\&completefunc:<c-x><c-n>"\]//' ~/.vim/vimrc
