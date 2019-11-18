#!/bin/sh
sudo echo 'Removing go...'
sudo rm -rf $(which go golangci-lint dep) $GOPATH $GOROOT ~/.vim/bundle/vim-go

sed -i '' 's/export GOPATH=\$HOME\/\.go//' ~/.bash_profile
sed -i '' 's/export GOROOT=\/usr\/local\/go//' ~/.bash_profile
sed -i '' 's/export PATH=\$GOPATH\/bin:\$PATH//' ~/.bash_profile

sed -i '' 's/" go configuration//' ~/.vim/vimrc
sed -i '' 's/let g:go_fmt_command = "goimports"//' ~/.vim/vimrc
sed -i '' 's/let g:go_metalinter_autosave = 1//' ~/.vim/vimrc

