#!/bin/sh
apt-get update && apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl software-properties-common


## Docker公式のGPG鍵を追加
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

## Dockerのaptリポジトリの追加
add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

## containerdのインストール
apt-get update && apt-get install -y containerd.io


# containerdの設定
mkdir -p /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml

# containerdの再起動
systemctl restart containerd