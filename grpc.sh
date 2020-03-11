#! /bin/sh
set -eux

PROTOC_VERSION='3.8.0'

if [ $# = 1 ]
then
	PROTOC_VERSION=$1
fi

sudo echo 'installing gRPC...'
curl -o temp.zip -L "https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOC_VERSION}/protoc-${PROTOC_VERSION}-osx-x86_64.zip" && \
	sudo unzip -q -d /usr/local/protoc temp.zip && \
	rm temp.zip &&
	ln -f -s /usr/local/protoc/bin/* /usr/local/bin/

protoc --version
