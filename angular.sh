#! /bin/sh
sudo echo "installing angular"

NODE_VERSION=12.16.1

[ "$( which node )" != "/usr/local/bin/node" ] && \
       curl -sL https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-darwin-x64.tar.gz | sudo tar -C /usr/local -xz && \
       ln -f -s /usr/local/node-${NODE_VERSION}-darwin-x64/bin/* /usr/local/bin/

[ "$( which npm )" != "npm not found" ] && \
	sudo npm i -g npm

[ "$( which ng )" == "ng not found" ] && \
	npm i @angular/cli typescript

[ -d ~/.vim ] &&
	git clone https://github.com/mattn/emmet-vim.git ~/.vim/bundle/emmet-vim && \
	git clone https://github.com/burnettk/vim-angular.git ~/.vim/bundle/vim-angular && \
	git clone https://github.com/leafgarland/typescript-vim.git ~/.vim/bundle/typescript-vim && \
	git clone https://github.com/Quramy/tsuquyomi.git ~/.vim/bundle/tsuquyomi && \
	printf "\nlet g:angular_source_directory = 'app/source'\nlet g:angular_test_directory = 'test/units'\nlet g:angular_find_ignore = ['build/', 'dist/']\nautocmd FileType typescript setlocal softtabstop=2 shiftwidth=2" >> ~/.vim/vimrc

[ -z $( which code ) ] || \
	code --install-extension johnpapa.angular-essentials

