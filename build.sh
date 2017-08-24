#!/bin/sh
set -e
apk add --update go git mercurial build-base ca-certificates
mkdir -p /go/src/github.com/adopteunops
cp -r /src /go/src/github.com/adopteunops/logspout
cd /go/src/github.com/adopteunops/logspout
export GOPATH=/go
go get
go build -ldflags "-X main.Version=$1" -o /bin/logspout
apk del go git mercurial build-base
rm -rf /go
rm -rf /var/cache/apk/*

# backwards compatibility
ln -fs /tmp/docker.sock /var/run/docker.sock
