# install go
sudo echo 'Installing go...'
curl https://dl.google.com/go/go1.12.1.darwin-amd64.tar.gz | sudo tar -C /usr/local -xz
ln -f -s /usr/local/go/bin/go /usr/local/bin/go 
printf "export GOPATH=\$HOME/.go\nexport GOROOT=/usr/local/go\n" >> $HOME/.bash_profile 
source $HOME/.bash_profile
mkdir -p $GOPATH/bin
sudo curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
