#! /bin/sh

[ -d /usr/local/node ] && \
	rm -rf /usr/local/node* /usr/local/bin/node /usr/local/bin/npm /usr/local/bin/npx

[ -d ~/.vim ] && \
	rm -rf ~/.vim/bundle/emmet-vim ~/.vim/bundle/vim-angular ~/.vim/bundle/typescript-vim ~/.vim/bundle/tsuquyomi &&
	sed -i '' -e "/let g:angular_source_directory = 'app\/source'/d" \
		-e "/let g:angular_test_directory = 'test\/units'/d" \
		-e "/let g:angular_find_ignore = \['build\/', 'dist\/'\]/d" \
		-e "/autocmd FileType typescript setlocal softtabstop=2 shiftwidth=2/d" \
		~/.vim/vimrc

[ -z $( which code ) ] || \
	code --uninstall-extension johnpapa.angular-essentials
