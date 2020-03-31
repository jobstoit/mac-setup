#!/bin/sh
sudo echo 'Installing go...'
[ "$(which go)" != "/usr/local/bin/go" ] && \
	curl -s https://dl.google.com/go/go1.13.darwin-amd64.tar.gz | sudo tar -C /usr/local -xz && \
	curl -sfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh| sh -s -- -b /usr/local/go/bin v1.17.1&& \
	curl -s https://raw.githubusercontent.com/golang/dep/master/install.sh | INSTALL_DIRECTORY=/usr/local/go/bin sh && \
	ln -f -s /usr/local/go/bin/* /usr/local/bin/ && \
	mkdir -p ~/.go/bin

printf "export GOPATH=\$HOME/.go\n" >> $HOME/.bash_profile
printf "export GOROOT=/usr/local/go\n" >> $HOME/.bash_profile
printf "export PATH=\$GOPATH/bin:\$PATH\n" >> $HOME/.bash_profile

[ -d ~/.vim ] && \
	git clone -q https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go && \
	printf "\" go configuration\nlet g:go_fmt_command = \"goimports\"\nlet g:go_metalinter_autosave = 1\n" >> ~/.vim/vimrc && \

[ -n $(which code) ] && \
	code --install-extension ms-vscode.Go
