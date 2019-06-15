# install go
sudo curl https://dl.google.com/go/go1.12.1.darwin-amd64.tar.gz | sudo tar -C /usr/local -xz
ln -f -s /usr/local/go/bin/go /usr/local/bin/go 
GOPATH=$HOME/.go
mkdir -p $GOPATH/bin
sudo curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
