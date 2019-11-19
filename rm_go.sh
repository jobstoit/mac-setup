#!/bin/sh
sudo echo 'Removing go...'
sudo rm -rf $(which go golangci-lint dep) $GOPATH $GOROOT ~/.vim/bundle/vim-go

sed -i '' '/export GOPATH=\$HOME\/\.go/d' ~/.bash_profile
sed -i '' '/export GOROOT=\/usr\/local\/go/d' ~/.bash_profile
sed -i '' '/export PATH=\$GOPATH\/bin:\$PATH/d' ~/.bash_profile

sed -i '' '/" go configuration/d' ~/.vim/vimrc
sed -i '' '/let g:go_fmt_command = "goimports"/d' ~/.vim/vimrc
sed -i '' '/let g:go_metalinter_autosave = 1/d' ~/.vim/vimrc

