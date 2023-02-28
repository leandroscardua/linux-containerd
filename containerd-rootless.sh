#/bin/bash

repo=containerd/nerdctl

version=$(curl --silent "https://api.github.com/repos/$repo/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

echo "${version//v}"

wget https://github.com/containerd/nerdctl/releases/download/v${version//v}/nerdctl-full-${version//v}-linux-amd64.tar.gz
sudo tar xvzf nerdctl-full-${version//v}-linux-amd64.tar.gz -C /usr/local
containerd-rootless-setuptool.sh install
