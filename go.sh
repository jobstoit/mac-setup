# install go
sudo echo 'Installing go...'
curl https://dl.google.com/go/go1.12.1.darwin-amd64.tar.gz | sudo tar -C /usr/local -xz
ln -f -s /usr/local/go/bin/* /usr/local/bin/
curl -sfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh| sh -s -- -b /usr/local/go/bin v1.17.1
curl https://raw.githubusercontent.com/golang/dep/master/install.sh | INSTALL_DIRECTORY=/usr/local/go/bin sh
ln -f -s /usr/local/go/bin/* /usr/local/bin/
printf "export GOPATH=\$HOME/.go\nexport GOROOT=/usr/local/go\n" >> $HOME/.bash_profile 
source $HOME/.bash_profile
mkdir -p $GOPATH/bin
