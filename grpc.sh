#! /bin/sh
sudo echo 'installing gRPC...'
curl -o temp.zip -L https://github.com/protocolbuffers/protobuf/releases/download/v3.8.0/protoc-3.8.0-osx-x86_64.zip && \
	sudo unzip -q -d /usr/local/protoc temp.zip && \
	rm temp.zip &&
	ln -f -s /usr/local/protoc/bin/* /usr/local/bin/

protoc --version
