# Install neovim
sudo echo 'Installing neovim...'
curl -s -L https://github.com/neovim/neovim/releases/download/v0.3.7/nvim-macos.tar.gz | sudo tar -C /usr/local -zx   
ln -f -s /usr/local/nvim-osx64/bin/nvim /usr/local/bin/nvim

git clone https://github.com/jobstoit/nvim.git $HOME/.vim
mkdir -p $HOME/.config/nvim && echo -e "set runtimepath^=\$HOME/.vim runtimepath+=\$HOME/.vim/after\nlet &packpath = &runtimepath\nsource \$HOME/.vim/vimrc" > $HOME/.config/nvim/init.vim
git --git-dir=$HOME/.vim/.git submodule update -i
